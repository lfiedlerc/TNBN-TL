/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package TNBN_TL;

import LIPS.IntervalSet;
import TNBN_TL.Clustering.Kmeans;
import TNBN_TL.Knowledge.BooleanField;
import TNBN_TL.Knowledge.DoubleField;
import TNBN_TL.Knowledge.Field;
import TNBN_TL.Knowledge.IntegerField;
import TNBN_TL.Knowledge.KnowledgeSet;
import TNBN_TL.Knowledge.StringField;
import TNBN_TL.Knowledge.TemporalField;
import elvira.Bnet;
import elvira.FiniteStates;
import elvira.NodeList;
import elvira.database.DataBaseCases;
import elvira.parser.ParseException;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.lang3.ArrayUtils;

/**
 *
 * @author lfiedlerc
 */
public class TNBN_TL {
    static String inputPath, outputPath, referenceNetwork;
    static ArrayList<String> [] nodeOrdering;
    static int [] continuous, initialNumIntervals, numberOfTestCases;
    static int maxIntervals, factor;
    static double threshold;
    static TNBN targetModel, auxModels [];
    static String [] trainingSet, testingSet;
    static boolean refinement;
    static double alpha;
    static int growthFactor = 1;
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException{
        boolean learn = true;
        boolean evaluate = true;
        
        boolean transfer = true;
        
        boolean refNet = false;
        
        //"C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/HIV/Learn Europe/10-fold CV 80pct/Transfer/Naive Transfer/Europe.conf";
        //String configuration = "C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/HIV/Learn Subtype C/Learn from 100pct/TNBN_TL/C.conf";
        String configuration = "C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/Collision Network/10-fold CV 100 records/Transfer/TNBN_TL/Refinement/Collision.conf";
        String eval = "Evaluation Results.txt";
        
        readEnvironment(configuration);
        
        if(!learn){
            if(evaluate){
                evaluate(eval,refNet);
            }
        } else {
            if(!transfer){
                if(!evaluate){
                    build_TNBN();
                }else{
                    build_Evaluate_TNBN(refNet);
                }
            } else {
                if(!evaluate){
                    build_TNBN_TL();
                }else{
                    build_Evaluate_TNBN_TL(refNet);
                }
            }
        }
    }
    
    public static void build_TNBN(){
        String elv;
       
        learn_TNBN(trainingSet[0]);

        elv = outputPath + "model_" + threshold + ".elv";
        targetModel.makeElviraNet(elv);
    }
    
    public static void build_TNBN_TL(){
        String elv;

        learn_TNBN_TL_Cluster_Analysis(trainingSet[0]);

        elv = outputPath + "model_" + threshold + ".elv";
        targetModel.makeElviraNet(elv);
    }
    
    public static void build_Evaluate_TNBN(boolean referenceNet) throws IOException{
        String elv, numberToInterval,txtToDBC;
        Bnet learnedModel;
        ArrayList<Temporal[]> intervals;
        
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
            learn_TNBN(trainingSet[i]);
            
            intervals = new ArrayList<>();
            for(int j = 0; j < continuous.length; ++j){
                intervals.add((Temporal[])targetModel.getNodes().get(continuous[j]).getValues());
            }
            
            elv = outputPath + "partition" + i + "_model.elv";
            targetModel.makeElviraNet(elv);
                       
            try{
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
                        intervalEditDistance[j][i] += EvaluateNetwork.intervalEditDistance(referenceNetwork, elv, targetModel.getNode(continuous[j]).getName());
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
    
    public static void build_Evaluate_TNBN_TL(boolean referenceNet) throws IOException{
        String elv, numberToInterval,txtToDBC;
        Bnet learnedModel;
        ArrayList<Temporal[]> intervals;
        int numTests = 0;
        
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
            learn_TNBN_TL_Cluster_Analysis(trainingSet[i]);
            
            intervals = new ArrayList<>();
            for(int j = 0; j < continuous.length; ++j){
                intervals.add((Temporal[])targetModel.getNodes().get(continuous[j]).getValues());
            }
            
            elv = outputPath + "partition" + i + "_model.elv";
            targetModel.makeElviraNet(elv);
                       
            try{
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
                        intervalEditDistance[j][i] += EvaluateNetwork.intervalEditDistance(referenceNetwork, elv, targetModel.getNode(continuous[j]).getName());
                    }
                }
            }catch(ParseException | IOException e){
                e.printStackTrace();
            }
            System.out.println("\n");
            System.out.println("The returned value is > " + StructureTLNodeOrdering.numTests);
            numTests += StructureTLNodeOrdering.numTests;
        }
        System.out.println("Average num tests > " + numTests/trainingSet.length);
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
    
