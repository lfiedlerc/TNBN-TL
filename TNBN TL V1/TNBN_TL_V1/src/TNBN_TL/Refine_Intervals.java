/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package TNBN_TL;

import LIPS.ColumsWithNumber;
import LIPS.DataSet;
import LIPS.Interval;
import LIPS.IntervalSet;
import LIPS.MixtureGaussians;
import TNBN_TL.Clustering.DunnIndex;
import TNBN_TL.Knowledge.BooleanField;
import TNBN_TL.Knowledge.DoubleField;
import TNBN_TL.Knowledge.Field;
import TNBN_TL.Knowledge.FieldValuePair;
import TNBN_TL.Knowledge.IntegerField;
import TNBN_TL.Knowledge.KnowledgeSet;
import TNBN_TL.Knowledge.Record;
import TNBN_TL.Knowledge.StringField;
import elvira.Bnet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashSet;

/**
 *
 * @author lfiedlerc
 */
public class Refine_Intervals {
    
    public static void refineIntervals(TNBN model, int maxNumIntervals, int [] continuous){ 
            ArrayList<TemporalVariable> tns = model.getTemporalNodes();
            ArrayList<RandomVariable> parents;
            ArrayList<ArrayList<FieldValuePair>> configurations;
            String outputFile = "data files/conf-";
            String filename;
            int i;
            boolean cont;
            ArrayList<ArrayList<IntervalSet>> intervalSetsForConfigurations = new ArrayList<>();
            ArrayList<String> processed = new ArrayList<>();
            
            /* Used for evaluation of intervals */
            double score, bestScore;
            DunnIndex dunn = new DunnIndex();
            /* End */
            
            KnowledgeSet discrete = model.getKnowledgeSet().copy();
            
            for(int t = 0; t < tns.size();){
                parents = tns.get(t).getParents();
                
                i = 0;
                cont = true;
                while(i < parents.size() && cont){
                    if(parents.get(i).getType().equals("Temporal")){
                        if(!processed.contains(parents.get(i).getName())){
                            cont = false;
                        }
                    }
                    i++;
                }
                if(!cont){
                    System.out.println(tns.get(t).getName() + " is being placed at the end");
                    tns.add(tns.get(t));
                    tns.remove(t);
                } else {                    
                    System.out.println("Evaluating " + tns.get(t).getName());
                    
                    intervalSetsForConfigurations.clear();
                    configurations = getConfigurations(tns.get(t));
                    
                    if(configurations != null){
                        i = 0;
                        ArrayList<Record> r;
                        KnowledgeSet perConf, filteredOriginal;
                        filteredOriginal = discrete.copy();
                        filteredOriginal.filter(model.getListOfVariables().indexOf(tns.get(t).getName()), "Default");
                        for(ArrayList<FieldValuePair> conf : configurations){

                            filename = outputFile + i + "-" + tns.get(t).getName() + ".txt";
                            r = discrete.getRecords(recordToSearch(model.getKnowledgeSet(),conf));
                            perConf = new KnowledgeSet(discrete.getFields(),r);
                            perConf.filter(model.getListOfVariables().indexOf(tns.get(t).getName()), "Default");

                                perConf.writeColumnToFile(filename, perConf.getIndexOfField(tns.get(t).getName()),"Default");
                                getIntervalSetsPerConfiguration(intervalSetsForConfigurations, filename);

                            i++;
                        }

                        //Combine intervals
                        ArrayList<IntervalSet> set1, set2, finalIntervals = new ArrayList<>();
                        for(i = 0; i < configurations.size() - 1; ++i){
                            set1 = intervalSetsForConfigurations.get(i);
                            for(int j = 0; j < set1.size(); ++j){
                                for(int k = i + 1; k < configurations.size(); ++k){
                                    set2 = intervalSetsForConfigurations.get(k);
                                    for(int m = 0; m < set2.size(); ++m){
                                        combineIntervals(set1.get(j),set2.get(m),maxNumIntervals,finalIntervals);
                                    }
                                }
                            }
                        }
                        if(finalIntervals.isEmpty()){
                            intervalsByAverage(intervalSetsForConfigurations, maxNumIntervals, finalIntervals);
                        }

                        /* Get evaluation for initial intervals */  
                        bestScore = dunn.evaluate(tns.get(t).getValuesAsIntervalSetNoDefault(), model.getKnowledgeSet().getColumn(tns.get(t).getName()));
                        //System.out.println("Score with initial intervals: " + bestScore);
                        /* End */

                        for(IntervalSet set : finalIntervals){
                            tns.get(t).setValues(set.intervalsToStringWithDefault());
                            //System.out.println("evaluating " + set.intervalsToStringWithDefault());

                            // evaluate
                            score = dunn.evaluate(set, model.getKnowledgeSet().getColumn(tns.get(t).getName()));
                            if(score > bestScore){
                                bestScore = score;
                                tns.get(t).setValues(set.intervalsToStringWithDefault());
                            }

                        }

                        
                    }
                    
                        discrete.setFieldValues(discrete.getIndexOfField(tns.get(t).getName()), new ArrayList<>(Arrays.asList((Temporal[])tns.get(t).getValues())));
                        /* Update the KnowledgeSet to use the learned intervals instead of the continuous data */
                        double value;
                        int indexOfTemp = model.getListOfVariables().indexOf(tns.get(t).getName());
                        for(int l = 0; l < discrete.size(); ++l){
                                if(!discrete.getValueOfField(l,indexOfTemp).toString().equals("Default")){
                                    value = Double.parseDouble(discrete.getValueOfField(l,indexOfTemp).toString());
                                    TemporalVariable tmp = (TemporalVariable)model.getNode(indexOfTemp);
                                    for(int j = 0; j < tmp.getValuesAsStrings().size() - 1; ++j){
                                        if(new Temporal(tmp.getValuesAsStrings().get(j).substring(1, tmp.getValuesAsStrings().get(j).length() - 1),2).inRange(value)){
                                            discrete.setValueOfField(l,indexOfTemp,tmp.getValuesAsStrings().get(j).substring(1, tmp.getValuesAsStrings().get(j).length() - 1));
                                            break;
                                        } else {
                                            discrete.setValueOfField(l,indexOfTemp,"Default");
                                        }
                                    }
                                }
                        }

                    processed.add(tns.get(t).getName());
                    t++;
                }
            }
            
            model.calculateProbabilityTables(discrete, true);
            model.calculateCPTsGivenParents(discrete, true);
            //discrete.writeToFile("C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/HIV/Learn Subtype C/Learn from 100pct/Subtype B Discrete.txt");
            //discrete.writeToFile("C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/HIV/Learn Europe/US_UpdateDB_discrete.txt");
        }
    
