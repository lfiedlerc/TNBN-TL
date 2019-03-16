package TNBN_TL;

import TNBN_TL.Knowledge.*;
import java.util.ArrayList;

public class MutualInformation{
	
	public static boolean isIndependent(KnowledgeSet k, String nodeX, String nodeY, double threshold){
		if(mi(k,nodeX,nodeY) < threshold)
			return true;
		else
		   return false;
	}
	
	public static double mi(KnowledgeSet k, String nodeX, String nodeY){
		double result = 0;
		double partialResult;
		double logArg;
		int totalRecords = k.size();
		int yRecords;
		int x = k.getIndexOfField(nodeX);
		int y = k.getIndexOfField(nodeY);
		ArrayList valuesX = k.getFieldValues(x);
		ArrayList valuesY = k.getFieldValues(y);
		int numberOfFields = k.numberOfFields();
		Record r1 = new Record(numberOfFields);
		Record r2 = new Record(numberOfFields);
		Record r3 = new Record(numberOfFields);
		double probXY, probX, probY; 
		int numerator, denominator;
		int numValsX, numValsY;
		
                for(int i = 0; i < numberOfFields; ++i){
			r1.addFieldValuePair(new FieldValuePair(k.getFieldAt(i),null));
			r2.addFieldValuePair(new FieldValuePair(k.getFieldAt(i),null));
			r3.addFieldValuePair(new FieldValuePair(k.getFieldAt(i),null));
		}
		
		numValsY = valuesY.size();
		numValsX = valuesX.size();
		for(int i = 0; i < numValsY; ++i){
			partialResult = 0;
			
			r1.setValueAt(y,valuesY.get(i));
			r3.setValueAt(y,valuesY.get(i));
			
			yRecords = k.getRecords(r1).size();
			numerator = yRecords + 1;
			denominator = totalRecords + numValsY;
			probY = (double)numerator/(double)denominator; /* smoothed probability of nodeY */
			for(int j = 0; j< numValsX; ++j){
				r2.setValueAt(x,valuesX.get(j));
				r3.setValueAt(x,valuesX.get(j));
				
				numerator = k.getRecords(r2).size() + 1;
				denominator = totalRecords + numValsX;
				probX = (double)numerator/(double)denominator; /* smoothed probability of nodeX */
				numerator = k.getRecords(r3).size() + 1;
				denominator = numValsX*numValsY + totalRecords;
				probXY = (double)numerator/(double)denominator; /* probability of nodeX and nodeY */
				logArg = probXY / (probX*probY);
				partialResult += probXY * (Math.log(logArg));///Math.log(2.0));
			}
			result += partialResult;
		}
		if(result < 0) System.out.println("MI is Negative");
		return result;
	}
	
}