    public static void evaluate(String eval, boolean referenceNet) throws IOException{
        String elv, numberToInterval,txtToDBC;
        Bnet learnedModel;
        ArrayList<Temporal[]> intervals = new ArrayList<>();;
        Bnet network = null;
        FiniteStates node;
        String [] states;
        
        double [] avgBrierScore = new double[trainingSet.length];
        double [] avgBinaryBrierScore = new double[trainingSet.length];
        double [] avgTimeDifference = new double[trainingSet.length];
        double [] avgEditDistance = new double[trainingSet.length];
        double [] avgPrediction = new double[trainingSet.length];
        double [] avgTemporalPredictionError = new double[trainingSet.length];
        double brierMean = 0.0, brierStd = 0.0, timeDiffMean = 0.0, timeDiffStd = 0.0, editDistMean = 0.0, editDistStd = 0.0, intervalEditDistMean = 0.0, intervalEditDistStd = 0.0;
        double binaryBrierMean = 0.0, binaryBrierStd = 0.0;
        double [][] intervalEditDistance = new double[continuous.length][trainingSet.length];
        
        BufferedWriter out = new BufferedWriter(new FileWriter(outputPath + eval));
        out.write("Metric\tMean\tStd");
        out.newLine();

        for(int i = 0; i < trainingSet.length; ++i){           
            elv = outputPath + "partition" + i + "_model.elv";
            
            if (elv !=null){
                try{
                    FileInputStream fnet = new FileInputStream(elv);
                    network = new Bnet(fnet);
                    
                    intervals = new ArrayList<>();
                    for(int j = 0; j < continuous.length; ++j){
                        node = (FiniteStates)network.getNode(targetModel.getNodes().get(continuous[j]).getName().replace(' ', '_'));
                        states = node.getStringStates();
                        ArrayUtils.reverse(states);
                        intervals.add((Temporal[])Temporal.toTemporal(states));
                    }
                }catch(ParseException | IOException e){e.printStackTrace();}
            }
                       
            try{
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
                        intervalEditDistance[j][i] += EvaluateNetwork.intervalEditDistance(referenceNetwork, elv, targetModel.getNode(continuous[j]).getName());
                    }
                }
            }catch(ParseException | IOException e){
                e.printStackTrace();
            }
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
    