        private static void intervalsByAverage(ArrayList<ArrayList<IntervalSet>> intervalSetsForConfigurations, int maxNumIntervals, ArrayList<IntervalSet> finalIntervals){
            System.out.println("MergeIntervals: No hay intervalos!!!");
            ArrayList<IntervalSet> intervalosProm=getIntervalByAverage(intervalSetsForConfigurations);
            for(IntervalSet intervalos:intervalosProm){
                ArrayList<Interval> ordenados=ordenaIntervalos(intervalos);
                if(ordenados !=null){
                    if(ordenados.size() > 1 && ordenados.size() <= maxNumIntervals){
                        adjustBounds(ordenados);
                        IntervalSet tmp= new IntervalSet(ordenados);
                    
                        finalIntervals.add(tmp);
                    }
                }
            }
        }
    
    // This method is taken from Pablo Hernandez Leal's class MergeIntervals
        private static ArrayList<IntervalSet> getIntervalByAverage(ArrayList<ArrayList<IntervalSet>> intervalos){
            ArrayList<IntervalSet> nuevos= new ArrayList<>();
            ArrayList<LinkedHashSet<IntervalSet>> interTamano= new ArrayList<>();
            interTamano.add(new LinkedHashSet<IntervalSet>());
            interTamano.add(new LinkedHashSet<IntervalSet>());
            interTamano.add(new LinkedHashSet<IntervalSet>());

            for(ArrayList<IntervalSet> interval:intervalos){
                int size=interval.size();
                 for(int i=0;i<size;i++){
                         //System.out.println("IntervalByAverage:  "+interval.get(i));
                 //   interinicio+=inter.getStart();
                 //   interfinal+=inter.getEnd();
                         //System.out.println(interval.get(i).size());
                   interTamano.get(i).add(new IntervalSet(interval.get(i)));
                }
        //        System.out.println("size"+size);
            }


               for(LinkedHashSet<IntervalSet> interval:interTamano){
                     int size=interval.size();
                     if(size > 0){
                          //System.out.println("IntervalByAverage2:  "+interval.toString());
                        Iterator it=interval.iterator();
                        ArrayList<Interval> intervalProm = null;
                        for(int i=0;i<size;i++){
                          IntervalSet intervalConTam=((IntervalSet)it.next());
                              //System.out.println("conTam"+intervalConTam);
                          intervalProm=sumaIntervalos(intervalProm,intervalConTam.getIntervalSet());
                        }
                         //System.out.println("conFin"+intervalProm);

                        intervalProm=divideIntervalos(intervalProm,size);
                    
                           //System.out.println("intervalProm"+intervalProm);


                        IntervalSet nuevoset= new IntervalSet(intervalProm);
                        nuevos.add(nuevoset);
        //        System.out.println("size"+size);
                     }
            }
                    //System.out.println(nuevos);
            return nuevos;

        }
        
