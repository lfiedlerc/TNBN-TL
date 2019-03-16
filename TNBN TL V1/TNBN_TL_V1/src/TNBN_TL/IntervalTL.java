package TNBN_TL;

import LIPS.ColumsWithNumber;
import LIPS.DataSet;
import LIPS.Interval;
import LIPS.IntervalSet;
import LIPS.MixtureGaussians;
import TNBN_TL.Clustering.DunnIndex;
import TNBN_TL.Clustering.IntervalAnalysis;
import TNBN_TL.Clustering.Kmeans;
import TNBN_TL.Knowledge.*;
import elvira.Bnet;
import java.io.FileInputStream;
import java.util.*;
import weka.core.Instances;

public class IntervalTL {

	public static Temporal[] transferKnowledge(TemporalVariable target, AuxiliaryTemporalVariable [] auxDomains, int numIntervals, int recordsToGenerate, int numTargetRecords){
		KnowledgeSet newSet;
		ArrayList<String> newIntervals;
		Temporal [] intervals;
		int auxSetSize = recordsToGenerate - numTargetRecords;
		
		String outputFile = "data files/artificialData.arff"; 
		ArrayList<Field> fields = new ArrayList<>(1);
		fields.add(new DoubleField("Temporal Information", new ArrayList<Double>()));
		newSet = new KnowledgeSet(fields);
		
		generateAuxRecords(auxDomains,auxSetSize,newSet);
		generateRecords(target,numTargetRecords,newSet);
		
		newSet.writeToArff(outputFile,"Default","-1");
		
		// apply k means to this new knowledge set
		Kmeans kmeans= new Kmeans(outputFile);
		newIntervals = kmeans.run(numIntervals,0).intervalsToStringForm();
		intervals = new Temporal[newIntervals.size()];
		
		for(int i = 0; i < intervals.length; ++i){
			if(i < intervals.length - 1){
				intervals[i] = new Temporal(newIntervals.get(i),1);
                        } else {
				intervals[i] = new Temporal(newIntervals.get(i),2);
                        }
		}
		
		return intervals;
	}
        