    public static void learn_TNBN_TL_Cluster_Analysis(String trainingSet){
        KnowledgeSet targetKnowledgeCpy, targetKnowledgeCpy1; /* A copy of the target knowledge set */
        boolean [][] targetStructure; /* The structure of the model learned with Transfer Learning */
        Kmeans k; /* Applies Kmeans to the initial continuous data */
        int totalAuxRecords = 0;
        String arff = inputPath + "TargetData.arff";
        
        targetModel.getKnowledgeSet().loadKnowledge(trainingSet);
        targetKnowledgeCpy = targetModel.getKnowledgeSet().copy();
        targetKnowledgeCpy1 = targetModel.getKnowledgeSet().copy();
        
        targetKnowledgeCpy.writeToArff(arff,"Default","-1");
		
        int numRecordsToGenerate; /* The number of records to generate to do the interval transfer learning */
	double [] similarity = new double[auxModels.length];
	int mostSimilar;
        String [] varNames = targetModel.getListOfVariables().toArray(new String[targetModel.getNodes().size()]);
        
	for(int i = 0; i < auxModels.length; ++i){
            totalAuxRecords += auxModels[i].getKnowledgeSet().size();
        }
        
        
        IntervalSet tempIntervals;
	TemporalVariable v; /* A temporal random variable */
	Temporal [] t; /* An array of temporal ranges */
	Distribution [] d; /* A distribution that characterizes the temporal ranges */
	double [] count; /* count[j] holds the number of values of a column of the KnowledgeSet that are in the temporal range t[j] */
	int total; /* The total number of records of column continuous[i] that hold values different to "Default" */
        ProbabilityDistribution p; /* A probability distribution for a TemporalVariable */
	double value;
        ArrayList<Temporal> initial;
        for(int i = 0; i < continuous.length; ++i){
            total = 0;
            ArrayList<String> initialIntervals = new ArrayList<>(); /* Holds the initial intervals obtained by kmeans before transfer of knowledge has occurred */
                k = new Kmeans(arff);
                tempIntervals = k.run(initialNumIntervals[i], continuous[i]); 
                initialIntervals = tempIntervals.intervalsToStringForm();
            
            
            t = new Temporal[initialIntervals.size()];
            d = new Distribution[initialIntervals.size()];
            count = new double[initialIntervals.size()];
            for(int j = 0; j < t.length; ++j){
                System.out.println("Initial Interval: " + initialIntervals.get(j));
		if(j < t.length - 1){
                    t[j] = new Temporal(initialIntervals.get(j),1);
                } else {
                    t[j] = new Temporal(initialIntervals.get(j),2);
                }
		d[j] = new NormalDistribution(t[j].getMean(), t[j].getStd());
            }
            v = (TemporalVariable)targetModel.getNode(continuous[i]);
            v.setValues(t); /* Set the values of the TemporalVariable at index continuous[i] to the obtained intervals */
            v.setDistribution(d); /* Set the distribution of the TemporalVariable at index continuous[i] to d */
            
            /* This for cycle is used to obtain the needed values to create the probability distribution for each TemporalVariable */
            for(int l = 0; l < targetModel.getKnowledgeSet().size(); ++l){
                if(!targetModel.getKnowledgeSet().getValueOfField(l,continuous[i]).toString().equals("Default")){
                    total++;
                    value = Double.parseDouble(targetModel.getKnowledgeSet().getValueOfField(l,continuous[i]).toString());
                    for(int j = 0; j < t.length; ++j){
                        if(t[j].inRange(value)){
                            count[j]++;
                        }
                    }
                }
            }
            /* Calculate the probability of each interval */
            double totalProb = 0;
            for(int l = 0; l < count.length; ++l){
                count[l] = count[l]/(double)total;
		totalProb += count[l];
            }
            /* Normalize */
            for(int l = 0; l < count.length; ++l){
                count[l] = count[l]/totalProb;
            }

            p = new ProbabilityDistribution(v.getName(), initialIntervals.toArray(new String[initialIntervals.size()]), count); /* create the probability distribution */
            v.setProbabilityDistribution(p); /* Set the probability distribution of the TemporalVariable at index continuous[i] to the obtained distribution */
            
            initial = new ArrayList<>(Arrays.asList(t));
            initial.add(new Temporal());
            t = initial.toArray(new Temporal[initial.size()]);
            targetKnowledgeCpy.setFieldValues(continuous[i],new ArrayList<>(Arrays.asList(t))); /* Set the values of the TemporalField at index continuous[i] to the obtained intervals */   
            
            for(int l = 0; l < targetKnowledgeCpy.size(); ++l){
                if(!targetKnowledgeCpy.getValueOfField(l,continuous[i]).toString().equals("Default")){
                    value = Double.parseDouble(targetKnowledgeCpy.getValueOfField(l,continuous[i]).toString());
                    for(int j = 0; j < t.length; ++j){
                        if(t[j].inRange(value)){
                            targetKnowledgeCpy.setValueOfField(l,continuous[i],t[j]);
                            break;
			} else {
                            targetKnowledgeCpy.setValueOfField(l,continuous[i],"Default");
			}
                    }
                }
            }	
        }
        
        
        
        mostSimilar = getMostSimilar(varNames, similarity, targetKnowledgeCpy);
        
        ArrayList<RandomVariable> auxVars = auxModels[mostSimilar].getNodes();
        	
	numRecordsToGenerate = getNumberOfRecordsToGenerate(auxVars);
        if(numRecordsToGenerate > 10000){
            numRecordsToGenerate = 10000;
        }
        
        setWeights(numRecordsToGenerate,targetModel.getKnowledgeSet().size(),totalAuxRecords);
        
        int numRecordsPerConfiguration = numRecordsToGenerate;
        if(numRecordsToGenerate == 10000){
            numRecordsPerConfiguration = numRecordsToGenerate/10;
        }
        
        /* ----------------------------------------------------- Start of initial interval learning with TL --------------------------------------------------------------- */
        
        ArrayList<AuxiliaryTemporalVariable[]> auxTemporalVariables = new ArrayList<>(); /* An arraylist of arrays of type AuxiliaryTemporalVariable */
	AuxiliaryTemporalVariable [] auxiliaryTempVars;
	Distribution [] auxDist;
	AuxiliaryTemporalVariable r;
	Object [] tempVals;
	Temporal auxT;
        int index;
        
	for(int i = 0; i < continuous.length; ++i){
            auxiliaryTempVars = new AuxiliaryTemporalVariable[auxModels.length];
            for(int j = 0; j < auxModels.length; ++j){
                r = (AuxiliaryTemporalVariable)auxModels[j].getNode(targetModel.getNode(continuous[i]).getName());
                if(r != null){
                    tempVals = r.getValues();
                    auxDist = new Distribution[tempVals.length - 1];
                    index = 0;
                    for(int l = 0; l < tempVals.length; ++l){
                        if(!tempVals[l].toString().equals("Default")){
                            auxT = (Temporal)tempVals[l];
                            auxDist[index] = new NormalDistribution(auxT.getMean(), auxT.getStd());
                            index++;
                        }
                    }
                    r.setSimilarity(similarity[j]);
                    auxiliaryTempVars[j] = new AuxiliaryTemporalVariable(varNames[continuous[i]], (Temporal[])auxModels[j].getNode(targetModel.getNode(continuous[i]).getName()).getValues(), auxDist, r.getProbabilityDistribution(), similarity[j]);
                } else {
                    auxiliaryTempVars[j] = null;
                }
            }
            auxTemporalVariables.add(auxiliaryTempVars);
        }
        
        Temporal [] transferedIntervals; /* The intervals learned with Transfer Learning */
	ArrayList<Temporal> transfered; /* An array list with the intervals learned with TL */
	
 
	for(int i = 0; i < continuous.length; ++i){
            v = (TemporalVariable)targetModel.getNode(continuous[i]);
            transferedIntervals = IntervalTL.transferKnowledge(v, auxTemporalVariables.get(i), initialNumIntervals[i], numRecordsToGenerate, (int)(numRecordsToGenerate * 0.25)); /* Transfer knowledge from auxiliary domains */
            transfered = new ArrayList<>(Arrays.asList(transferedIntervals));
            transfered.add(new Temporal());
            transferedIntervals = transfered.toArray(new Temporal[transfered.size()]);
			
            v.setValues(transferedIntervals); /* Set the values of the TemporalVariable at index continuous[i] to the obtained intervals */
            targetKnowledgeCpy1.setFieldValues(continuous[i],new ArrayList<>(Arrays.asList(transferedIntervals))); /* Set the values of the TemporalField at index continuous[i] to the obtained intervals */        
            
            /* Recalculate the distribution based on the new intervals */
            d = new Distribution[transferedIntervals.length - 1];
            for(int j = 0; j < transferedIntervals.length - 1; ++j){
                System.out.println("New Interval: " + transferedIntervals[j].toString());
                d[j] = new NormalDistribution(transferedIntervals[j].getMean(),transferedIntervals[j].getStd());
            }
            
            v.setDistribution(d); /* Set the distribution of the TemporalVariable at index continuous[i] to d */
                
            /* Update the KnowledgeSet to use the learned intervals instead of the continuous data */
            for(int l = 0; l < targetKnowledgeCpy1.size(); ++l){
                if(!targetKnowledgeCpy1.getValueOfField(l,continuous[i]).toString().equals("Default")){
                    value = Double.parseDouble(targetKnowledgeCpy1.getValueOfField(l,continuous[i]).toString());
                    for(int j = 0; j < transferedIntervals.length - 1; ++j){
                        if(transferedIntervals[j].inRange(value)){
                            targetKnowledgeCpy1.setValueOfField(l,continuous[i],transferedIntervals[j]);
                            break;
			} else {
                            targetKnowledgeCpy1.setValueOfField(l,continuous[i],"Default");
			}
                    }
                }
            }			
        }
        
        /* ----------------------------------------------------- End of initial interval learning with TL ----------------------------------------------------------------- */
        
        KnowledgeSet [] aux = new KnowledgeSet[auxModels.length]; /* An array of auxiliary KnowledgeSets */
        for(int i = 0; i < aux.length; ++i){
            aux[i] = auxModels[i].getKnowledgeSet();
        }
        
        int iteration = 1;
        String elvPrevious = null;
        String elvNew = null;
        boolean change = false;
        double editDistance;
        DataBaseCases cases;
        Bnet net;
        FileWriter out;
        KnowledgeSet newKnowledge;
        NodeList vars;
        ArrayList<Field> fields;
        int indexOfField;
        
        do{	
            /* ----------------------------------------------------- Start of initial structure learning with TL ----------------------------------------------------------------- */

            targetStructure = StructureTLNodeOrdering.PC_TL(nodeOrdering, targetKnowledgeCpy1, aux, threshold); /* Learn the structure with PC_TL */
            targetModel.setGraph(targetStructure); /* Set the structure of the target model to the learned structure */

            ArrayList<RandomVariable> parents;
            Integer [] incoming;
            for(int i = 0; i < targetStructure.length; ++i){
                System.out.println(targetModel.getNode(i).getName() + " has as parents:");
                parents = new ArrayList<>();
                incoming = Graph.directedIncomingEdges(i, targetStructure);
                for(int j = 0; j < incoming.length; ++j){
                    System.out.println(targetModel.getNodes().get(incoming[j]).getName());
                    parents.add(targetModel.getNodes().get(incoming[j]));
                }
                targetModel.getNodes().get(i).setParents(parents);
                System.out.println();
            }

            targetModel.calculateProbabilityTables(targetKnowledgeCpy1, true); /* Calculate probability tables */
            targetModel.calculateCPTsGivenParents(targetKnowledgeCpy1, true); /* Calculate conditional probability tables */

            /* ----------------------------------------------------- End of initial structure learning with TL ------------------------------------------------------------------- */

            /* Relearn intervals and parameters with structural information */
            if(refinement){
                System.out.println("Refinement");
                IntervalTL.transferKnowledgeWithStructuralInformation_Cluster_Analysis(targetModel, auxModels, targetKnowledgeCpy1, numRecordsPerConfiguration, (int)(numRecordsPerConfiguration * 0.25),maxIntervals);
            } else {
                ParametricTL.instantNodeParametericLearning(targetModel.getNodes(), auxModels, targetModel.getWeight()); /* Learn parameters for all instant nodes */
                ParametricTL.temporalNodeParametricLearning(RandomVariable.getVarsOfType(targetModel.getNodes(), "Temporal"), auxModels, targetModel.getWeight(),true);
            }

            //make elv
            elvPrevious = elvNew;
            elvNew = "iterations/modelIteration" + iteration + " " + trainingSet.substring(trainingSet.length()-14, trainingSet.length()-4) + ".elv";
            targetModel.makeElviraNet(elvNew);
            try {
                if(elvPrevious != null && elvNew != null){
                    editDistance = EvaluateNetwork.editDistance(elvPrevious, elvNew);
                    System.out.println("Edit distance is " + editDistance);
                    if(editDistance == 0.0){
                        change = false;
                    }
                } else {
                    System.out.println("Not two");
                }
                
                if(change){
                    //make new data with previously learned model
                        out = new FileWriter("iterations/newModel.dbc");
                        net = new Bnet(new FileInputStream(elvNew));
                        cases = new DataBaseCases(net,out,targetKnowledgeCpy1.size(),true);
                        ProcessFile.getDBCrecords("iterations/newModel.dbc", "iterations/newModel.txt");
                        vars = cases.getVariables();
                        ProcessFile.transformDBCrecords("iterations/newModel.txt",  "iterations/newModelRecords.txt", cases.getNumberOfCases(), " ", vars); 


                        fields = targetKnowledgeCpy1.getFieldsCopy();
                        for(int i = 0; i < vars.size(); ++i){
                            indexOfField = Field.indexOfField(fields,vars.elementAt(i).getName().replaceAll("_", " "));
                            if(i != indexOfField){
                                fields.add(i,fields.remove(indexOfField));
                            }
                        }
                        newKnowledge = new KnowledgeSet(fields);

                        //load data into targetKnowledgeCpy
                        newKnowledge.loadKnowledge("iterations/newModelRecords.txt");
                        newKnowledge.orderRecords(targetKnowledgeCpy1.getFields());
                        targetKnowledgeCpy1.mergeKnowledgeSets(newKnowledge);

                        setWeights(numRecordsToGenerate, targetKnowledgeCpy1.size(), totalAuxRecords);
                }
                
                System.out.println("Completed iteration " + iteration);
                iteration++;
            } catch (Exception ex) {
                Logger.getLogger(TNBN_TL.class.getName()).log(Level.SEVERE, null, ex);
            }  
       }while(change);
        
    }
    