        // This method is taken from Pablo Hernandez Leal's class MergeIntervals
        private static ArrayList<Interval> sumaIntervalos(ArrayList<Interval> uno, ArrayList<Interval> dos){
            ArrayList<Interval> nuevos =new ArrayList<>();

            if (uno==null){
                return dos;
            }
            else{
                for(int i=0;i<uno.size();i++){
                    double start=uno.get(i).getStart()+dos.get(i).getStart();
                    double end=uno.get(i).getEnd()+dos.get(i).getEnd();
                    Interval in = new Interval(start,end);
                    nuevos.add(in);
                }
            }
            return nuevos;
        }
        
        // This method is taken from Pablo Hernandez Leal's class MergeIntervals
        private static ArrayList<Interval> divideIntervalos(ArrayList<Interval> uno, double divisor){
            ArrayList<Interval> nuevos =new ArrayList<>();

            for(int i=0;i<uno.size();i++){
                double start=uno.get(i).getStart()/divisor;
                double end=uno.get(i).getEnd()/divisor;
                Interval in = new Interval(start,end);
                nuevos.add(in);
            }

            return nuevos;
        }
    
    private static void combineIntervals(IntervalSet set1, IntervalSet set2, int maxNumIntervals, ArrayList<IntervalSet> combined){
            ArrayList<Interval> intervals = new ArrayList<>();
            ArrayList<Interval> orderedIntervals;
            double lowerBounds, upperBounds;
            
            /*System.out.println("Combining>");
            System.out.println(set1);
            System.out.println(set2);*/
            
            for(int i = 0; i < set1.size(); ++i){
               intervals.add(new Interval(set1.getIntervalAtIndex(i).getStart(),set1.getIntervalAtIndex(i).getEnd()));
            }
            for(int i = 0; i < set2.size(); ++i){
               intervals.add(new Interval(set2.getIntervalAtIndex(i).getStart(),set2.getIntervalAtIndex(i).getEnd()));
            }
            
            orderedIntervals = ordenaIntervalos(intervals);
            /*System.out.println("ordenados"+"\n");
            System.out.println(orderedIntervals+"\n");*/
            
            for(int i = 0; i < orderedIntervals.size() - 1;){
                if(Interval.containedIn(orderedIntervals.get(i), orderedIntervals.get(i + 1)) || Interval.containedIn(orderedIntervals.get(i + 1), orderedIntervals.get(i))){
                    lowerBounds = (orderedIntervals.get(i).getStart() + orderedIntervals.get(i + 1).getStart()) / 2;
                    upperBounds = (orderedIntervals.get(i).getEnd() + orderedIntervals.get(i + 1).getEnd()) / 2;
                    //System.out.println("upperBounds is > " + upperBounds);
                    Interval t = new Interval(lowerBounds,upperBounds);
                    orderedIntervals.remove(i + 1);
                    orderedIntervals.remove(i);
                    orderedIntervals.add(i,t);
                    /*System.out.println("merged"+"\n");
                    System.out.println(orderedIntervals+"\n");*/
                } else {
                    i++;
                }
            }
            if(orderedIntervals.size() > 1 && orderedIntervals.size() <= maxNumIntervals){
                adjustBounds(orderedIntervals);
                /*System.out.println("combined"+"\n");
                System.out.println(orderedIntervals+"\n");*/
                combined.add(new IntervalSet(orderedIntervals));
            }
        }
        
        private static void adjustBounds(ArrayList<Interval> intervals){
            double newBounds;
            for(int i = 0; i < intervals.size() - 1; ++i){
                newBounds = Math.round((intervals.get(i).getEnd() + intervals.get(i + 1).getStart()) / 2);
                intervals.get(i).setEnd(newBounds);
                intervals.get(i + 1).setStart(newBounds);
            }
        }
        
