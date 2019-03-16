/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package TNBN_TL;

import elvira.Bnet;
import elvira.FiniteStates;
import java.io.FileInputStream;
import java.util.ArrayList;

/**
 *
 * @author lfiedlerc
 */
public class EvaluateLIPS {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int totalPartitions = 5;
        int trainingRecords = 10;
        int [] continuous = new int[]{3,4};
        String elv;
        String originalElv = "LIPS comparison/redBasica.elv";
        String testFileDBC;
        String testFile;
        Bnet learnedModel;
        int numTestCases = 2156;//1760;
        ArrayList<Temporal[]> intervals;
        double avgBrierScore = 0.0;
        double avgTimeDifference = 0.0;
        double avgMseParameters = 0.0;
        double avgEditDistance = 0;
        
        for(int partition = 0; partition < totalPartitions; ++partition){
                    elv = "LIPS comparison/" + trainingRecords + " records/resul/partition" + partition + ".elv";
                    testFileDBC = "partition" + partition + "_Compliment";
                    testFile = "LIPS comparison/" + trainingRecords + " records/partition" + partition + "_Compliment.txt";

                    
                    try{
                        learnedModel = new Bnet(new FileInputStream(elv));
                        intervals = new ArrayList<Temporal[]>();
                        
                        for(int j = 0; j < continuous.length; ++j){
                            FiniteStates node = (FiniteStates)learnedModel.getNodeList().elementAt(continuous[j]);
                            String [] states = node.getStringStates();
                            Temporal [] t = new Temporal[states.length];
                            for(int k = 0; k < states.length - 1; k++){
                                if(k < states.length - 2)
                                    t[k] = new Temporal(states[k].substring(1, states[k].length() - 1),1);
                                else
                                    t[k] = new Temporal(states[k].substring(1, states[k].length() - 1),2);
                            }
                            t[states.length - 1] = new Temporal();
                            intervals.add(t);
                        }
                        
                        ProcessFile.numberToInterval(testFile,"LIPS comparison/" + trainingRecords + " records/targetPartition" + partition + "_intervals.txt",continuous, numTestCases, " ", intervals);
                        ProcessFile.fileToDBC("LIPS comparison/" + trainingRecords + " records/targetPartition" + partition + "_intervals.txt",
                                               "LIPS comparison/" + trainingRecords + " records/", testFileDBC, " ", learnedModel.getNodeList());

                        avgBrierScore += (1 - EvaluateNetwork.brierScore(elv,"LIPS comparison/" + trainingRecords + " records/" + testFileDBC + ".dbc", numTestCases, continuous));
                        avgTimeDifference += EvaluateNetwork.evaluateIntervals(elv, testFile, "LIPS comparison/" + trainingRecords + " records/" + testFileDBC + ".dbc", numTestCases, continuous);
                        avgMseParameters += EvaluateNetwork.mseParameters(originalElv, elv);
                        avgEditDistance += EvaluateNetwork.editDistance(originalElv, elv);
                    }catch(Exception e){
                         e.printStackTrace();
                    }
        }
        
        avgBrierScore /= totalPartitions;
                avgTimeDifference /= totalPartitions;
                avgMseParameters /= totalPartitions;
                avgEditDistance /= totalPartitions;
                
                System.out.println("Relative Brier Score: " + avgBrierScore * 100);
                System.out.println("Time Difference: " + avgTimeDifference);
                System.out.println("Parameters MSE: " + avgMseParameters);
                System.out.println("Edit Distance: " + avgEditDistance);
    }
}