    /* This one doesn't use transfer learning */
    public static void learn_TNBN(String trainingSet){
        KnowledgeSet targetKnowledgeCpy; /* A copy of the target knowledge set */
        boolean [][] targetStructure; /* The structure of the model learned with Transfer Learning */
        Kmeans k; /* Applies Kmeans to the initial continuous data */
        String arff = inputPath + "TargetData.arff";
        
        targetModel.getKnowledgeSet().loadKnowledge(trainingSet);
        targetKnowledgeCpy = targetModel.getKnowledgeSet().copy();
        
        targetKnowledgeCpy.writeToArff(arff,"Default","-1");
		
        String [] varNames = targetModel.getListOfVariables().toArray(new String[targetModel.getNodes().size()]);
        
        /* ----------------------------------------------------- Start of initial interval learning --------------------------------------------------------------- */
        
        IntervalSet tempIntervals;
	TemporalVariable v; /* A temporal random variable */
	Temporal [] t; /* An array of temporal ranges */
	double value;
 
	for(int i = 0; i < continuous.length; ++i){
            ArrayList<String> initialIntervals; /* Holds the initial intervals obtained by kmeans before transfer of knowledge has occurred */

                k = new Kmeans(arff);
                tempIntervals = k.run(initialNumIntervals[i], continuous[i]); 
                initialIntervals = tempIntervals.intervalsToStringForm();
            
            
            t = new Temporal[initialIntervals.size() + 1];
           
            for(int j = 0; j < t.length - 1; ++j){
                System.out.println("Initial Interval: " + initialIntervals.get(j));
		if(j < t.length - 1){
                    t[j] = new Temporal(initialIntervals.get(j),1);
                } else {
                    t[j] = new Temporal(initialIntervals.get(j),2);
                }
            }
            t[t.length - 1] = new Temporal();
            v = (TemporalVariable)targetModel.getNode(continuous[i]);
            v.setValues(t); /* Set the values of the TemporalVariable at index continuous[i] to the obtained intervals */
            
            targetKnowledgeCpy.setFieldValues(continuous[i],new ArrayList<>(Arrays.asList(t))); /* Set the values of the TemporalField at index continuous[i] to the obtained intervals */        
            
                
            /* Update the KnowledgeSet to use the learned intervals instead of the continuous data */
            for(int l = 0; l < targetKnowledgeCpy.size(); ++l){
                if(!targetKnowledgeCpy.getValueOfField(l,continuous[i]).toString().equals("Default")){
                    value = Double.parseDouble(targetKnowledgeCpy.getValueOfField(l,continuous[i]).toString());
                    for(int j = 0; j < t.length - 1; ++j){
                        if(t[j].inRange(value)){
                            targetKnowledgeCpy.setValueOfField(l,continuous[i],t[j]);
                            break;
			} else {
                            targetKnowledgeCpy.setValueOfField(l,continuous[i],"Default");
			}
                    }
                }
            }			
            initialIntervals.clear();
        }
        
        /* ----------------------------------------------------- End of initial interval learning ----------------------------------------------------------------- */
        
        int iteration = 1;
        String elvPrevious = null;
        String elvNew = null;
        boolean change = false;
        double editDistance;
        DataBaseCases cases;
        Bnet net;
        FileWriter out;
        KnowledgeSet newKnowledge;
        NodeList vars;
        ArrayList<Field> fields;
        int indexOfField;
        
        do{	
            /* ----------------------------------------------------- Start of initial structure learning ----------------------------------------------------------------- */

            targetStructure = Structural_Learning.PC(nodeOrdering, targetKnowledgeCpy); /* Learn the structure with PC_TL */
            targetModel.setGraph(targetStructure); /* Set the structure of the target model to the learned structure */

            ArrayList<RandomVariable> parents;
            Integer [] incoming;
            for(int i = 0; i < targetStructure.length; ++i){
                parents = new ArrayList<>();
                incoming = Graph.directedIncomingEdges(i, targetStructure);
                
                System.out.println("Node " + targetModel.getNode(i).getName() + " has as parents ");
                
                for(int j = 0; j < incoming.length; ++j){
                    parents.add(targetModel.getNodes().get(incoming[j]));
                    System.out.print(targetModel.getNodes().get(incoming[j]).getName() + ", ");
                }
                System.out.println();
                targetModel.getNodes().get(i).setParents(parents);
            }

            /* ----------------------------------------------------- End of initial structure learning ------------------------------------------------------------------- */

            /* Relearn intervals and parameters with structural information */
            System.out.println("Refinement");
            Refine_Intervals.refineIntervals(targetModel, maxIntervals, continuous);

            //make elv
            elvPrevious = elvNew;
            elvNew = "iterations/modelIteration" + iteration + " " + trainingSet.substring(trainingSet.length()-14, trainingSet.length()-4) + ".elv";
            targetModel.makeElviraNet(elvNew);
            try {
                if(elvPrevious != null && elvNew != null){
                    editDistance = EvaluateNetwork.editDistance(elvPrevious, elvNew);
                    System.out.println("Edit distance is " + editDistance);
                    if(editDistance == 0.0){
                        change = false;
                    }
                } else {
                    System.out.println("Not two");
                }
                
                if(change){
                    //make new data with previously learned model
                        out = new FileWriter("iterations/newModel.dbc");
                        net = new Bnet(new FileInputStream(elvNew));
                        cases = new DataBaseCases(net,out,targetKnowledgeCpy.size(),true);
                        ProcessFile.getDBCrecords("iterations/newModel.dbc", "iterations/newModel.txt");
                        vars = cases.getVariables();
                        ProcessFile.transformDBCrecords("iterations/newModel.txt",  "iterations/newModelRecords.txt", cases.getNumberOfCases(), " ", vars); 


                        fields = targetKnowledgeCpy.getFieldsCopy();
                        for(int i = 0; i < vars.size(); ++i){
                            indexOfField = Field.indexOfField(fields,vars.elementAt(i).getName().replaceAll("_", " "));
                            if(i != indexOfField){
                                fields.add(i,fields.remove(indexOfField));
                            }
                        }
                        newKnowledge = new KnowledgeSet(fields);

                        //load data into targetKnowledgeCpy
                        newKnowledge.loadKnowledge("iterations/newModelRecords.txt");
                        newKnowledge.orderRecords(targetKnowledgeCpy.getFields());
                }
                
                System.out.println("Completed iteration " + iteration);
                iteration++;
            } catch (Exception ex) {
                Logger.getLogger(TNBN_TL.class.getName()).log(Level.SEVERE, null, ex);
            }  
       }while(change);
        
    }
    