        // This method is taken from Pablo Hernandez Leal's class MergeIntervals
        private static ArrayList<Interval> ordenaIntervalos(IntervalSet intervaloUno){
            Interval [] nuevos= intervaloUno.getIntervalSet().toArray(new Interval[0]);
            return ordenaIntervalos(nuevos);
        }
        
        // This method is taken from Pablo Hernandez Leal's class MergeIntervals
        private static ArrayList<Interval> ordenaIntervalos(ArrayList<Interval> intervaloUno){
            Interval [] nuevos= intervaloUno.toArray(new Interval[0]);
            return ordenaIntervalos(nuevos);
        }

        // This method is taken from Pablo Hernandez Leal's class MergeIntervals
        private static ArrayList<Interval> ordenaIntervalos(Interval[] intervalos){
            ArrayList<Interval> intervalosIniciales = new ArrayList<Interval>();
            for(Interval in:intervalos){
                intervalosIniciales.add(in);
            }

            Collections.sort(intervalosIniciales);
            int indice=0;
            boolean cambio=false;
            do{
                cambio=false;
                for(indice=0;indice<intervalosIniciales.size()-1;indice++){
                    if( Interval.containedIn(intervalosIniciales.get(indice), intervalosIniciales.get(indice+1))){
                        Interval interUno=intervalosIniciales.get(indice);
                        Interval interDos=intervalosIniciales.get(indice+1);
                        int iniTmp=(int)(interUno.getStart()+interDos.getStart())/2;
                        int finTmp=(int)(interUno.getEnd()+interDos.getEnd())/2;
                        Interval nuevo= new Interval(iniTmp,finTmp);
                        intervalosIniciales.remove(interUno);
                        intervalosIniciales.remove(interDos);
                        intervalosIniciales.add(nuevo);
                        Collections.sort(intervalosIniciales);
                        cambio=true;
                    }
                }

            }while(cambio==true);


            return intervalosIniciales;
        }
    
    private static Record recordToSearch(KnowledgeSet k, ArrayList<FieldValuePair> configuration){
        Record r = new Record();
        String [] fields = k.getFieldNames();
        boolean isPart;
        
        for(int i = 0; i < fields.length; ++i){
            isPart = false;
            for(int j = 0; j < configuration.size(); ++j){
                if(fields[i].equals(configuration.get(j).getFieldName())){
                    r.addFieldValuePair(configuration.get(j));
                    isPart = true;
                    break;
                }
            }
            if(!isPart){
                r.addFieldValuePair(new FieldValuePair(k.getFieldAt(i),null));
            }
        }
        return r;
    }
    
        // This method is a fragment of code taken Pablo Hernandez Leal's method merge in the MergeIntervals class
        private static void getIntervalSetsPerConfiguration(ArrayList<ArrayList<IntervalSet>> intervalSetsForConfigurations, String file){
            intervalSetsForConfigurations.add(new ArrayList<IntervalSet>());
            ColumsWithNumber c= new ColumsWithNumber();
            /*ArrayList<Field> fields = new ArrayList<>(1);
            fields.add(new StringField("Temporal Information", new ArrayList<String>()));
            KnowledgeSet records = new KnowledgeSet(fields);
            IntervalSet intervals;
            Temporal t;
            double [] mean, std, mixing;
            
            records.loadKnowledge(file);
            System.out.println("Records loaded " + records.size());
            
            records.writeToArff("gmInicialization.arff", "Default", "-1");
            Kmeans k = new Kmeans("gmInicialization.arff");*/
            
            for(int kClus=1;kClus<=3;kClus++){
                //System.out.println(file);
                DataSet dtmp=c.preprocess(file, 1,false);
                /*mean = new double[kClus];
                std = new double[kClus];
                mixing = new double[kClus];
                //System.out.println("After preprocess> " + dtmp.getInstances().size());
                
                if(kClus > 1){
                    intervals = k.run(kClus, 0);
                    for(int i = 0; i < intervals.size(); ++i){
                        t = new Temporal(intervals.getIntervalAtIndex(i).stringForm(),2);
                        mean[i] = t.getMean();
                        System.out.println("mean " + mean[i]);
                        std[i] = t.getStd();
                        System.out.println("std " + std[i]);
                        mixing[i] = getPointsPerCluster(records,t)/(double)records.size();
                        System.out.println("mixing " + mixing[i]);
                    }
                } else {
                    mean[0] = getMeanOfData(records);
                    System.out.println("mean " + mean[0]);
                    std[0] = getStdOfData(records, mean[0]);
                    System.out.println("std " + std[0]);
                    mixing[0] = 1.0;
                    System.out.println("mixing " + mixing[0]);
                }*/
                
                MixtureGaussians m= new MixtureGaussians(kClus);
                //Interval[]intervalos= m.algorithmEM(dtmp,mean,std,mixing);
                Interval[]intervalos= m.algorithmEM(dtmp);
                //System.out.println("Length is " + intervalos.length);
                if(intervalos.length > 0){    
                    intervalSetsForConfigurations.get(intervalSetsForConfigurations.size() - 1).add(new IntervalSet(intervalos));
                }
            }
        }