        // This one uses interval mapping and then Roger's parametric TL 
        public static void transferKnowledgeWithStructuralInformationA(TNBN model, TNBN [] auxModels, KnowledgeSet transformed, int recordsToGenerate, int numTargetRecords, int maxNumIntervals, int [] continuous, double alpha){
            ArrayList<TemporalVariable> tns = model.getTemporalNodes();
            ArrayList<RandomVariable> parents;
            ArrayList<ArrayList<FieldValuePair>> configurations;
            String outputFile = "data files/mix-";
            String filename;
            ArrayList<KnowledgeSet> newSet = new ArrayList<>();
            ArrayList<Field> fields = new ArrayList<>(1);
            StringBuilder fieldName;
            int i;
            boolean cont;
            AuxiliaryTemporalVariable auxVar;
            ArrayList<RandomVariable> auxParents;
            ArrayList<RandomVariable> additionalParents = new ArrayList<>();
            ArrayList<ArrayList<RandomVariable>> commonParents = new ArrayList<>();
            ArrayList<ValueProbability [][]> auxCPT = new ArrayList<>();
            ArrayList<Double> similarity = new ArrayList<>();
            int auxProportion;
            double totalSimilarity;
            ProbabilityDistribution p;
            ArrayList<ArrayList<IntervalSet>> intervalSetsForConfigurations = new ArrayList<>();
            ArrayList<String> processed = new ArrayList<>();
            ArrayList<RandomVariable> temporal;
            KnowledgeSet adapted;
            ArrayList<Double> defaultPct = new ArrayList<>();
            double defaultVal;
            ArrayList<RandomVariable> children;    
            ArrayList<RandomVariable> childTNs;
            double maxValue, minValue;
            double brier, timeDif;
            
            int auxSetSize = recordsToGenerate - numTargetRecords;
            
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
            
            ParametricTL.instantNodeParametericLearning(model.getNodes(), auxModels, model.getWeight()); /* Learn parameters for all instant nodes */
            ParametricTL.temporalNodeParametricLearning(RandomVariable.getVarsOfType(model.getNodes(), "Temporal"), auxModels, model.getWeight(),true);
            
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
                    tns.add(tns.get(t));
                    tns.remove(t);
                } else{
                    /* Get evaluation for initial intervals */
                    model.makeElviraNet(elv);
                    intervals = new ArrayList<>();
                    for(int j = 0; j < continuous.length; ++j){
                        intervals.add((Temporal[])model.getNodes().get(continuous[j]).getValues());
                    }
                    try{
                        learnedModel = new Bnet(new FileInputStream(elv));
                        ProcessFile.numberToInterval(testDB, testDBToInterval, continuous, numTestCases, " ", intervals);
                        ProcessFile.fileToDBC(testDBToInterval, "", dbc, " ", learnedModel.getNodeList());
                        
                        brier = EvaluateNetwork.brierScore(elv, dbc + ".dbc", numTestCases, continuous)/100.0;
                        timeDif = EvaluateNetwork.evaluateIntervalsNormalized(elv, testDB, dbc + ".dbc", numTestCases, continuous);
                        bestScore = (alpha)*(brier) + (1 - alpha)*(timeDif);
                        bestSet = tns.get(t).getValuesAsStrings();
                        
                        System.out.println("Brier with initial intervals: " + bestScore);
                            
                    }catch(Exception e){
                        e.printStackTrace();
                    }
                    /* End */
                    
                    maxValue = Math.round(model.getKnowledgeSet().getMaxValueOfNumericField(tns.get(t).getName()));
                    minValue = Math.round(model.getKnowledgeSet().getMinValueOfNumericField(tns.get(t).getName()));
                    
                    defaultPct.clear();
                    auxCPT.clear();
                    intervalSetsForConfigurations.clear();
                    p = new ProbabilityDistribution(tns.get(t).getName());
                    configurations = getConfigurations(tns.get(t));
                    totalSimilarity = 0.0;
                    
                    i = 0;
                    for(TNBN aux : auxModels){
                        auxVar = (AuxiliaryTemporalVariable)aux.getNode(tns.get(t).getName());
                        if(auxVar != null){
                            auxParents = auxVar.getCopyOfParents();
                            ArrayList<RandomVariable> commonVars = RandomVariable.getIntersection(parents,auxParents);
                            
                            if(commonVars.size() > 0){
                                commonParents.add(i,commonVars);
                                
                                temporal = RandomVariable.getVarsOfType(commonVars, "Temporal");
                                if(!temporal.isEmpty()){
                                    adapted = ParametricTL.mapIntervalToInterval(temporal,aux.getKnowledgeSet());
                                    ValueProbability [][] adaptedCPT = Probability.calculateCPT(adapted, auxVar, commonVars, true);
                                    auxCPT.add(i,adaptedCPT);
                                    additionalParents.clear();
                                } else {
                                    auxCPT.add(i,auxVar.getProbabilityDistribution().getCPT());
                                    additionalParents = getAdditionalParents(parents,auxParents);
                                }
                                
                                totalSimilarity += auxVar.getSimilarity();
                                similarity.add(i,auxVar.getSimilarity());                           
                                if(additionalParents.size() > 0){
                                    auxCPT.set(i,Probability.marginalizeOver(additionalParents, auxParents, auxCPT.get(i)));
                                }
                                i++;
                             }
                        }
                    }
                    
                    i = 0;
                    for(ArrayList<FieldValuePair> conf : configurations){
                        defaultVal = 0.0;
                        fields.clear();
                        fieldName = new StringBuilder(); 
                        for(FieldValuePair pair : conf){
                            fieldName.append(pair.toString());
                            fieldName.append(", ");
                        }
                        fields.add(new DoubleField(fieldName.toString(), new ArrayList<Double>()));
                        newSet.add(i,new KnowledgeSet(fields));
                        
                        defaultVal += tns.get(t).getProbabilityDistribution().probabilityOf("Default", conf.toArray(new FieldValuePair[conf.size()])) * ((double)numTargetRecords/(double)recordsToGenerate);
                        generateRecords(new ProbabilityDistribution(tns.get(t).getName(),tns.get(t).getProbabilityDistribution().getCPTCol(conf.toArray(new FieldValuePair [conf.size()]))), numTargetRecords, newSet.get(i));

                        for(int j = 0; j < auxCPT.size(); ++j){
                            p.setCPT(auxCPT.get(j));
                            auxProportion = (int)((similarity.get(j)/totalSimilarity) * auxSetSize);
                            FieldValuePair [] auxConfig = getAuxConfiguration(commonParents.get(j),conf);
                            defaultVal += p.probabilityOf("Default",auxConfig)  * ((double)auxProportion/(double)recordsToGenerate);
                            generateRecords(new ProbabilityDistribution(tns.get(t).getName(),p.getCPTCol(auxConfig)),auxProportion,newSet.get(i));
                        }
                        
                        defaultPct.add(i, defaultVal);
                        
                        filename = outputFile + i + "-" + tns.get(t).getName() + ".txt";
                        newSet.get(i).writeToFile(filename);
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
                    
                    //learn parameters with each interval  
                    for(IntervalSet set : finalIntervals){
                        if(set.getIntervalAtIndex(0).getStart() > minValue){
                            set.getIntervalAtIndex(0).setStart((int)minValue);
                        }
                        if(set.getIntervalAtIndex(set.size() - 1).getEnd() < maxValue){
                            set.getIntervalAtIndex(set.size() - 1).setEnd((int)maxValue);
                        }
                        
                        tns.get(t).setValues(set.intervalsToStringWithDefault());
                        children = model.getChildrenOf(tns.get(t)); // make sure the children are being obtained 
                        
                        /* relearn cpts for the children of the tn that are temporal nodes */
                        adapted = ParametricTL.mapIntervalToInterval(new ArrayList(Arrays.asList(new RandomVariable []{tns.get(t)})), transformed);
                        tns.get(t).getProbabilityDistribution().setCPT(Probability.calculateCPT(adapted, tns.get(t), tns.get(t).getParents(), true));
                        tns.get(t).getProbabilityDistribution().setProbabilityTable(Probability.calculateProbabilityTable(adapted, tns.get(t), true));

                        childTNs = RandomVariable.getVarsOfType(children, "Temporal");
                        for(RandomVariable child : childTNs){
                            ValueProbability [][] adaptedTargetCPT = Probability.calculateCPT(adapted, child, child.getParents(), true);
                            ValueProbability [] adpatedTargetTable = Probability.calculateProbabilityTable(adapted, child, true);
                            child.getProbabilityDistribution().setCPT(adaptedTargetCPT);
                            child.getProbabilityDistribution().setProbabilityTable(adpatedTargetTable);
                        }
                        
                        ParametricTL.temporalNodeParametricLearning(childTNs, auxModels, model.getWeight(),true);
                        ParametricTL.instantNodeParametericLearning(children, auxModels, model.getWeight()); /* relearn cpts for the children of the tn that are instant nodes */
                        
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
                            brier = EvaluateNetwork.brierScore(elv, dbc + ".dbc", numTestCases, continuous)/100.0;
                            timeDif = EvaluateNetwork.evaluateIntervalsNormalized(elv, testDB, dbc + ".dbc", numTestCases, continuous);
                            score = (alpha)*(brier) + (1 - alpha)*(timeDif);
                            if(score > bestScore){
                                System.out.println("new best: " + score);
                                bestScore = score;
                                bestSet = tns.get(t).getValuesAsStrings();
                            }
                        }catch(Exception e){
                            e.printStackTrace();
                        }
                    }
                    System.out.println("Selected Intervals:");
                    for(int j = 0; j < bestSet.size(); ++j)
                        System.out.println(bestSet.get(j));
                    System.out.println();
                    
                    
                    tns.get(t).setValues(bestSet);/* set tn values to winning interval set */
                    
                    // update knowledgeSet
                    transformed = ParametricTL.mapIntervalToInterval(new ArrayList(Arrays.asList(new RandomVariable []{tns.get(t)})), transformed);
                    
                    children = model.getChildrenOf(tns.get(t)); // make sure the children are being obtained 
                    // relearn cpts for children of the tn
                    ParametricTL.instantNodeParametericLearning(children, auxModels, model.getWeight()); /* relearn cpts for the children of the tn that are instant nodes */
                    
                    tns.get(t).getProbabilityDistribution().setCPT(Probability.calculateCPT(transformed, tns.get(t), tns.get(t).getParents(), true));
                    tns.get(t).getProbabilityDistribution().setProbabilityTable(Probability.calculateProbabilityTable(transformed, tns.get(t), true));
                    
                    childTNs = RandomVariable.getVarsOfType(children, "Temporal");
                    for(RandomVariable child : childTNs){
                        ValueProbability [][] adaptedTargetCPT = Probability.calculateCPT(transformed, child, child.getParents(), true);
                        ValueProbability [] adpatedTargetTable = Probability.calculateProbabilityTable(transformed, child, true);
                        child.getProbabilityDistribution().setCPT(adaptedTargetCPT);
                        child.getProbabilityDistribution().setProbabilityTable(adpatedTargetTable);
                    }
                    ParametricTL.temporalNodeParametricLearning(childTNs, auxModels, model.getWeight(),true);

                    processed.add(tns.get(t).getName());
                    t++;
                }
            }
        }
        
        
        //Calculates tn cpts with frequency instead of interval mapping
        public static void transferKnowledgeWithStructuralInformationB(TNBN model, TNBN [] auxModels, KnowledgeSet transformed, int recordsToGenerate, int numTargetRecords, int maxNumIntervals, int [] continuous, double alpha){
            ArrayList<TemporalVariable> tns = model.getTemporalNodes();
            ArrayList<RandomVariable> parents;
            ArrayList<ArrayList<FieldValuePair>> configurations;
            String outputFile = "data files/mix-";
            String filename;
            ArrayList<KnowledgeSet> newSet = new ArrayList<>();
            ArrayList<Field> fields = new ArrayList<>(1);
            StringBuilder fieldName;
            int i;
            boolean cont;
            AuxiliaryTemporalVariable auxVar;
            ArrayList<RandomVariable> auxParents;
            ArrayList<RandomVariable> additionalParents = new ArrayList<>();
            ArrayList<ArrayList<RandomVariable>> commonParents = new ArrayList<>();
            ArrayList<ValueProbability [][]> auxCPT = new ArrayList<>();
            ArrayList<Double> similarity = new ArrayList<>();
            int auxProportion;
            double totalSimilarity;
            ProbabilityDistribution p;
            ArrayList<ArrayList<IntervalSet>> intervalSetsForConfigurations = new ArrayList<>();
            ArrayList<String> processed = new ArrayList<>();
            ArrayList<RandomVariable> temporal;
            KnowledgeSet adapted;
            ArrayList<Double> defaultPct = new ArrayList<>();
            double defaultVal;
            ArrayList<RandomVariable> children;
            ArrayList<RandomVariable> childTNs;
            double maxValue, minValue;
            double brier, timeDif, tempBrier;
            
            int auxSetSize = recordsToGenerate - numTargetRecords;
            
            /* Used for evaluation of intervals */
            String elv = "evaluateIntervals.elv";
            String testDB = "testSet.txt";
            String testDBToInterval = "testSetInterval.txt";
            String dbc = "testDBC";
            int numTestCases = model.getKnowledgeSet().size();
            ArrayList<Temporal[]> intervals;
            Bnet learnedModel;
            double score, bestScore = 0.0;
            ValueProbability [][] bestCPT = null;
            ArrayList<String> bestSet = null;
            model.getKnowledgeSet().writeToFile(testDB);
            /* End */
            
            ParametricTL.instantNodeParametericLearning(model.getNodes(), auxModels, model.getWeight()); /* Learn parameters for all instant nodes */
            ParametricTL.temporalNodeParametricLearning(RandomVariable.getVarsOfType(model.getNodes(), "Temporal"), auxModels, model.getWeight(),true);
            
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
                    /* Get evaluation for initial intervals */
                    model.makeElviraNet(elv);
                    intervals = new ArrayList<>();
                    for(int j = 0; j < continuous.length; ++j){
                        intervals.add((Temporal[])model.getNodes().get(continuous[j]).getValues());
                    }
                    try{
                        learnedModel = new Bnet(new FileInputStream(elv));
                        ProcessFile.numberToInterval(testDB, testDBToInterval, continuous, numTestCases, " ", intervals);
                        ProcessFile.fileToDBC(testDBToInterval, "", dbc, " ", learnedModel.getNodeList());
                        if(alpha == 1){
                            bestScore = EvaluateNetwork.brierScore(elv, dbc + ".dbc", numTestCases, continuous)/100.0;
                        } else if(alpha == 0){
                            bestScore = EvaluateNetwork.evaluateIntervalsNormalized(elv, testDB, dbc + ".dbc", numTestCases, continuous);
                        } else {
                            brier = EvaluateNetwork.brierScore(elv, dbc + ".dbc", numTestCases, continuous)/100.0;
                            timeDif = EvaluateNetwork.evaluateIntervalsNormalized(elv, testDB, dbc + ".dbc", numTestCases, continuous);
                            //timeDif = 1.0 - EvaluateNetwork.evaluateTemporalPredictionError(elv, testDB, dbc + ".dbc", numTestCases, continuous);
                            //tempBrier = 1.0 - EvaluateNetwork.evaluateBrierTemporalPredictionError(elv, testDB, dbc + ".dbc", numTestCases, continuous);
                            bestScore = (alpha)*(brier) + (1.0 - alpha)*(timeDif);
                        }

                        bestSet = tns.get(t).getValuesAsStrings();
                        bestCPT = tns.get(t).getProbabilityDistribution().getCPT();
                        
                        System.out.println("Score with initial intervals: " + bestScore);
                            
                    }catch(Exception e){
                        e.printStackTrace();
                    }
                    /* End */
                    
                    maxValue = Math.round(model.getKnowledgeSet().getMaxValueOfNumericField(tns.get(t).getName()));
                    minValue = Math.round(model.getKnowledgeSet().getMinValueOfNumericField(tns.get(t).getName()));
                    
                    defaultPct.clear();
                    auxCPT.clear();
                    intervalSetsForConfigurations.clear();
                    p = new ProbabilityDistribution(tns.get(t).getName());
                    configurations = getConfigurations(tns.get(t));
                    totalSimilarity = 0.0;
                    
                    i = 0;
                    for(TNBN aux : auxModels){
                        auxVar = (AuxiliaryTemporalVariable)aux.getNode(tns.get(t).getName());
                        if(auxVar != null){
                            auxParents = auxVar.getCopyOfParents();
                            ArrayList<RandomVariable> commonVars = RandomVariable.getIntersection(parents,auxParents);
                            
                            if(commonVars.size() > 0){
                                commonParents.add(i,commonVars);
                                
                                temporal = RandomVariable.getVarsOfType(commonVars, "Temporal");
                                if(!temporal.isEmpty()){
                                    adapted = ParametricTL.mapIntervalToInterval(temporal,aux.getKnowledgeSet());
                                    ValueProbability [][] adaptedCPT = Probability.calculateCPT(adapted, auxVar, commonVars, true);
                                    auxCPT.add(i,adaptedCPT);
                                    additionalParents.clear();
                                } else {
                                    auxCPT.add(i,auxVar.getProbabilityDistribution().getCPT());
                                    additionalParents = getAdditionalParents(parents,auxParents);
                                }
                                
                                totalSimilarity += auxVar.getSimilarity();
                                similarity.add(i,auxVar.getSimilarity());                           
                                if(additionalParents.size() > 0){
                                    auxCPT.set(i,Probability.marginalizeOver(additionalParents, auxParents, auxCPT.get(i)));
                                }
                                i++;
                             }
                        }
                    }
                    
                    i = 0;
                    for(ArrayList<FieldValuePair> conf : configurations){
                        defaultVal = 0.0;
                        fields.clear();
                        fieldName = new StringBuilder(); 
                        for(FieldValuePair pair : conf){
                            fieldName.append(pair.toString());
                            fieldName.append(", ");
                        }
                        fields.add(new DoubleField(fieldName.toString(), new ArrayList<Double>()));
                        newSet.add(i,new KnowledgeSet(fields));
                        
                        defaultVal += tns.get(t).getProbabilityDistribution().probabilityOf("Default", conf.toArray(new FieldValuePair[conf.size()])) * ((double)numTargetRecords/(double)recordsToGenerate);
                        generateRecords(new ProbabilityDistribution(tns.get(t).getName(),tns.get(t).getProbabilityDistribution().getCPTCol(conf.toArray(new FieldValuePair [conf.size()]))), numTargetRecords, newSet.get(i));

                        for(int j = 0; j < auxCPT.size(); ++j){
                            p.setCPT(auxCPT.get(j));
                            auxProportion = (int)((similarity.get(j)/totalSimilarity) * auxSetSize);
                            FieldValuePair [] auxConfig = getAuxConfiguration(commonParents.get(j),conf);
                            defaultVal += p.probabilityOf("Default",auxConfig)  * ((double)auxProportion/(double)recordsToGenerate);
                            generateRecords(new ProbabilityDistribution(tns.get(t).getName(),p.getCPTCol(auxConfig)),auxProportion,newSet.get(i));
                        }
                        
                        defaultPct.add(i, defaultVal);
                        
                        filename = outputFile + i + "-" + tns.get(t).getName() + ".txt";
                        newSet.get(i).writeToFile(filename);
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
                    
                    //learn parameters with each interval  
                    for(IntervalSet set : finalIntervals){
                        if(set.getIntervalAtIndex(0).getStart() > minValue){
                            set.getIntervalAtIndex(0).setStart((int)minValue);
                        }
                        if(set.getIntervalAtIndex(set.size() - 1).getEnd() < maxValue){
                            set.getIntervalAtIndex(set.size() - 1).setEnd((int)maxValue);
                        }
                        
                        tns.get(t).setValues(set.intervalsToStringWithDefault());
                        //System.out.println("evaluating " + set.intervalsToStringWithDefault());
                        
                        i = 0;
                        ValueProbability [][] newCPT = new ValueProbability[set.size() + 1][configurations.size()];
                        for(ArrayList<FieldValuePair> conf : configurations){
                            ParametricTL.temporalNodeParametricLearning(tns.get(t),conf.toArray(new FieldValuePair[conf.size()]),defaultPct.get(i),true, newSet.get(i), newCPT, i);
                            i++;
                        }
                        tns.get(t).getProbabilityDistribution().setCPT(newCPT);
                  
                        children = model.getChildrenOf(tns.get(t)); // make sure the children are being obtained 
                        
                        /* relearn cpts for the children of the tn that are temporal nodes */
                        adapted = ParametricTL.mapIntervalToInterval(new ArrayList(Arrays.asList(new RandomVariable []{tns.get(t)})), transformed);
                        for(int j = 0; j < children.size(); j++){
                           if(!children.get(j).getType().equals("Temporal")){
                               ValueProbability [][] adaptedTargetCPT = Probability.calculateCPT(adapted, children.get(j), children.get(j).getParents(), true);
                               ValueProbability [] adpatedTargetTable = Probability.calculateProbabilityTable(adapted, children.get(j), true);
                               children.get(j).getProbabilityDistribution().setCPT(adaptedTargetCPT);
                               children.get(j).getProbabilityDistribution().setProbabilityTable(adpatedTargetTable);
                           } 
                        }
                        
                        ParametricTL.instantNodeParametericLearning(children, auxModels, model.getWeight()); /* relearn cpts for the children of the tn that are instant nodes */
                        
                        childTNs = RandomVariable.getVarsOfType(children, "Temporal");
                        for(RandomVariable child : childTNs){
                            ValueProbability [][] adaptedTargetCPT = Probability.calculateCPT(adapted, child, child.getParents(), true);
                            ValueProbability [] adpatedTargetTable = Probability.calculateProbabilityTable(adapted, child, true);
                            child.getProbabilityDistribution().setCPT(adaptedTargetCPT);
                            child.getProbabilityDistribution().setProbabilityTable(adpatedTargetTable);
                        }
                        ParametricTL.temporalNodeParametricLearning(childTNs, auxModels, model.getWeight(),true); /* Could be making a difference in better interval selection. Compare interval edit distance with and without */
                        
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
                            
                            
                            //timeDif = 1.0 - EvaluateNetwork.evaluateTemporalPredictionError(elv, testDB, dbc + ".dbc", numTestCases, continuous);
                            //System.out.println("Brier is " + brier);
                            //System.out.println("Time dif is " + timeDif);
                            //score = (alpha)*(brier) + (1.0 - alpha)*(timeDif);
                            //tempBrier = 1.0 - EvaluateNetwork.evaluateBrierTemporalPredictionError(elv, testDB, dbc + ".dbc", numTestCases, continuous);
                            if(alpha == 1){
                                score = EvaluateNetwork.brierScore(elv, dbc + ".dbc", numTestCases, continuous)/100.0;
                            } else if(alpha == 0){
                                score = EvaluateNetwork.evaluateIntervalsNormalized(elv, testDB, dbc + ".dbc", numTestCases, continuous);
                            } else {
                                brier = EvaluateNetwork.brierScore(elv, dbc + ".dbc", numTestCases, continuous)/100.0;
                                timeDif = EvaluateNetwork.evaluateIntervalsNormalized(elv, testDB, dbc + ".dbc", numTestCases, continuous);
                                score = (alpha)*(brier) + (1.0 - alpha)*(timeDif);
                            }
                            
                            //System.out.println("Evaluating new Score " + score);
                            if(score > bestScore){
                                System.out.println("new best: " + score);
                                bestScore = score;
                                bestSet = tns.get(t).getValuesAsStrings();
                                bestCPT = tns.get(t).getProbabilityDistribution().getCPT();
                            }
                        }catch(Exception e){
                            e.printStackTrace();
                        }
                    }
                    System.out.println("Selected Intervals:");
                    for(int j = 0; j < bestSet.size() - 1; ++j){
                        System.out.print(bestSet.get(j));
                        if(j < bestSet.size() - 2){
                            System.out.print(",");
                        }
                    }
                    System.out.println("\n");
                    
                    
                    tns.get(t).setValues(bestSet);/* set tn values to winning interval set */
                    tns.get(t).getProbabilityDistribution().setCPT(bestCPT);/* set tn cpt to winning interval set cpt */
                    
                    // update knowledgeSet
                    transformed = ParametricTL.mapIntervalToInterval(new ArrayList(Arrays.asList(new RandomVariable []{tns.get(t)})), transformed);
                    
                    
                    children = model.getChildrenOf(tns.get(t)); // make sure the children are being obtained 
                    for(int j = 0; j < children.size(); j++){
                           if(!children.get(j).getType().equals("Temporal")){
                               ValueProbability [][] adaptedTargetCPT = Probability.calculateCPT(transformed, children.get(j), children.get(j).getParents(), true);
                               ValueProbability [] adpatedTargetTable = Probability.calculateProbabilityTable(transformed, children.get(j), true);
                               children.get(j).getProbabilityDistribution().setCPT(adaptedTargetCPT);
                               children.get(j).getProbabilityDistribution().setProbabilityTable(adpatedTargetTable);
                           } 
                    }
                    // relearn cpts for children of the tn
                    ParametricTL.instantNodeParametericLearning(children, auxModels, model.getWeight()); /* relearn cpts for the children of the tn that are instant nodes */
                    childTNs = RandomVariable.getVarsOfType(children, "Temporal");
                    for(RandomVariable child : childTNs){
                        ValueProbability [][] adaptedTargetCPT = Probability.calculateCPT(transformed, child, child.getParents(), true);
                        ValueProbability [] adpatedTargetTable = Probability.calculateProbabilityTable(transformed, child, true);
                        child.getProbabilityDistribution().setCPT(adaptedTargetCPT);
                        child.getProbabilityDistribution().setProbabilityTable(adpatedTargetTable);
                    }
                    ParametricTL.temporalNodeParametricLearning(childTNs, auxModels, model.getWeight(),true);

                    processed.add(tns.get(t).getName());
                    t++;
                }
            }
        }
        
        public static void transferKnowledgeWithStructuralInformation_Cluster_Analysis(TNBN model, TNBN [] auxModels, KnowledgeSet transformed, int recordsToGenerate, int numTargetRecords, int maxNumIntervals){
            ArrayList<TemporalVariable> tns = model.getTemporalNodes();
            ArrayList<RandomVariable> parents;
            ArrayList<ArrayList<FieldValuePair>> configurations;
            String outputFile = "data files/mix-";
            String filename;
            ArrayList<KnowledgeSet> newSet = new ArrayList<>();
            ArrayList<KnowledgeSet> orderedSets = new ArrayList<>();
            ArrayList<Field> fields = new ArrayList<>(1);
            StringBuilder fieldName;
            int i;
            boolean cont;
            AuxiliaryTemporalVariable auxVar;
            ArrayList<RandomVariable> auxParents;
            ArrayList<RandomVariable> additionalParents = new ArrayList<>();
            ArrayList<ArrayList<RandomVariable>> commonParents = new ArrayList<>();
            ArrayList<ValueProbability [][]> auxCPT = new ArrayList<>();
            ArrayList<ValueProbability []> auxProbTbl = new ArrayList<>();
            ArrayList<Double> similarity = new ArrayList<>();
            int auxProportion;
            double totalSimilarity;
            ProbabilityDistribution p;
            ArrayList<ArrayList<IntervalSet>> intervalSetsForConfigurations = new ArrayList<>();
            ArrayList<String> processed = new ArrayList<>();
            ArrayList<RandomVariable> temporal;
            KnowledgeSet adapted, merged;
            ArrayList<Double> defaultPct = new ArrayList<>();
            double defaultVal;
            ArrayList<RandomVariable> children;
            ArrayList<RandomVariable> childTNs;
            double maxValue, minValue;
            DunnIndex dunn = new DunnIndex();
            
            int auxSetSize = recordsToGenerate - numTargetRecords;
            
            /* Used to select best interval set */
            double score, bestScore;
            /* End */
            
            ParametricTL.instantNodeParametericLearning(model.getNodes(), auxModels, model.getWeight()); /* Learn parameters for all instant nodes */
            ParametricTL.temporalNodeParametricLearning(RandomVariable.getVarsOfType(model.getNodes(), "Temporal"), auxModels, model.getWeight(),true);
            
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
                    
                    maxValue = Math.round(model.getKnowledgeSet().getMaxValueOfNumericField(tns.get(t).getName()));
                    minValue = Math.round(model.getKnowledgeSet().getMinValueOfNumericField(tns.get(t).getName()));
                    
                    defaultPct.clear();
                    similarity.clear();
                    newSet.clear();
                    orderedSets.clear();
                    auxCPT.clear();
                    auxProbTbl.clear();
                    commonParents.clear();
                    additionalParents.clear();
                    intervalSetsForConfigurations.clear();
                    p = new ProbabilityDistribution(tns.get(t).getName());
                    configurations = getConfigurations(tns.get(t));
                    totalSimilarity = 0.0;
                    
                    i = 0;
                    for(TNBN aux : auxModels){
                        auxVar = (AuxiliaryTemporalVariable)aux.getNode(tns.get(t).getName());
                        if(auxVar != null){
                            if(parents.size() > 0){
                                auxParents = auxVar.getCopyOfParents();
                                ArrayList<RandomVariable> commonVars = RandomVariable.getIntersection(parents,auxParents);

                                if(commonVars.size() > 0){
                                    commonParents.add(i,commonVars);

                                    temporal = RandomVariable.getVarsOfType(commonVars, "Temporal");
                                    if(!temporal.isEmpty()){
                                        adapted = ParametricTL.mapIntervalToInterval(temporal,aux.getKnowledgeSet());
                                        ValueProbability [][] adaptedCPT = Probability.calculateCPT(adapted, auxVar, commonVars, true);
                                        auxCPT.add(i,adaptedCPT);
                                        additionalParents.clear();
                                    } else {
                                        auxCPT.add(i,auxVar.getProbabilityDistribution().getCPT());
                                        additionalParents = getAdditionalParents(parents,auxParents);
                                    }

                                    totalSimilarity += auxVar.getSimilarity();
                                    similarity.add(i,auxVar.getSimilarity());                           
                                    if(additionalParents.size() > 0){
                                        auxCPT.set(i,Probability.marginalizeOver(additionalParents, auxParents, auxCPT.get(i)));
                                    }
                                    i++;
                                 }
                            } else {
                                auxProbTbl.add(i, aux.getProbabilityOfNode(tns.get(t).getName()));
                                totalSimilarity += auxVar.getSimilarity();
                                similarity.add(i,auxVar.getSimilarity()); 
                                i++;
                            }
                        }
                    }
                    if(configurations.size() > 0){
                        i = 0;
                        for(ArrayList<FieldValuePair> conf : configurations){
                            defaultVal = 0.0;
                            fields.clear();
                            fieldName = new StringBuilder(); 
                            for(FieldValuePair pair : conf){
                                fieldName.append(pair.toString());
                                fieldName.append(", ");
                            }
                            fields.add(new DoubleField(fieldName.toString(), new ArrayList<Double>()));
                            newSet.add(i,new KnowledgeSet(fields));

                            defaultVal += tns.get(t).getProbabilityDistribution().probabilityOf("Default", conf.toArray(new FieldValuePair[conf.size()])) * ((double)numTargetRecords/(double)recordsToGenerate);
                            generateRecords(new ProbabilityDistribution(tns.get(t).getName(),tns.get(t).getProbabilityDistribution().getCPTCol(conf.toArray(new FieldValuePair [conf.size()]))), numTargetRecords, newSet.get(i));

                            for(int j = 0; j < auxCPT.size(); ++j){
                                p.setCPT(auxCPT.get(j));
                                auxProportion = (int)((similarity.get(j)/totalSimilarity) * auxSetSize);
                                FieldValuePair [] auxConfig = getAuxConfiguration(commonParents.get(j),conf);
                                defaultVal += p.probabilityOf("Default",auxConfig)  * ((double)auxProportion/(double)recordsToGenerate);
                                generateRecords(new ProbabilityDistribution(tns.get(t).getName(),p.getCPTCol(auxConfig)),auxProportion,newSet.get(i));
                            }

                            defaultPct.add(i, defaultVal);

                            i++;
                        }
                    } else {
                        defaultVal = 0.0;
                        fields.clear();
                        fields.add(new DoubleField("Temporal Information", new ArrayList<Double>()));
                        newSet.add(new KnowledgeSet(fields));
                        
                        defaultVal += tns.get(t).getProbabilityDistribution().probabilityOf("Default") * ((double)numTargetRecords/(double)recordsToGenerate);
                        generateRecords(tns.get(t),numTargetRecords,newSet.get(0));
                        
                        for(int j = 0; j < auxProbTbl.size(); ++j){
                            p.setProbabilityTable(auxProbTbl.get(j));
                            auxProportion = (int)((similarity.get(j)/totalSimilarity) * auxSetSize);
                            defaultVal += p.probabilityOf("Default")  * ((double)auxProportion/(double)recordsToGenerate);
                            generateRecords(p,auxProportion,newSet.get(0));
                        }
                        defaultPct.add(defaultVal);
                    }
                    //Order set from largest to smallest and only use the 10 largest
                    
                    orderedSets.add(newSet.get(0));
                    for(i = 1; i < newSet.size(); ++i){
                        for(int ii = 0; ii < orderedSets.size(); ++ii){
                            if(newSet.get(i).size() > orderedSets.get(ii).size()){
                                orderedSets.add(ii, newSet.get(i));
                                break;
                            }
                        }
                    }
                    
                    i = 0;
                    while(i < 10 && i < orderedSets.size()){
                        filename = outputFile + i + "-" + tns.get(t).getName() + ".txt";
                        orderedSets.get(i).writeToFile(filename);
                        getIntervalSetsPerConfiguration(intervalSetsForConfigurations, filename);
                       
                        i++;
                    }
                    
                    //Combine intervals
                    int limit = Math.min(10, orderedSets.size());
                    ArrayList<IntervalSet> set1, set2, finalIntervals = new ArrayList<>();
                    for(i = 0; i < limit - 1; ++i){
                        set1 = intervalSetsForConfigurations.get(i);
                        for(int j = 0; j < set1.size(); ++j){
                            for(int k = i + 1; k < limit; ++k){
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
                    
                    merged = orderedSets.get(0).copy();
                    for(i = 1; i < limit; ++i){
                        merged.mergeKnowledgeSets(orderedSets.get(i));
                    }
                    
                    /* Get evaluation for initial intervals */  
                    bestScore = dunn.evaluate(tns.get(t).getValuesAsIntervalSetNoDefault(), merged.getColumn(0));
                    //System.out.println("Score with initial intervals: " + bestScore);
                    /* End */
                    
                    System.out.println("Evaluating " + finalIntervals.size() + " possible sets");
                    int s = 1;
                    for(IntervalSet set : finalIntervals){
                        //System.out.println(s);
                        if(set.getIntervalAtIndex(0).getStart() > minValue){
                            set.getIntervalAtIndex(0).setStart((int)minValue);
                        }
                        if(set.getIntervalAtIndex(set.size() - 1).getEnd() < maxValue){
                            set.getIntervalAtIndex(set.size() - 1).setEnd((int)maxValue);
                        }
						
                        // evaluate
                        score = dunn.evaluate(set, merged.getColumn(0));
                        if(score > bestScore){
                            bestScore = score;
                            tns.get(t).setValues(set.intervalsToStringWithDefault());
                        }
                        s++;
                    }
                    
                    System.out.println("Selected intervals" + tns.get(t).getValuesAsStrings());
                    
                    if(configurations.size() > 0){
                        i = 0;
                        ValueProbability [][] newCPT = new ValueProbability[tns.get(t).numberOfValues()][configurations.size()];
                        for(ArrayList<FieldValuePair> conf : configurations){
                            ParametricTL.temporalNodeParametricLearning(tns.get(t),conf.toArray(new FieldValuePair[conf.size()]),defaultPct.get(i),true, newSet.get(i), newCPT, i);
                            i++;
                        }
                        tns.get(t).getProbabilityDistribution().setCPT(newCPT);
                    } else {
                        ValueProbability [] newTable = new ValueProbability[tns.get(t).numberOfValues()];
                        ParametricTL.temporalNodeParametricLearningApriori(tns.get(t),defaultPct.get(0),true, newSet.get(0), newTable);
                    }
                    
                    /* Update the KnowledgeSet to use the learned intervals */
                    transformKnowledgeSet(new ArrayList(Arrays.asList(new RandomVariable []{tns.get(t)})), transformed); /* This is used if the data set generated for other iterations grows. If not use the one below. */
                    
                    //Use this if the same amount of records will be generated for other iterations. If not use the one above.
                    /*indexOfField = transformed.getIndexOfField(tns.get(t).getName());
                    original = model.getKnowledgeSet();
                    Temporal [] transferedIntervals = (Temporal [])tns.get(t).getValues();
                    transformed.setFieldValues(indexOfField,new ArrayList<>(Arrays.asList(transferedIntervals))); 
                    for(int l = 0; l < transformed.size(); ++l){
                        if(!original.getValueOfField(l,indexOfField).toString().equals("Default")){
                            value = Double.parseDouble(original.getValueOfField(l,indexOfField).toString());
                            for(int j = 0; j < transferedIntervals.length - 1; ++j){
                                if(transferedIntervals[j].inRange(value)){
                                    transformed.setValueOfField(l,indexOfField,transferedIntervals[j]);
                                    break;
                                } else {
                                    transformed.setValueOfField(l,indexOfField,"Default");
                                }
                            }
                        }
                    }*/
                   
                    children = model.getChildrenOf(tns.get(t)); // make sure the children are being obtained 
                    for(int j = 0; j < children.size(); j++){
                           if(!children.get(j).getType().equals("Temporal")){
                               ValueProbability [][] adaptedTargetCPT = Probability.calculateCPT(transformed, children.get(j), children.get(j).getParents(), true);
                               ValueProbability [] adpatedTargetTable = Probability.calculateProbabilityTable(transformed, children.get(j), true);
                               children.get(j).getProbabilityDistribution().setCPT(adaptedTargetCPT);
                               children.get(j).getProbabilityDistribution().setProbabilityTable(adpatedTargetTable);
                           } 
                    }
                    // relearn cpts for children of the tn
                    ParametricTL.instantNodeParametericLearning(children, auxModels, model.getWeight()); /* relearn cpts for the children of the tn that are instant nodes */
                    
                    childTNs = RandomVariable.getVarsOfType(children, "Temporal");
                    for(RandomVariable child : childTNs){
                        ValueProbability [][] adaptedTargetCPT = Probability.calculateCPT(transformed, child, child.getParents(), true);
                        ValueProbability [] adpatedTargetTable = Probability.calculateProbabilityTable(transformed, child, true);
                        child.getProbabilityDistribution().setCPT(adaptedTargetCPT);
                        child.getProbabilityDistribution().setProbabilityTable(adpatedTargetTable);
                    }
                    ParametricTL.temporalNodeParametricLearning(childTNs, auxModels, model.getWeight(),true); 

                    processed.add(tns.get(t).getName());
                    t++;
                }
            }
        }
        
        public static void transformKnowledgeSet(ArrayList<RandomVariable> tns, KnowledgeSet aux){
            ArrayList<Record> auxRecords = aux.getRecords();
            int [] temporalIndexes = new int[tns.size()];
            String fieldValue;
            Temporal t;
            double number;
            NormalDistribution d = new NormalDistribution();
            Temporal [] intervals;
            int j;
            boolean cont;
            
            int i = 0;
            for(RandomVariable tn : tns){
                temporalIndexes[i] = aux.getIndexOfField(tn.getName());
                aux.setFieldValues(temporalIndexes[i],new ArrayList(Arrays.asList(tn.getValues())));
                i++;
            }
            
            for(Record r : auxRecords){
                for(i = 0; i < temporalIndexes.length; ++i){
                    if(temporalIndexes[i] != -1){
                        fieldValue = r.getValueOfFieldAt(temporalIndexes[i]).toString();
                        if(!fieldValue.equals("Default")){
                            intervals = (Temporal [])tns.get(i).getValues();
                            t = new Temporal(fieldValue,2);
                            d.setMean(t.getMean());
                            d.setStd(t.getStd());
                            number = d.generate(); 
                            while(number < t.getLowerBounds() || number > t.getUpperBounds()){
                                number = d.generate();
                            }
                            j = 0;
                            cont = true;
                            while(j < intervals.length && cont){
                                if(intervals[j].inRange(number)){
                                    r.setValueAt(temporalIndexes[i], intervals[j].toString());
                                    cont = false;
                                }
                                j++;
                            }
                            if(cont){
                                r.setValueAt(temporalIndexes[i], "Default"); 
                            }
                        }
                    }
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
                         System.out.println("IntervalByAverage:  "+interval.get(i));
                 //   interinicio+=inter.getStart();
                 //   interfinal+=inter.getEnd();
                   interTamano.get(i).add(new IntervalSet(interval.get(i)));
                }
        //        System.out.println("size"+size);
            }


               for(LinkedHashSet<IntervalSet> interval:interTamano){
                     int size=interval.size();
                          System.out.println("IntervalByAverage2:  "+interval.toString());
                     Iterator it=interval.iterator();
                     ArrayList<Interval> intervalProm = null;
                     for(int i=0;i<size;i++){
                          IntervalSet intervalConTam=((IntervalSet)it.next());
                              System.out.println("conTam"+intervalConTam);
                          intervalProm=sumaIntervalos(intervalProm,intervalConTam.getIntervalSet());
                    }
                         System.out.println("conFin"+intervalProm);

                     intervalProm=divideIntervalos(intervalProm,size);
                    
                           System.out.println("intervalProm"+intervalProm);


                     IntervalSet nuevoset= new IntervalSet(intervalProm);
                     nuevos.add(nuevoset);
        //        System.out.println("size"+size);
            }
                    System.out.println(nuevos);
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
            ArrayList<Interval> intervalosIniciales = new ArrayList<>();
            for(Interval in:intervalos){
                intervalosIniciales.add(in);
            }

            Collections.sort(intervalosIniciales);
            int indice=0;
            boolean cambio;
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
        
        // This method is a fragment of code taken Pablo Hernandez Leal's method merge in the MergeIntervals class
        /*private static void getIntervalSetsPerConfiguration(ArrayList<ArrayList<IntervalSet>> intervalSetsForConfigurations, String file){
            intervalSetsForConfigurations.add(new ArrayList<IntervalSet>());
            ColumsWithNumber c= new ColumsWithNumber();
            ArrayList<Field> fields = new ArrayList<>(1);
            fields.add(new StringField("Temporal Information", new ArrayList<String>()));
            KnowledgeSet records = new KnowledgeSet(fields);
            Temporal t;
            double [] mean, std, mixing;
            
            records.loadKnowledge(file);
            //System.out.println("Records loaded " + records.size());
            
            records.writeToArff("gmInicialization.arff", "Default", "-1");
            //Kmeans k = new Kmeans("gmInicialization.arff");
            
            for(int kClus=1;kClus<=3;kClus++){
                Kmeans k = new Kmeans("gmInicialization.arff");
                //System.out.println(file);
                //DataSet dtmp=c.preprocess(file, 1,false);
                /*mean = new double[kClus];
                std = new double[kClus];
                mixing = new double[kClus];
                //System.out.println("After preprocess> " + dtmp.getInstances().size());
                

                    intervals = k.run(kClus, 0);
                    for(int i = 0; i < intervals.size(); ++i){
                        t = new Temporal(intervals.getIntervalAtIndex(i).stringForm(),2);
                        mean[i] = t.getMean();
                        //System.out.println("mean " + mean[i]);
                        std[i] = t.getStd();
                        //System.out.println("std " + std[i]);
                        mixing[i] = getPointsPerCluster(records,t)/(double)records.size();
                        //System.out.println("mixing " + mixing[i]);
                    }*//*
                System.out.println(kClus);
                 IntervalSet intervals = k.run(kClus, 0);
                 System.out.println("String intervals> " + intervals.toString());
                //MixtureGaussians m= new MixtureGaussians(kClus);
                //Interval[]intervalos= m.algorithmEM(dtmp,mean,std,mixing);
                //Interval[]intervalos= m.algorithmEM(dtmp);

                //System.out.println(Arrays.toString(intervalos));
                    
                //intervalSetsForConfigurations.get(intervalSetsForConfigurations.size() - 1).add(new IntervalSet(intervalos));
                intervalSetsForConfigurations.get(intervalSetsForConfigurations.size() - 1).add(intervals);
            }
        }*/

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
            //System.out.println("Records loaded " + records.size());
            
            records.writeToArff("gmInicialization.arff", "Default", "-1");
            Kmeans k = new Kmeans("gmInicialization.arff");*/
            
            for(int kClus=1;kClus<=3;kClus++){
                //System.out.println(file);
                DataSet dtmp=c.preprocess(file, 1,false);
                /*mean = new double[kClus];
                std = new double[kClus];
                mixing = new double[kClus];
                //System.out.println("After preprocess> " + dtmp.getInstances().size());
                

                    intervals = k.run(kClus, 0);
                    for(int i = 0; i < intervals.size(); ++i){
                        t = new Temporal(intervals.getIntervalAtIndex(i).stringForm(),2);
                        mean[i] = t.getMean();
                        //System.out.println("mean " + mean[i]);
                        std[i] = t.getStd();
                        //System.out.println("std " + std[i]);
                        mixing[i] = getPointsPerCluster(records,t)/(double)records.size();
                        //System.out.println("mixing " + mixing[i]);
                    }*/
                
                
                MixtureGaussians m= new MixtureGaussians(kClus);
                //Interval[]intervalos= m.algorithmEM(dtmp,mean,std,mixing);
                Interval[]intervalos= m.algorithmEM(dtmp);

                //System.out.println(Arrays.toString(intervalos));
                    
                intervalSetsForConfigurations.get(intervalSetsForConfigurations.size() - 1).add(new IntervalSet(intervalos));
            }
        }
        
        private static double getMeanOfData(KnowledgeSet k){
            double mean = 0.0;
            ArrayList<Record> records = k.getRecords();
            String value;
            double total = 0.0;
            
            for(Record r : records){
                value = r.getValueOfFieldAt(0).toString();
                if(!value.equals("Default")){
                    mean += Double.parseDouble(value);
                    total++;
                }
            }
            return mean/total;
        }
        
        private static double getStdOfData(KnowledgeSet k, double mean){
            double std = 0.0;
            ArrayList<Record> records = k.getRecords();
            String value;
            double total = 0.0;
            
            for(Record r : records){
                value = r.getValueOfFieldAt(0).toString();
                if(!value.equals("Default")){
                    std += (mean - Double.parseDouble(value)) * (mean - Double.parseDouble(value));
                    total++;
                }
            }
            std /= (double)(total - 1);
            return Math.sqrt(std);
        }
        
        private static double getPointsPerCluster(KnowledgeSet k, Temporal t){
            double points = 0.0;
            String value;
            ArrayList<Record> records = k.getRecords();
            
            for(Record r : records){
                value = r.getValueOfFieldAt(0).toString();
                if(!value.equals("Default")){
                    if(t.inRange(Double.parseDouble(r.getValueOfFieldAt(0).toString()))){
                        points++;
                    }
                }
            }
            return points;
        }
        
        private static FieldValuePair[] getAuxConfiguration(ArrayList<RandomVariable> auxVars, ArrayList<FieldValuePair> targetConfiguration){
            FieldValuePair [] auxConfiguration = new FieldValuePair[auxVars.size()];
            
            int i = 0;
            for(RandomVariable r : auxVars){
                for(FieldValuePair pair : targetConfiguration){
                    if(pair.getFieldName().equals(r.getName())){
                        auxConfiguration[i++] = new FieldValuePair(pair.getField(),pair.getValue()); 
                    }
                }
            }
            return auxConfiguration;
        }
        
        private static ArrayList<RandomVariable> getAdditionalParents(ArrayList<RandomVariable> targetParents, ArrayList<RandomVariable> auxParents){
            ArrayList<RandomVariable> extra = new ArrayList<>();
            
            for(RandomVariable r : auxParents){
                if(!targetParents.contains(r)){
                    extra.add(r);
                }
            }
            return extra;
        }
	
	private static void generateAuxRecords(AuxiliaryTemporalVariable [] auxDomains, int dataSetSize, KnowledgeSet newSet){
		int amount;
		double proportion;
		double totalSimilarity = 0.0;
		int totalDomains = auxDomains.length;
		
		for(int i = 0; i < totalDomains; ++i) {
                    totalSimilarity += auxDomains[i].getSimilarity();
                }
			
		for(int i = 0; i < totalDomains; ++i){
			proportion = auxDomains[i].getSimilarity() / totalSimilarity;
			amount = (int)(proportion * dataSetSize);
			
			generateRecords(auxDomains[i],amount,newSet);
		}
	}

	private static void generateRecords(TemporalVariable v, int amount, KnowledgeSet newSet){
                if(v != null){
                    int numRecords; /* the amount of records to generate */
                    double data; /* a generated value that belongs to a distribution d */
                    int varVals = v.numberOfValues(); /* the number of values a variable can take on */
                    ProbabilityDistribution p = v.getProbabilityDistribution(); /* The probability distribution for the temporal variable v */
                    Distribution [] d = v.getDistribution(); /* The distributions that characterize the values of the temporal variable */
                    Temporal t;
                    Record r; /* A record to be added to newSet */
                    //double normalize = p.totalProbability() - p.probabilityOf("Default");

                    for(int val = 0; val < varVals; ++val){
                            if(!v.getValues()[val].toString().equals("Default")){
                                    numRecords = (int)((p.probabilityOf(val)/*/normalize*/) * amount);
                                    for(int i = 0; i < numRecords; ++i){
                                            r = new Record(1);
                                            t = new Temporal(v.getValues()[val].toString(),2);
                                            data = d[val].generate();
                                            while(data < t.getLowerBounds() || data > t.getUpperBounds()){
                                                data = d[val].generate();
                                            }
                                            r.addFieldValuePair(new FieldValuePair(newSet.getFieldAt(0),data));
                                            newSet.addRecord(r);
                                    }
                            }
                    }
                }
	}
        
        private static void generateRecords(ProbabilityDistribution p, int amount, KnowledgeSet newSet){
		int numRecords; /* the amount of records to generate */
		double data; /* a generated value that belongs to a distribution d */
		Record r; /* A record to be added to newSet */
		//double normalize = p.totalProbability() - p.probabilityOf("Default");
		int varVals = p.getProbabilityTable().length;
                String value;
                Distribution d;
                Temporal t;
		
		for(int val = 0; val < varVals; ++val){
                    value = p.getProbabilityTable()[val].getValue();
                    if(!value.equals("Default")){
			numRecords = (int)((p.probabilityOf(val)/*/normalize*/) * amount);
			for(int i = 0; i < numRecords; ++i){
                            r = new Record(1);
                            t = new Temporal(value,2);
                            d = new NormalDistribution(t.getMean(), t.getStd());
                            data = d.generate();
                            while(data < t.getLowerBounds() || data > t.getUpperBounds()){
                                data = d.generate();
                            }
                            r.addFieldValuePair(new FieldValuePair(newSet.getFieldAt(0),data));
                            newSet.addRecord(r);
                        }
                    }
		}
	}
        
        private static ArrayList<ArrayList<FieldValuePair>> getConfigurations(TemporalVariable v){
            ArrayList<RandomVariable> parents = v.getParents();
            
            if(parents.size() > 1){
                return getConfigurationsMultipleParents(parents);
            } else {
                if(parents.size() == 1){
                    return getConfigurationsSingleParent(parents.get(0));
                } else {
                    return new ArrayList<ArrayList<FieldValuePair>>();
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
        
        private static ArrayList<Temporal> getDataPartition(KnowledgeSet k, ArrayList<FieldValuePair> configuration, TemporalVariable v){
            ArrayList<Temporal> data = new ArrayList<>();
            Record r = new Record();
            KnowledgeSet k1;
            int index;
            
            for(int i = 0; i < k.numberOfFields(); ++i){
                r.addFieldValuePair(null);
            }
            
            for(int i = 0; i < configuration.size(); ++i){
                r.setValueAt(k.getIndexOfField(configuration.get(i).getFieldName()), configuration.get(i).getValue());
            }
            
            k1 = new KnowledgeSet(k.getFields(),k.getRecords(r));
            index = k1.getIndexOfField(v.getName());
            
            for(int i = 0; i < k1.size(); ++i){
                if(!k1.getRecordAt(i).getValueOfFieldAt(index).equals("Default")){
                    data.add((Temporal)k1.getRecordAt(i).getValueOfFieldAt(index));
                }
            }
            return data;
        }
        
	
}