    private static int getMostSimilar(String [] varNames, double [] similarity, KnowledgeSet k){
        GlobalSimilarity sim; /* An object used to measure how similar an aux model is to the target model based on shared dependencies and independencies */
	double greatestSimilarity = -1;
	int mostSimilar = -1;
        
	for(int i = 0; i < auxModels.length; ++i){
            sim = new GlobalSimilarity(k, auxModels[i].getKnowledgeSet(), varNames);
            similarity[i] = sim.evaluate();
            if(similarity[i] > greatestSimilarity){
                greatestSimilarity =  similarity[i];
		mostSimilar = i;
            }
        }
        return mostSimilar;
    }
    
    public static int getNumberOfRecordsToGenerate(ArrayList<RandomVariable> auxVars){
        ArrayList<RandomVariable> auxParents;
	int numVarProbs;
	int totalProbs = 0;
	
        for(int i = 0; i < auxVars.size(); ++i){
            numVarProbs = 1;
            auxParents = auxVars.get(i).getParents();
            for(int j = 0; j < auxParents.size(); ++j){
                numVarProbs *= auxParents.get(j).numberOfValues();
            }
            numVarProbs *= auxVars.get(i).numberOfValues();
            totalProbs += numVarProbs;
	}
        return factor * totalProbs;
    }
    