        private static ArrayList<ArrayList<FieldValuePair>> getConfigurations(TemporalVariable v){ 
            ArrayList<RandomVariable> parents = v.getParents();
            System.out.println(v.getName() + " has " + parents.size() + " parents");
            
            if(parents.size() > 1){
                return getConfigurationsMultipleParents(parents);
            } else {
                if(parents.size() > 0){
                    return getConfigurationsSingleParent(parents.get(0));
                } else {
                    return null;
                }
            }   
        }
        
        private static ArrayList<ArrayList<FieldValuePair>> getConfigurationsMultipleParents(ArrayList<RandomVariable> parents){
            ArrayList<ArrayList<FieldValuePair>> configurations = new ArrayList<>();
            int numParents = parents.size();
            int limit = 1;
            int j;
            boolean cont;
            ArrayList<Object []> parentValues = new ArrayList<>(numParents);
            int [] numVals = new int[numParents];
            int [] valueIndexes = new int[numParents];
            
            for(int i = 0; i < numParents; ++i){
                parentValues.add(i, parents.get(i).getValues());
                numVals[i] = parents.get(i).numberOfValues();
                limit *= numVals[i];
            }       
            for(int i = 0; i < limit; ++i){
                j = 1;
		cont = true;
                while(j <= numParents && cont){
                    if(valueIndexes[numParents - j] >= numVals[numParents - j]){
                        valueIndexes[numParents - j] = 0;
			valueIndexes[numParents - j - 1] += 1;
			j++;
                    }else{
			cont = false;
                    }
                }             
                ArrayList<FieldValuePair> conf = new ArrayList<>(numParents);
                for(int l = 0; l < numParents; ++l){
                    Field f;
                    if(parents.get(l).getType().equals("String")){
                        f = new StringField(parents.get(l).getName(),new ArrayList(Arrays.asList(parents.get(l).getValues())));
                    } else if(parents.get(l).getType().equals("Integer")){
                        f = new IntegerField(parents.get(l).getName());
                    } else if(parents.get(l).getType().equals("Double")){
                        f = new DoubleField(parents.get(l).getName());
                    } else if(parents.get(l).getType().equals("Boolean")){
                        f = new BooleanField(parents.get(l).getName(), new ArrayList(Arrays.asList(parents.get(l).getValues())));
                    } else {
                        f = new BooleanField(parents.get(l).getName(), new ArrayList(Arrays.asList(parents.get(l).getValues())));
                    }
                    conf.add(l, new FieldValuePair(f,parentValues.get(l)[valueIndexes[l]]));
                }
                
                configurations.add(conf);
                valueIndexes[numParents - 1] += 1;
            }
            return configurations;
        }
        
        private static ArrayList<ArrayList<FieldValuePair>> getConfigurationsSingleParent(RandomVariable p){
           ArrayList<ArrayList<FieldValuePair>> configurations = new ArrayList<>();
           
           for(int i = 0; i < p.numberOfValues(); ++i){
               ArrayList<FieldValuePair> conf = new ArrayList<>();
               Field f;
               if(p.getType().equals("String")){
                   f = new StringField(p.getName(),new ArrayList(Arrays.asList(p.getValues())));
               } else if(p.getType().equals("Integer")){
                   f = new IntegerField(p.getName());
               } else if(p.getType().equals("Double")){
                   f = new DoubleField(p.getName());
               } else if(p.getType().equals("Boolean")){
                   f = new BooleanField(p.getName(), new ArrayList(Arrays.asList(p.getValues())));
               } else {
                   f = new BooleanField(p.getName(), new ArrayList(Arrays.asList(p.getValues())));
               }
               conf.add(new FieldValuePair(f,p.getValueAt(i)));
               configurations.add(conf);
           }
           return configurations;
        }
}
