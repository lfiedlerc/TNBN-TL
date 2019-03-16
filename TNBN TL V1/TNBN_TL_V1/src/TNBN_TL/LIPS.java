/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package TNBN_TL;

import TNBN_TL.Clustering.Kmeans;
import LIPS.ColumsWithNumber;
import LIPS.DataSet;
import LIPS.Interval;
import LIPS.IntervalSet;
import LIPS.MixtureGaussians;
import TNBN_TL.Knowledge.BooleanField;
import TNBN_TL.Knowledge.DoubleField;
import TNBN_TL.Knowledge.Field;
import TNBN_TL.Knowledge.FieldValuePair;
import TNBN_TL.Knowledge.IntegerField;
import TNBN_TL.Knowledge.KnowledgeSet;
import TNBN_TL.Knowledge.Record;
import TNBN_TL.Knowledge.StringField;
import TNBN_TL.Knowledge.TemporalField;
import elvira.Bnet;
import elvira.NodeList;
import elvira.database.DataBaseCases;
import elvira.learning.K2Learning;
import elvira.parser.ParseException;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lfiedlerc
 */
public class LIPS {
    static String inputPath, outputPath, referenceNetwork;
    static int [] continuous, initialNumIntervals, numberOfTestCases;
    static int maxIntervals, maxParents;
    static String [] trainingSet, testingSet, trainingDBC;
    static ArrayList<Field> targetFields;
    static ArrayList<RandomVariable>targetNodes;

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException{
        //build(0,"LIPS comparison/environment.conf");
        boolean referenceNet = true;
        buildAndEvaluate("C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/Collision Network/10-fold CV 100 records/No Transfer/LIPS/Collision.conf",referenceNet);
    }
    