    public static void setWeights(int numRecordsToGenerate, int numTargetRecords, int totalAuxRecords){
        double targetWeight = (double)numTargetRecords / (double)numRecordsToGenerate;
        if(targetWeight > 1){
            targetModel.setWeight(0.9);
        } else {
            if(targetWeight >= 0.1){
                targetModel.setWeight(targetWeight);
            } else {
                targetModel.setWeight(0.1);
            }
        }
        
        int size;
        for(int j = 0; j < auxModels.length; ++j){
            size = auxModels[j].getKnowledgeSet().size();
            auxModels[j].setWeight((double)(size * (1 - targetModel.getWeight()))/(double)totalAuxRecords);
	}
    }
    
    public static void readEnvironment(String configuration){
        String line, parameter, varName, varType;
        Object [] varValues;
        String [] parents;
        StringTokenizer tok, tok2;
        targetModel = new TNBN();
        
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
                                        ArrayList<Field> targetFields = new ArrayList<>(numTargetVars);
                                        ArrayList<RandomVariable>targetNodes = new ArrayList<>(numTargetVars);
                                        nodeOrdering = new ArrayList[numTargetVars];
                                        
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
                                            
                                            line = in.readLine();
                                            tok = new StringTokenizer(line,"=");
                                            tok.nextToken();
                                            if(tok.hasMoreTokens()){
                                                tok2 = new StringTokenizer(tok.nextToken().trim(),",");
                                                parents = new String[tok2.countTokens()];
                                                for(int j = 0; j < parents.length; ++j){
                                                    parents[j] = tok2.nextToken().trim();
                                                }
                                                nodeOrdering[i] = new ArrayList<>(Arrays.asList(parents));
                                            } else {
                                                nodeOrdering[i] = new ArrayList<>(Arrays.asList(new String []{}));
                                            }
                                        }
                                        targetModel.setKnowledgeSet(new KnowledgeSet(targetFields));
                                        targetModel.setNodes(targetNodes);
                                        
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
                                case "numberOfAuxDomains":
                                    int numberOfAuxDomains = Integer.parseInt(tok.nextToken().trim());
                                    auxModels = new TNBN[numberOfAuxDomains];
                                    String auxDataSet;
                                    
