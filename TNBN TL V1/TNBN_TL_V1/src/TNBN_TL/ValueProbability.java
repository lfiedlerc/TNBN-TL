package TNBN_TL;

import TNBN_TL.Knowledge.FieldValuePair;

public class ValueProbability{
	private String value;
	private FieldValuePair [] conditioned;
	private double probability;

	public ValueProbability(String value, double probability){
		this.value = value;
		
		if(probability < 0)
			this.probability = 0;
		else
			this.probability = probability;
			
		this.conditioned = new FieldValuePair[0];
	}
	
	public ValueProbability(String value, FieldValuePair [] conditioned, double probability){
		this.value = value;
		this.conditioned = conditioned;
		
		if(probability < 0){
			this.probability = 0;
                        System.out.println("Trying to assign negative probability !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! " + probability);
                }else
			this.probability = probability;
	}
	
	public String getValue(){
		return value;
	}
	
	public FieldValuePair [] getConditioningSet(){
		return conditioned;
	}
	
	public double getProbability(){
		return probability;
	}
	
	public void setValue(String value){
		this.value = value;
	}
	
	public void setConditioningSet(FieldValuePair [] conditioned){
		this.conditioned = conditioned;
	}
	
	public void setProbability(double probability){
		this.probability = probability;
	}
}