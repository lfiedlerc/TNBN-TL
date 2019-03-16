/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package TNBN_TL;

import TNBN_TL.Knowledge.FieldValuePair;
import TNBN_TL.Knowledge.KnowledgeSet;
import TNBN_TL.Knowledge.Record;
import java.util.ArrayList;
import org.apache.commons.math3.distribution.ChiSquaredDistribution;

/**
 *
 * @author lfiedlerc
 */
public class IndependenceTest {
    
    public static void main(String [] args){
        ChiSquaredDistribution chi = new ChiSquaredDistribution(1.0); 
        System.out.println(1.0 - chi.cumulativeProbability(5));
    }
    
    public static boolean isIndependent(KnowledgeSet k, String nodeX, String nodeY, String [] subset, double threshold){
        int x = k.getIndexOfField(nodeX);
        int y = k.getIndexOfField(nodeY);
	ArrayList valuesX = k.getFieldValues(x);
	ArrayList valuesY = k.getFieldValues(y);
        int numValsX = valuesX.size();
	int numValsY = valuesY.size();
        int subsetSize = subset.length;
        int numberOfFields = k.numberOfFields();
        Record r1 = new Record(numberOfFields);
        int observedFrequencyX,  observedFrequencyY;
        int totalRecords = k.size();
        
        ArrayList [] subsetValues = new ArrayList[subsetSize];
        int [] numVals = new int[subsetSize];
        int [] valueIndexes = new int[subsetSize];
        int [] subsetIndexes = new int[subsetSize];
        int numValsS = 1;
        int j;
        boolean cont;
        
        for(int i = 0; i < numberOfFields; ++i){
            r1.addFieldValuePair(new FieldValuePair(k.getFieldAt(i),null));
        }
            
        for(int i = 0; i < subsetSize; ++i){ 
            subsetIndexes[i] = k.getIndexOfField(subset[i]);
            subsetValues[i] = k.getFieldValues(subset[i]);
            numVals[i] = subsetValues[i].size();
            numValsS *= numVals[i];
        }
            
        double [][] observed = new double [numValsX*numValsS][numValsY*numValsS];
        double [][] expected = new double [numValsX*numValsS][numValsY*numValsS];
            
            for(int i = 0; i < numValsS; ++i){
               j = 1;
               cont = true;
               while(j <= subsetSize && cont){
                    if(valueIndexes[subsetSize - j] >= numVals[subsetSize - j]){
			valueIndexes[subsetSize - j] = 0;
			valueIndexes[subsetSize - j - 1] += 1;
			j++;
                    }else{
			cont = false;
                    }
               }
			
	       for(int l = 0; l < subsetSize; ++l){
                    r1.setValueAt(subsetIndexes[l],subsetValues[l].get(valueIndexes[l]));
               }
               
               if(subsetSize > 0){
                    valueIndexes[subsetSize - 1] += 1;
               }
               
               for(int m = 0; m < numValsX*numValsS; ++m){
                    r1.setValueAt(x,valuesX.get(m));
                    for(int n = 0; n < numValsY*numValsS; ++n){
                        r1.setValueAt(y,valuesY.get(n));
                        observed[m][n] = k.getRecords(r1).size();
                    }
               }

               for(int m = 0; m < numValsX*numValsS; ++m){
                    observedFrequencyX = 0;
                    for(int n = 0; n < numValsY*numValsS; ++n){
                        observedFrequencyX += observed[m][n];
                    }
                    for(int n = 0; n < numValsY; ++n){
                        expected[m][n] = (double)observedFrequencyX/(double)totalRecords;
                    }  
               }
            
               for(int n = 0; n < numValsY*numValsS; ++n){
                    observedFrequencyY = 0; 
                    for(int m = 0; m < numValsX*numValsS; ++m){
                        observedFrequencyY += observed[m][n];
                    }
                    for(int m = 0; m < numValsX; ++m){
                        expected[m][n] *= (double)observedFrequencyY;
                    }
               }
            
               if(chiSquareTest(observed,expected) < threshold){
                    return true;
               }
            }
            return false;
        }    
    
