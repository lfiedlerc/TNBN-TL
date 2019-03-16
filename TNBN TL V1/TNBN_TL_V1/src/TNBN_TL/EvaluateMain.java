package TNBN_TL;

import elvira.Bnet;
import elvira.parser.ParseException;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EvaluateMain{
	public static void main(String [] args) throws ParseException{
            String elv = "C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/Original/Colision network/Collision.elv";
            String testFile = "C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/Original/Colision network/targetContinuous.txt";
            String numberToInterval = "C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/Original/Colision network/numToInterval.txt";
            int numTest = 5;
            ArrayList<Temporal[]> intervals = new ArrayList<>();
            intervals.add(new Temporal[]{new Temporal("[0-15]",1),new Temporal("[15-30]",1),new Temporal("[30-60]",2), new Temporal()});
            intervals.add(new Temporal[]{new Temporal("[0-10]",1),new Temporal("[10-45]",2), new Temporal()});
		
		int numCases = 2200;
		int continuous [] = {3,4};
		double precision = 0.0;
                double avgTimeDifference = 0.0;
                double avgTemporalPredictionError = 0.0;
                ProcessFile.numberToInterval(testFile,numberToInterval,continuous, numCases, " ", intervals);
  
                        try {
                            ProcessFile.fileToDBC(numberToInterval,"C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/Original/Colision network/", "txtToDBC", " ", new Bnet(new FileInputStream(elv)).getNodeList());
                        } catch (ParseException ex) {
                            Logger.getLogger(EvaluateMain.class.getName()).log(Level.SEVERE, null, ex);
                        } catch (IOException ex) {
                            Logger.getLogger(EvaluateMain.class.getName()).log(Level.SEVERE, null, ex);
                        }
		for(int i = 0; i < numTest; ++i){
                     precision += EvaluateNetwork.brierScore(elv, "C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/Original/Colision network/txtToDBC.dbc", numCases, continuous);
                     avgTimeDifference += EvaluateNetwork.evaluateIntervals(elv, testFile, "C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/Original/Colision network/txtToDBC.dbc", numCases, continuous);
                     avgTemporalPredictionError += EvaluateNetwork.evaluateTemporalPredictionError(elv, testFile, "C:/Users/lfiedlerc/Dropbox/Thesis/Experimentation/Original/Colision network/txtToDBC.dbc", numCases, continuous);
		}
		precision = precision / numTest;
                avgTimeDifference = avgTimeDifference / numTest;
                avgTemporalPredictionError = avgTemporalPredictionError / numTest;
		System.out.println("Precision is: " + precision);
                System.out.println("Time Difference is: " + avgTimeDifference);
                System.out.println("RTE is: " + avgTemporalPredictionError);
                
                
                System.out.format("%.2f\t%.2f\t%.2f%n",precision,avgTimeDifference,avgTemporalPredictionError);

        
	}
}