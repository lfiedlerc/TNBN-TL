package TNBN_TL;

import TNBN_TL.Knowledge.*;
import java.util.ArrayList;
import org.apache.commons.math3.distribution.ChiSquaredDistribution;

public class CrossConditionalEntropy{
	
	public static boolean isIndependent(KnowledgeSet k, String nodeX, String nodeY, String [] subset, double threshold){ 
            int degreesOfFreedom = Math.max(k.getFieldValues(nodeX).size()-1,1)*Math.max(k.getFieldValues(nodeY).size()-1,1);
                double p_value;
                for(int i = 0; i < subset.length; ++i){ 
                    degreesOfFreedom *= k.getFieldValues(subset[i]).size();
		}
                
                double result;
                double g = 2.0*(double)k.size();
		if(subset.length == 0){
			result = MutualInformation.mi(k,nodeX,nodeY);
		} else {
			result = cce(k,nodeX,nodeY,subset);
		}
                g *= result; 
                //System.out.println("g> " + g);
                //System.out.println(degreesOfFreedom);
                ChiSquaredDistribution chi = new ChiSquaredDistribution(degreesOfFreedom); 
                p_value = chi.cumulativeProbability(g);
                //System.out.println("Elvira> " + LogFactorial.chiSquare(g, degreesOfFreedom));
                //System.out.println("P> " + p_value);
                //System.out.println("threshold >" + threshold);
                //if(p_value >= 0.05){
                if(p_value < threshold){
                    return true;
                }
                return false;
	}
	
	public static double cce(KnowledgeSet k, String nodeX, String nodeY, String [] subset){
	
		double result = 0;
		double partialResult;
		double logArg;
		int totalRecords = k.size();
		int x = k.getIndexOfField(nodeX);
		int y = k.getIndexOfField(nodeY);
		ArrayList valuesX = k.getFieldValues(x);
		ArrayList valuesY = k.getFieldValues(y);
		int subsetSize = subset.length;
		ArrayList [] subsetValues = new ArrayList[subsetSize];
		int [] numVals = new int[subsetSize];
		int [] valueIndexes = new int[subsetSize];
		int [] subsetIndexes = new int[subsetSize];
		int limit = 1;
		int j;
		boolean cont;
		int numberOfFields = k.numberOfFields();
		Record r1 = new Record(numberOfFields);
		Record r2 = new Record(numberOfFields);
		Record r3 = new Record(numberOfFields);
		Record r4 = new Record(numberOfFields);
		int numberOfSubsetRecords;
		double probSubset, probXYgivenS, probXgivenS, probYgivenS; 
		double numerator, denominator;
		int numValsX, numValsY;
		
		for(int i = 0; i < numberOfFields; ++i){
			r1.addFieldValuePair(new FieldValuePair(k.getFieldAt(i),null));
			r2.addFieldValuePair(new FieldValuePair(k.getFieldAt(i),null));
			r3.addFieldValuePair(new FieldValuePair(k.getFieldAt(i),null));
			r4.addFieldValuePair(new FieldValuePair(k.getFieldAt(i),null));
		}
		
		for(int i = 0; i < subsetSize; ++i){ 
			subsetIndexes[i] = k.getIndexOfField(subset[i]);
			subsetValues[i] = k.getFieldValues(subset[i]);
			numVals[i] = subsetValues[i].size();
			limit *= numVals[i];
		}
		
		for(int i = 0; i < limit; ++i){
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
				r2.setValueAt(subsetIndexes[l],subsetValues[l].get(valueIndexes[l]));
				r3.setValueAt(subsetIndexes[l],subsetValues[l].get(valueIndexes[l]));
				r4.setValueAt(subsetIndexes[l],subsetValues[l].get(valueIndexes[l]));
			}
			
			valueIndexes[subsetSize - 1] += 1;
			
			numberOfSubsetRecords = k.getRecords(r1).size();
			
			numerator = numberOfSubsetRecords + 1;
			denominator = limit + totalRecords;
			probSubset = (double)numerator/(double)denominator; /* smoothed probability of the subset */
			
			partialResult = 0;
			numValsX = valuesX.size();
			numValsY = valuesY.size();
			for(int m = 0; m < numValsX; ++m){
				r2.setValueAt(x,valuesX.get(m));
				r4.setValueAt(x,valuesX.get(m));
				
				numerator = k.getRecords(r2).size() + 1;
				denominator = numberOfSubsetRecords + numValsX;
				probXgivenS = (double)numerator/(double)denominator; /* smoothed probability of nodeX given the subset */
				
				for(int n = 0; n < numValsY; ++n){
					r3.setValueAt(y,valuesY.get(n));
					r4.setValueAt(y,valuesY.get(n));
					
					numerator = k.getRecords(r3).size() + 1;
					denominator = numberOfSubsetRecords + numValsY;
					probYgivenS = (double)numerator/(double)denominator; /* smoothed probability of nodeY given the subset */

					numerator = k.getRecords(r4).size() + 1;
					denominator = numberOfSubsetRecords + numValsX * numValsY;
					probXYgivenS = (double)numerator/(double)denominator; /* smoothed probability of nodeX and nodeY given the subset */
					logArg = probXYgivenS / (probXgivenS * probYgivenS);
					partialResult += probXYgivenS * (Math.log(logArg));///Math.log(2.0));
				}
			}
			result += probSubset * partialResult;
		}
		if(Double.isNaN(result) || result == Double.NEGATIVE_INFINITY){
			System.out.println(result + " !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		}
		if(result < 0) System.out.println("CCE is Negative");
		return result;
	}
        
}