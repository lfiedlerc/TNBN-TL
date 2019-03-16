package TNBN_TL.Knowledge;

import java.util.ArrayList;

public class DoubleField extends Field{
	private ArrayList<Double> values;
	
	public DoubleField(String name, ArrayList<Double> values){
		fieldName = name;
		this.values = new ArrayList<Double>(values.size());
		
		for(int i = 0; i < values.size(); ++i)
			this.values.add(values.get(i));
	}
	
	public DoubleField(String name){
		fieldName = name;
		this.values = new ArrayList<Double>(0);
	}
	
	public String getType(){
		return "Double";
	}
	
	public ArrayList getValues(){
		ArrayList<Double> vals = new ArrayList<Double>(values.size());
		for(int i = 0; i < values.size(); ++i)
			vals.add(values.get(i));
		return vals;
	}
	
	public void setValues(ArrayList values){
		ArrayList<Double> vals = new ArrayList<Double>();
		
		for(int i = 0; i < values.size(); ++i){
			vals.add((Double)values.get(i));
		}
		this.values = vals;
	}
        
        @Override
        public DoubleField copy(){
            return new DoubleField(this.getFieldName(),values);
        }
}