    public static void build(int i, String environment){
        TNBN model;
        String elv;
        
        readEnvironment(environment);
        
        try{
            FileInputStream f = new FileInputStream(trainingDBC[i]);
            DataBaseCases cases = new DataBaseCases(f);
            NodeList order = cases.getNodeList();
                
            model = createTNBN(trainingSet[i], trainingDBC[i], order);
                
            elv = outputPath + "partition" + i + "_model.elv";
            model.makeElviraNet(elv);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public static void buildAndEvaluate(String environment, boolean referenceNet) throws IOException{
        String elv, numberToInterval,txtToDBC;
        Bnet learnedModel;
        ArrayList<Temporal[]> intervals;
        TNBN model;
        
        readEnvironment(environment);
        
        double [] avgBrierScore = new double[trainingSet.length];
        double [] avgBinaryBrierScore = new double[trainingSet.length];
        double [] avgTimeDifference = new double[trainingSet.length];
        double [] avgEditDistance = new double[trainingSet.length];
        double [] avgPrediction = new double[trainingSet.length];
        double [] avgTemporalPredictionError = new double[trainingSet.length];
        double brierMean = 0.0, brierStd = 0.0, timeDiffMean = 0.0, timeDiffStd = 0.0, editDistMean = 0.0, editDistStd = 0.0, intervalEditDistMean = 0.0, intervalEditDistStd = 0.0;
        double binaryBrierMean = 0.0, binaryBrierStd = 0.0;
        double [][] intervalEditDistance = new double[continuous.length][trainingSet.length];
        
        BufferedWriter out = new BufferedWriter(new FileWriter(outputPath + "Evaluation Results.txt"));
        out.write("Metric\tMean\tStd");
        out.newLine();
        
        for(int i = 0; i < trainingSet.length; ++i){
            try{
                FileInputStream f = new FileInputStream(trainingDBC[i]);
                DataBaseCases cases = new DataBaseCases(f);
                NodeList order = cases.getNodeList();
                
                model = createTNBN(trainingSet[i], trainingDBC[i], order);
                
                elv = outputPath + "partition" + i + "_model.elv";
                model.makeElviraNet(elv);
                
                intervals = new ArrayList<>();
                for(int j = 0; j < continuous.length; ++j){
                    intervals.add((Temporal[])model.getNodes().get(continuous[j]).getValues());
                }
                
                learnedModel = new Bnet(new FileInputStream(elv));
                
                numberToInterval = outputPath + "partition" + i + "_intervals.txt";
                ProcessFile.numberToInterval(testingSet[i],numberToInterval,continuous, numberOfTestCases[i], " ", intervals);
                txtToDBC = "partition" + i + "_Compliment";
                ProcessFile.fileToDBC(numberToInterval,outputPath, txtToDBC, " ", learnedModel.getNodeList());
                
                avgBrierScore[i] = EvaluateNetwork.brierScore(elv,outputPath + txtToDBC + ".dbc", numberOfTestCases[i], continuous);
                avgBinaryBrierScore[i] = EvaluateNetwork.binaryBrierScore();
                //avgPrediction[i] = EvaluateNetwork.evaluateLeavePrediction(elv, outputPath + txtToDBC + ".dbc", numberOfTestCases[i], continuous);
                avgTimeDifference[i] = EvaluateNetwork.evaluateIntervals(elv, testingSet[i], outputPath + txtToDBC + ".dbc", numberOfTestCases[i], continuous);
                //avgTemporalPredictionError[i] = EvaluateNetwork.evaluateTemporalPredictionError(elv, testingSet[i], outputPath + txtToDBC + ".dbc", numberOfTestCases[i], continuous);
                if(referenceNet){
                    avgEditDistance[i] = EvaluateNetwork.editDistance(referenceNetwork, elv);
                    for(int j = 0; j < continuous.length; ++j){
                        intervalEditDistance[j][i] += EvaluateNetwork.intervalEditDistance(referenceNetwork, elv, model.getNode(continuous[j]).getName());
                    }
                }
            }catch(ParseException | IOException e){
                e.printStackTrace();
            }
            System.out.println("\n");
        }
        
        for(int i = 0; i < trainingSet.length; ++i){
            brierMean += avgBrierScore[i];
            binaryBrierMean += avgBinaryBrierScore[i];
            timeDiffMean += avgTimeDifference[i];
            if(referenceNet){
                editDistMean += avgEditDistance[i];
                for(int j = 0; j < continuous.length; ++j){
                    intervalEditDistMean += intervalEditDistance[j][i];
                }
            }
        }
       
        brierMean /= trainingSet.length;
        binaryBrierMean /= trainingSet.length;
        timeDiffMean /= trainingSet.length; 
        if(referenceNet){
            editDistMean /= trainingSet.length;
            intervalEditDistMean /= trainingSet.length;
        }
                
        for(int i = 0; i < trainingSet.length; ++i){
            brierStd += (brierMean - avgBrierScore[i])*(brierMean - avgBrierScore[i]);
            binaryBrierStd += (binaryBrierMean - avgBinaryBrierScore[i])*(binaryBrierMean - avgBinaryBrierScore[i]);
            timeDiffStd += (timeDiffMean - avgTimeDifference[i])*(timeDiffMean - avgTimeDifference[i]);
            if(referenceNet){
                editDistStd += (editDistMean - avgEditDistance[i])*(editDistMean - avgEditDistance[i]);
                for(int j = 0; j < continuous.length; ++j){
                    intervalEditDistStd += (intervalEditDistMean - intervalEditDistance[j][i])*(intervalEditDistMean - intervalEditDistance[j][i]);
                }
            }
        }
        
        brierStd /= trainingSet.length;
        binaryBrierStd /= trainingSet.length;
        timeDiffStd /= trainingSet.length;
        if(referenceNet){
            editDistStd /= trainingSet.length;
            intervalEditDistStd /= trainingSet.length;
        }
        
        brierStd = Math.sqrt(brierStd);
        binaryBrierStd = Math.sqrt(binaryBrierStd);
        timeDiffStd = Math.sqrt(timeDiffStd);
        if(referenceNet){
            editDistStd = Math.sqrt(editDistStd);
            intervalEditDistStd = Math.sqrt(intervalEditDistStd);
        }
        
        out.write("RBS\t" + brierMean + "\t" + brierStd);
        out.newLine();
        out.write("RBS Binary\t" + binaryBrierMean + "\t" + binaryBrierStd);
        out.newLine();
        out.write("Time difference\t" + timeDiffMean + "\t" + timeDiffStd);
        out.newLine();
        if(referenceNet){
            out.write("Edit Distance\t" + editDistMean + "\t" + editDistStd);
            out.newLine();
            out.write("Interval Edit Distance\t" + intervalEditDistMean + "\t" + intervalEditDistStd);
            out.newLine();
        }
        out.close();
    }
    
    public static TNBN createTNBN(String trainingSet, String trainingDBC, NodeList order){
        KnowledgeSet db = new KnowledgeSet(targetFields);
        KnowledgeSet dbCpy;
        TNBN model = new TNBN(db, targetNodes);
        Kmeans k;
        String arff = inputPath + "TargetData.arff";
        ArrayList<String> initialIntervals;
        
        db.loadKnowledge(trainingSet);
        dbCpy = model.getKnowledgeSet().copy();
        db.writeToArff(arff, "Default", "-1");
        k = new Kmeans(arff);
        
        Temporal [] t; /* An array of temporal ranges */
        TemporalVariable v; /* A temporal random variable */
        double value;
        for(int i = 0; i < continuous.length; ++i){
            t = new Temporal[initialNumIntervals[i] + 1];
            initialIntervals = k.run(initialNumIntervals[i], continuous[i]).intervalsToStringWithDefault(); /* Obtain initial intervals */
            for(int j = 0; j < t.length - 1; ++j){
                System.out.println("Initial Interval: " + initialIntervals.get(j));
		if(j < t.length - 2){
                    t[j] = new Temporal(initialIntervals.get(j).substring(1, initialIntervals.get(j).length() - 1),1);
                } else {
                    t[j] = new Temporal(initialIntervals.get(j).substring(1, initialIntervals.get(j).length() - 1),2);
                }
            }
            t[initialNumIntervals[i]] = new Temporal();
            v = (TemporalVariable)model.getNode(continuous[i]);
            v.setValues(t); /* Set the values of the TemporalVariable at index continuous[i] to the obtained intervals */
            dbCpy.setFieldValues(continuous[i],new ArrayList<>(Arrays.asList(t))); /* Set the values of the TemporalField at index continuous[i] to the obtained intervals */
			
            /* Update the KnowledgeSet to use the learned intervals instead of the continuous data */
            for(int l = 0; l < dbCpy.size(); ++l){
                if(!dbCpy.getValueOfField(l,continuous[i]).toString().equals("Default")){
                    value = Double.parseDouble(dbCpy.getValueOfField(l,continuous[i]).toString());
                    for(int j = 0; j < t.length - 1; ++j){
                        if(t[j].inRange(value)){
                            dbCpy.setValueOfField(l,continuous[i],t[j]);
                            break;
			} else {
                            dbCpy.setValueOfField(l,continuous[i],"Default");
			}
                    }
                }
            }	
            initialIntervals.clear();
        }
        
        try{
            FileInputStream f = new FileInputStream(trainingDBC);
            DataBaseCases cases = new DataBaseCases(f);
            K2Learning structure = new K2Learning(cases,order,maxParents);
            structure.learning();
            Bnet net = (Bnet)structure.getOutput();
            
            boolean [][] graph = new boolean[targetNodes.size()][targetNodes.size()];
            
            NodeList children;
            int index;
            for(int i = 0; i < targetNodes.size(); ++i){
                children = net.children(cases.getNode(targetNodes.get(i).getName().replace(" ", "_")));
                for(int j = 0; j < children.size(); ++j){
                    index = RandomVariable.getIndexOf(children.elementAt(j).getName().replace("_", " "), targetNodes);
                    graph[i][index] = true;
                }
            }
            
            ArrayList<RandomVariable> parents;
            Integer [] incoming;
            for(int i = 0; i < graph.length; ++i){
                parents = new ArrayList<>();
                incoming = Graph.directedIncomingEdges(i, graph);
                for(int j = 0; j < incoming.length; ++j){
                    parents.add(model.getNodes().get(incoming[j]));
                }
                model.getNodes().get(i).setParents(parents);
            }
            model.setGraph(graph);
        }catch(Exception e){
            e.printStackTrace();
        }
        
        refineIntervals(model, dbCpy, maxIntervals, continuous);
        
        return model;
    }
    
    private static void refineIntervals(TNBN model, KnowledgeSet discrete, int maxNumIntervals, int [] continuous){ 
            ArrayList<TemporalVariable> tns = model.getTemporalNodes();
            ArrayList<RandomVariable> parents;
            ArrayList<ArrayList<FieldValuePair>> configurations;
            String outputFile = "data files/conf-";
            String filename;
            int i;
            boolean cont;
            ProbabilityDistribution p;
            ArrayList<ArrayList<IntervalSet>> intervalSetsForConfigurations = new ArrayList<>();
            ArrayList<String> processed = new ArrayList<>();
            ArrayList<String> original;
            
            /* Used for evaluation of intervals */
            String elv = "evaluateIntervals.elv";
            String testDB = "testSet.txt";
            String testDBToInterval = "testSetInterval.txt";
            String dbc = "testDBC";
            int numTestCases = model.getKnowledgeSet().size();
            ArrayList<Temporal[]> intervals;
            Bnet learnedModel;
            double score, bestScore = 0.0;
            ArrayList<String> bestSet = null;
            model.getKnowledgeSet().writeToFile(testDB);
            /* End */
            
            discrete = model.getKnowledgeSet().copy();
            
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
                    original = tns.get(t).getValuesAsStrings();
                    
                    intervalSetsForConfigurations.clear();
                    p = new ProbabilityDistribution(tns.get(t).getName());
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
                            if(perConf.size() >= (filteredOriginal.size()/(configurations.size()*2))){
                                perConf.writeColumnToFile(filename, perConf.getIndexOfField(tns.get(t).getName()),"Default");
                                getIntervalSetsPerConfiguration(intervalSetsForConfigurations, filename);
                            } else {
                                intervalSetsForConfigurations.add(new ArrayList<IntervalSet>());
                            }
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
                        //learn parameters with each interval  

                        for(IntervalSet set : finalIntervals){
                            tns.get(t).setValues(set.intervalsToStringWithDefault());
                            System.out.println("evaluating " + set.intervalsToStringWithDefault());

                            KnowledgeSet transformed = model.getKnowledgeSet().copy();
                            transformed.setFieldValues(transformed.getIndexOfField(tns.get(t).getName()), new ArrayList<>(Arrays.asList((Temporal[])tns.get(t).getValues())));
                            /* Update the KnowledgeSet to use the learned intervals instead of the continuous data */
                            double value;
                            for(int l = 0; l < transformed.size(); ++l){
                                for(int m = 0; m < continuous.length; ++m){
                                    if(!transformed.getValueOfField(l,continuous[m]).toString().equals("Default")){
                                        value = Double.parseDouble(transformed.getValueOfField(l,continuous[m]).toString());
                                        TemporalVariable tmp = (TemporalVariable)model.getNode(continuous[m]);
                                        for(int j = 0; j < tmp.getValuesAsStrings().size() - 1; ++j){
                                            if(new Temporal(tmp.getValuesAsStrings().get(j).substring(1, tmp.getValuesAsStrings().get(j).length()-1),2).inRange(value)){
                                                transformed.setValueOfField(l,continuous[m],tmp.getValuesAsStrings().get(j).substring(1, tmp.getValuesAsStrings().get(j).length()-1));
                                                break;
                                            } else {
                                                transformed.setValueOfField(l,continuous[m],"Default");
                                            }
                                        }
                                    }
                                }
                            }

                            model.calculateProbabilityTables(transformed, true);
                            model.calculateCPTsGivenParents(transformed, true);

                            // evaluate
                            model.makeElviraNet(elv);
                            intervals = new ArrayList<>();
                            for(int j = 0; j < continuous.length; ++j){
                                intervals.add((Temporal[])model.getNodes().get(continuous[j]).getValues());
                            }
                            try{
                                learnedModel = new Bnet(new FileInputStream(elv));
                                ProcessFile.numberToInterval(testDB, testDBToInterval, continuous, numTestCases, " ", intervals);
                                ProcessFile.fileToDBC(testDBToInterval, "", dbc, " ", learnedModel.getNodeList());

                                score = EvaluateNetwork.brierScore(elv, dbc + ".dbc", numTestCases, continuous)/100.0;
                                System.out.println("Evaluating new Score " + score);
                                if(score > bestScore){
                                    bestScore = score;
                                    bestSet = tns.get(t).getValuesAsStrings();
                                }
                            }catch(Exception e){
                                e.printStackTrace();
                            }
                        }

                        if(finalIntervals.size() > 0){
                            tns.get(t).setValues(bestSet);/* set tn values to winning interval set */
                        } else {
                            tns.get(t).setValues(original);/* set to those learned with kmeans */
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
                 
                    model.calculateProbabilityTables(discrete, true);
                    model.calculateCPTsGivenParents(discrete, true);

                    processed.add(tns.get(t).getName());
                    t++;
                }
            }
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
                System.out.println(Arrays.toString(intervalos));
                //System.out.println("Length is " + intervalos.length);
                if(intervalos.length > 0){    
                    intervalSetsForConfigurations.get(intervalSetsForConfigurations.size() - 1).add(new IntervalSet(intervalos));
                }
            }
        }

