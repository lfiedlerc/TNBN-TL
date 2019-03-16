package TNBN_TL.Knowledge;

import java.util.ArrayList;

public class IntegerField extends Field{
	private ArrayList<Integer> values;
	
	public IntegerField(String name, ArrayList<Integer> values){
		fieldName = name;
		this.values = new ArrayList<>(values.size());
		
		for(int i = 0; i < values.size(); ++i){
                    this.values.add(values.get(i));
                }
	}
	
	public IntegerField(String name){
		fieldName = name;
		this.values = new ArrayList<>(0);
	}
	
        @Override
	public String getType(){
		return "Integer";
	}
	
        @Override
	public ArrayList getValues(){
		ArrayList<Integer> vals = new ArrayList<>(values.size());
		for(int i = 0; i < values.size(); ++i) {
                    vals.add(values.get(i));
                }
		return vals;
	}
	
        @Override
	public void setValues(ArrayList values){
		ArrayList<Integer> vals = new ArrayList<>();
		
		for(int i = 0; i < values.size(); ++i){
			vals.add((Integer)values.get(i));
		}
		this.values = vals;
	}
        
        @Override
        public IntegerField copy(){
            return new IntegerField(this.getFieldName(),values);
        }
}