                                    for(int i = 0; i < numberOfAuxDomains; ++i){
                                        auxModels[i] = new TNBN();
                                        while(!(line = in.readLine()).equals("@End Aux")){
                                            if(line.equals("@Begin Aux")){
                                                line = in.readLine();
                                                tok = new StringTokenizer(line,"=");
                                                tok.nextToken();
                                                auxDataSet = tok.nextToken().trim();
                                                
                                                line = in.readLine();
                                                tok = new StringTokenizer(line,"=");
                                                tok.nextToken();
                                                if(Boolean.parseBoolean(tok.nextToken().trim())){
                                                    String dbcFile = inputPath + auxDataSet;
                                                    String dbcToTxt = inputPath + "aux" + i + "Cases.txt";
                                                    try {
                                                        auxDataSet = auxDataSet.substring(0, auxDataSet.length() - 3) + "txt";
                                                        DataBaseCases cases = new DataBaseCases(new FileInputStream(dbcFile));
                                                        ProcessFile.getDBCrecords(dbcFile, dbcToTxt);
                                                        ProcessFile.transformDBCrecords(dbcToTxt,  inputPath + auxDataSet, cases.getNumberOfCases(), " ", cases.getVariables());       
                                                    } catch (IOException | ParseException e) {
                                                        e.getCause();
                                                    }
                                                }
                                                
                                                line = in.readLine();
                                                tok = new StringTokenizer(line,"=");
                                                tok.nextToken();
                                                int numAuxVars = Integer.parseInt(tok.nextToken().trim());
                                                ArrayList<Field> auxFields = new ArrayList<>(numAuxVars);
                                                ArrayList<RandomVariable>auxNodes = new ArrayList<>(numAuxVars);
                                                ArrayList<String []> parentNodes = new ArrayList<>(numAuxVars);
                                                
                                                for(int j = 0; j < numAuxVars; ++j){
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
                                                        for(int k = 0; k < varValues.length; ++k){
                                                            varValues[k] = tok2.nextToken().trim();
                                                        }
                                                    } else {
                                                        varValues = new String[0];
                                                    }
                                                    switch (varType) {
                                                        case "String":
                                                            auxFields.add(j, new StringField(varName,new ArrayList<>(Arrays.asList((String[])varValues))));
                                                            auxNodes.add(j, new RandomVariable(varName,(String[])varValues));
                                                            break;
                                                        case "Boolean":
                                                            if(varValues[0].equals("true")){
                                                                auxFields.add(j, new BooleanField(varName,new ArrayList<>(Arrays.asList(new Boolean[]{true,false}))));
                                                                auxNodes.add(j, new RandomVariable(varName,new Boolean[]{true,false}));
                                                            } else {
                                                                auxFields.add(j, new BooleanField(varName,new ArrayList<>(Arrays.asList(new Boolean[]{false,true}))));
                                                                auxNodes.add(j, new RandomVariable(varName,new Boolean[]{false,true}));
                                                            }
                                                            break;
                                                        case "Integer":
                                                            auxFields.add(j, new IntegerField(varName,new ArrayList<>(Arrays.asList((Integer[])varValues))));
                                                            auxNodes.add(j, new RandomVariable(varName,(Integer[])varValues));
                                                            break;
                                                        case "Double":
                                                            auxFields.add(j, new DoubleField(varName,new ArrayList<>(Arrays.asList((Double[])varValues))));
                                                            auxNodes.add(j, new RandomVariable(varName,(Double[])varValues));
                                                            break;
                                                        case "Temporal":
                                                            auxFields.add(j, new TemporalField(varName,(String[])varValues));
                                                            auxNodes.add(j, new AuxiliaryTemporalVariable(varName,Temporal.toTemporal((String[])varValues),0.0));
                                                            break;
                                                    }
                                                    
                                                    line = in.readLine();
                                                    tok = new StringTokenizer(line,"=");
                                                    tok.nextToken();
                                                    if(tok.hasMoreTokens()){
                                                        tok2 = new StringTokenizer(tok.nextToken().trim(),",");
                                                        parents = new String[tok2.countTokens()];
                                                        for(int k = 0; k < parents.length; ++k){
                                                            parents[k] = tok2.nextToken().trim();
                                                        }
                                                        parentNodes.add(j,parents);
                                                    } else {
                                                        parentNodes.add(j,new String[0]);
                                                    }
                                                }
                                                auxModels[i].setKnowledgeSet(new KnowledgeSet(auxFields));
                                                auxModels[i].getKnowledgeSet().loadKnowledge(inputPath + auxDataSet);  
                                                auxModels[i].setNodes(auxNodes);
                                                
                                                for(int k = 0; k < auxNodes.size(); ++k){
                                                    ArrayList<RandomVariable> parentNodesList = new ArrayList<>();
                                                    parents = parentNodes.get(k);
                                                    for(int j = 0; j < parents.length; ++j){
                                                        parentNodesList.add(RandomVariable.getRandomVariable(parents[j], auxNodes));
                                                    }
                                                    auxNodes.get(k).setParents(parentNodesList);
                                                }
                                                
                                                auxModels[i].calculateProbabilityTables(true);
                                                auxModels[i].calculateCPTsGivenParents(true);
                                            }
                                        }
                                    }
                                    break;
                                case "NumberOfPartitions" :
                                    int numberOfPartitions = Integer.parseInt(tok.nextToken().trim());
                                    trainingSet = new String[numberOfPartitions];
                                    testingSet = new String[numberOfPartitions];
                                    numberOfTestCases = new int[numberOfPartitions];
                                            
                                    for(int i = 0; i < numberOfPartitions; ++i){
                                        trainingSet[i] = inputPath + "partition" + i + ".txt";
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
                                case "Factor":
                                    factor = Integer.parseInt(tok.nextToken().trim());
                                    break;
                                case "Threshold":
                                    threshold = Double.parseDouble(tok.nextToken().trim());
                                    break;
                                case "Alpha":
                                    alpha = Double.parseDouble(tok.nextToken().trim());
                                    break;
                                case "Refinement":
                                    refinement = Boolean.parseBoolean(tok.nextToken().trim());
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
