package TNBN_TL;

import TNBN_TL.Knowledge.FieldValuePair;
import java.util.ArrayList;

public class ProbabilityDistribution{
	private String variableName;
	private ValueProbability [] probabilityTable; 
	private ValueProbability [][] cpt; 
	
	public ProbabilityDistribution(String variableName){
		this.variableName = variableName;
	}
	
	public ProbabilityDistribution(String variableName, String [] values, double [] probabilities){
		if(values.length != probabilities.length){
		// throw exception
		}

		this.variableName = variableName;
		this.cpt = null;
		probabilityTable = new ValueProbability[values.length];
		
		for(int i = 0; i < values.length; ++i){
			probabilityTable[i] = new ValueProbability(values[i],probabilities[i]);
		}
	}
	
	public ProbabilityDistribution(String variableName, String [] values, ArrayList<FieldValuePair []> conditioned, double [][] cptProbabilities, double [] probabilities){
		if(cptProbabilities.length != values.length){
		// throw exception
		}
		if(cptProbabilities[0].length != conditioned.size()){
		// throw exception
		}
		if(probabilities.length != values.length){
		// throw exception
		}
		
		this.variableName = variableName;
		cpt = new ValueProbability[values.length][conditioned.size()];
		probabilityTable = new ValueProbability[values.length];
		
		for(int i = 0; i < values.length; ++i){
			probabilityTable[i] = new ValueProbability(values[i],probabilities[i]);
			for(int j = 0; j < conditioned.size(); ++j){
				cpt[i][j] = new ValueProbability(values[i],conditioned.get(j),cptProbabilities[i][j]);
			}
		}
	}
	
	public ProbabilityDistribution(String variableName, ValueProbability [] probabilityTable){
		this.variableName = variableName;
		this.probabilityTable = probabilityTable;
		this.cpt = null;
	}
	
	public ProbabilityDistribution(String variableName, ValueProbability [] probabilityTable, ValueProbability [][] cpt){
		this.variableName = variableName;
		this.probabilityTable = probabilityTable;
		this.cpt = cpt;
	}
	
	public String getVariableName(){
		return variableName;
	}
	
	public void setVariableName(String name){
		variableName = name;
	}
	
	public ValueProbability[] getProbabilityTable(){
		return probabilityTable;
	}
	
	public ValueProbability[][] getCPT(){
		return cpt;
	}
	
	public void setProbabilityTable(ValueProbability[] probabilityTable){
		this.probabilityTable = probabilityTable;
	}
	
	public void setCPT(ValueProbability[][] cpt){
		this.cpt = cpt;
	}
	
	public double probabilityOf(String value){
		return Probability.probabilityOf(value,probabilityTable);
	}
	
	public ValueProbability[] getCPTRow(String value){
		for(int i = 0; i < cpt.length; ++i){
			if(cpt[i][0].getValue().equals(value))
				return cpt[i];
		}
		return null;
	}
	
	public ValueProbability[] getCPTCol(FieldValuePair [] conditioned){
		ValueProbability [] col = new ValueProbability[cpt.length];
		FieldValuePair [] f;
		boolean isEqual, cont;
		int i, k;
		
		for(int j = 0; j < cpt[0].length; ++j){
			f = cpt[0][j].getConditioningSet();
			
			if(f.length != conditioned.length){
				//throw exception
			}
			
			i = 0;
			isEqual = true;
			while(isEqual && i < conditioned.length){
				k = 0;
				cont = true;
				while(cont && k < f.length){
					if(f[k].equals(conditioned[i]))
						cont = false;
					k++;
				}
				if(cont)
					isEqual = false;
				i++;
			}
			
			if(isEqual){
				for(int m = 0; m < cpt.length; ++m)
					col[m] = cpt[m][j];
				return col;
			}
		}
		return null;
	}
	
	public double probabilityOf(String value, FieldValuePair [] conditioned){
		return Probability.probabilityOf(value,conditioned,cpt);
	}
	
	public double probabilityOf(int index){
		return probabilityTable[index].getProbability();
	}
	
	public double totalProbability(){
		double total = 0.0;
		
		for(int i = 0; i < probabilityTable.length; ++i)
			total += probabilityTable[i].getProbability();
		
		return total;
	}
	
	public void printProbTable(){
		for(int i = 0; i < probabilityTable.length; ++i)
			System.out.println("P(" + variableName + " = " + probabilityTable[i].getValue() + ") = " + probabilityTable[i].getProbability());
	}
	
	public void printCPT(){
            if(cpt != null)
		Probability.printCPT(variableName, cpt);
	}
}