        private static ArrayList<ArrayList<FieldValuePair>> getConfigurations(TemporalVariable v){ 
            ArrayList<RandomVariable> parents = v.getParents();
            
            if(parents.size() > 1){
                return getConfigurationsMultipleParents(parents);
            } else {
                if(parents.size() > 0){
                    return getConfigurationsSingleParent(parents.get(0));
                }else{
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
    
    public static void readEnvironment(String configuration){
        String line, parameter, varName, varType;
        Object [] varValues;
        StringTokenizer tok, tok2;
        
        try{
            BufferedReader in = new BufferedReader(new FileReader(configuration));
            
            while((line = in.readLine()) != null){
                if(!line.trim().equals("")){
                    if(line.charAt(0) != '%'){
                        if(line.equals("@Begin Target")){
                            while(!(line = in.readLine()).equals("@End Target")){
                                tok = new StringTokenizer(line, "=");
                                parameter = tok.nextToken().trim();
                                switch (parameter) {
                                    case "NumberOfVariables":
                                        int numTargetVars = Integer.parseInt(tok.nextToken().trim());
                                        targetFields = new ArrayList<>(numTargetVars);
                                        targetNodes = new ArrayList<>(numTargetVars);
                                        
                                        for(int i = 0; i < numTargetVars; ++i){
                                            line = in.readLine();
                                            tok = new StringTokenizer(line,"=");
                                            tok.nextToken();
                                            varName = tok.nextToken().trim();
                                            
                                            line = in.readLine();
                                            tok = new StringTokenizer(line,"=");
                                            tok.nextToken();
                                            varType = tok.nextToken().trim();
                                            
                                            line = in.readLine();
                                            tok = new StringTokenizer(line,"=");
                                            tok.nextToken();
                                            if(tok.hasMoreTokens()){
                                                tok2 = new StringTokenizer(tok.nextToken().trim(),",");
                                                varValues = new String[tok2.countTokens()];
                                                for(int j = 0; j < varValues.length; ++j){
                                                    varValues[j] = tok2.nextToken().trim();
                                                }
                                            } else {
                                                varValues = new String[0];
                                            }
                                            switch (varType) {
                                                case "String":
                                                    targetFields.add(i, new StringField(varName,new ArrayList<>(Arrays.asList((String[])varValues))));
                                                    targetNodes.add(i, new RandomVariable(varName,(String[])varValues));
                                                    break;
                                                case "Boolean":
                                                    if(varValues[0].equals("true")){
                                                        targetFields.add(i, new BooleanField(varName,new ArrayList<>(Arrays.asList(new Boolean[]{true,false}))));
                                                        targetNodes.add(i, new RandomVariable(varName,new Boolean[]{true,false}));
                                                    } else {
                                                        targetFields.add(i, new BooleanField(varName,new ArrayList<>(Arrays.asList(new Boolean[]{false,true}))));
                                                        targetNodes.add(i, new RandomVariable(varName,new Boolean[]{false,true}));
                                                    }
                                                    break;
                                                case "Integer":
                                                    targetFields.add(i, new IntegerField(varName,new ArrayList<>(Arrays.asList((Integer[])varValues))));
                                                    targetNodes.add(i, new RandomVariable(varName,(Integer[])varValues));
                                                    break;
                                                case "Double":
                                                    targetFields.add(i, new DoubleField(varName,new ArrayList<>(Arrays.asList((Double[])varValues))));
                                                    targetNodes.add(i, new RandomVariable(varName,(Double[])varValues));
                                                    break;
                                                case "Temporal":
                                                    targetFields.add(i, new TemporalField(varName,(String[])varValues));
                                                    targetNodes.add(i, new TemporalVariable(varName,Temporal.toTemporal((String[])varValues)));
                                                    break;
                                            }   
                                        }
                                        break;
                                    case "ContinuousIndexes":
                                        tok2 = new StringTokenizer(tok.nextToken().trim(),",");
                                        continuous = new int[tok2.countTokens()];
                                        for(int j = 0; j < continuous.length; ++j){
                                            continuous[j] = Integer.parseInt(tok2.nextToken().trim());
                                        }
                                        break;
                                    case "InitialNumberOfIntevals":
                                        tok2 = new StringTokenizer(tok.nextToken().trim(),",");
                                        initialNumIntervals = new int[tok2.countTokens()];
                                        for(int j = 0; j < initialNumIntervals.length; ++j){
                                            initialNumIntervals[j] = Integer.parseInt(tok2.nextToken().trim());
                                        }
                                        break;
                                    case "MaxNumberOfIntervals":
                                        maxIntervals = Integer.parseInt(tok.nextToken().trim());
                                        break;
                                    case "MaxNumberOfParents":
                                        maxParents = Integer.parseInt(tok.nextToken().trim());
                                        break;
                                }
                            }
                        } else {
                            tok = new StringTokenizer(line, "=");
                            parameter = tok.nextToken().trim();
                            switch (parameter) {
                                case "inputFilePath":
                                    inputPath = tok.nextToken().trim();
                                    break;
                                case "outputFilePath":
                                    outputPath = tok.nextToken().trim();
                                    break;
                                 case "NumberOfPartitions" :
                                    int numberOfPartitions = Integer.parseInt(tok.nextToken().trim());
                                    trainingSet = new String[numberOfPartitions];
                                    trainingDBC = new String[numberOfPartitions];
                                    testingSet = new String[numberOfPartitions];
                                    numberOfTestCases = new int[numberOfPartitions];
                                    
                                    for(int i = 0; i < numberOfPartitions; ++i){
                                        trainingSet[i] = inputPath + "partition" + i + ".txt";
                                        trainingDBC[i] = inputPath + "partition" + i + ".dbc";
                                        testingSet[i] = inputPath + "partition" + i + "_Compliment.txt";
                                    }
                                    break;
                                case "NumberOfTestCases" : 
                                    int numTestCases = Integer.parseInt(tok.nextToken().trim());
                                    
                                    for(int i = 0; i < numberOfTestCases.length; ++i){
                                        numberOfTestCases[i] = numTestCases;
                                    }
                                    break;
                                case "ReferenceNetwork":
                                    referenceNetwork = inputPath + tok.nextToken().trim();
                                    break;
                            }
                        }
                    }
                }
            }
         }catch(IOException | NumberFormatException e){
             e.printStackTrace();
         }
    }
 
}