    /*public static boolean isIndependent(KnowledgeSet k, String nodeX, String nodeY, String [] subset, double threshold){
        int x = k.getIndexOfField(nodeX);
        int y = k.getIndexOfField(nodeY);
	ArrayList valuesX = k.getFieldValues(x);
	ArrayList valuesY = k.getFieldValues(y);
        int numValsX = valuesX.size();
	int numValsY = valuesY.size();
        int subsetSize = subset.length;
        int numberOfFields = k.numberOfFields();
        Record r1 = new Record(numberOfFields);
        int observedFrequencyX,  observedFrequencyY;
        int totalRecords = k.size();
        
        for(int i = 0; i < numberOfFields; ++i){
            r1.addFieldValuePair(new FieldValuePair(k.getFieldAt(i),null));
        }
        
        if(subsetSize == 0){
            double [][] observed = new double[numValsX][numValsY];
            double [][] expected = new double[numValsX][numValsY];
            
            for(int m = 0; m < numValsX; ++m){
                r1.setValueAt(x,valuesX.get(m));
                for(int n = 0; n < numValsY; ++n){
                    r1.setValueAt(y,valuesY.get(n));
                    observed[m][n] = k.getRecords(r1).size();
		}
            }
            
            for(int m = 0; m < numValsX; ++m){
                observedFrequencyX = 0;
                for(int n = 0; n < numValsY; ++n){
                    observedFrequencyX += observed[m][n];
		}
                for(int n = 0; n < numValsY; ++n){
                    expected[m][n] = (double)observedFrequencyX/(double)totalRecords;
		}  
            }
            
            for(int n = 0; n < numValsY; ++n){
               observedFrequencyY = 0; 
               for(int m = 0; m < numValsX; ++m){
                   observedFrequencyY += observed[m][n];
               }
               for(int m = 0; m < numValsX; ++m){
                   expected[m][n] *= (double)observedFrequencyY;
               }
            }
            
            if(chiSquareTest(observed,expected) < threshold){
                return true;
            } 
        } else {
            ArrayList [] subsetValues = new ArrayList[subsetSize];
            int [] numVals = new int[subsetSize];
            int [] valueIndexes = new int[subsetSize];
            int [] subsetIndexes = new int[subsetSize];
            int numValsS = 1;
            int j;
            boolean cont;
            
            for(int i = 0; i < subsetSize; ++i){ 
		subsetIndexes[i] = k.getIndexOfField(subset[i]);
		subsetValues[i] = k.getFieldValues(subset[i]);
		numVals[i] = subsetValues[i].size();
		numValsS *= numVals[i];
            }
            
            double [][][] observed = new double [numValsX][numValsY][numValsS];
            double [][][] expected = new double [numValsX][numValsY][numValsS];
            
            for(int i = 0; i < numValsS; ++i){
               j = 1;
               cont = true;
               while(j <= subsetSize && cont){
                    if(valueIndexes[subsetSize - j] >= numVals[subsetSize - j]){
			valueIndexes[subsetSize - j] = 0;
			valueIndexes[subsetSize - j - 1] += 1;
			j++;
                    }else{
			cont = false;
                    }
               }
			
	       for(int l = 0; l < subsetSize; ++l){
                    r1.setValueAt(subsetIndexes[l],subsetValues[l].get(valueIndexes[l]));
               }
			
	       valueIndexes[subsetSize - 1] += 1;
               
               for(int m = 0; m < numValsX; ++m){
                    r1.setValueAt(x,valuesX.get(m));
                    for(int n = 0; n < numValsY; ++n){
                        r1.setValueAt(y,valuesY.get(n));
                        observed[m][n][i] = k.getRecords(r1).size();
                    }
               }

               for(int m = 0; m < numValsX; ++m){
                    observedFrequencyX = 0;
                    for(int n = 0; n < numValsY; ++n){
                        observedFrequencyX += observed[m][n][i];
                    }
                    for(int n = 0; n < numValsY; ++n){
                        expected[m][n][i] = (double)observedFrequencyX/(double)totalRecords;
                    }  
               }
            
               for(int n = 0; n < numValsY; ++n){
                    observedFrequencyY = 0; 
                    for(int m = 0; m < numValsX; ++m){
                        observedFrequencyY += observed[m][n][i];
                    }
                    for(int m = 0; m < numValsX; ++m){
                        expected[m][n][i] *= (double)observedFrequencyY;
                    }
               }
            
               if(chiSquareTest(observed,expected) < threshold){
                    return true;
               }
            }
        } 
        return false;
    }*/
    
    private static double chiSquareTest(double [][][] observed, double [][][] expected){
        double chi = 0.0;
        for(int s = 0; s < observed[0][0].length; ++s){
            for(int x = 0; x < observed[0].length; ++x){
                for(int y = 0; y < observed.length; ++y){
                    chi += (observed[x][y][s] - expected[x][y][s]) * (observed[x][y][s] - expected[x][y][s]) / expected[x][y][s];
                }
            }
        }
        return chi;
    }
    
    private static double chiSquareTest(double [][] observed, double [][] expected){
        double chi = 0.0;
        for(int x = 0; x < observed[0].length; ++x){
            for(int y = 0; y < observed.length; ++y){
                chi += (observed[x][y] - expected[x][y]) * (observed[x][y] - expected[x][y]) / expected[x][y];
            }
        }
        return chi;
    }
}
