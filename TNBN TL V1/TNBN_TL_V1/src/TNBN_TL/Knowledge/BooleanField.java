package TNBN_TL.Knowledge;

import java.util.ArrayList;

public class BooleanField extends Field{
	private ArrayList<Boolean> values;
	
	public BooleanField(String name, ArrayList<Boolean> values){
		fieldName = name;
		this.values = new ArrayList<>(values.size());
		
		for(int i = 0; i < values.size(); ++i){
			this.values.add(values.get(i));
                }
	}

        @Override
	public String getType(){
		return "Boolean";
	}
	
        @Override
	public ArrayList getValues(){
		ArrayList<Boolean> vals = new ArrayList<>(values.size());
		for(int i = 0; i < values.size(); ++i) {
                    vals.add(values.get(i));
                }
		return vals;
	}
	
        @Override
	public void setValues(ArrayList values){
		ArrayList<Boolean> vals = new ArrayList<>();
		
		for(int i = 0; i < values.size(); ++i){
			vals.add((Boolean)values.get(i));
		}
		this.values = vals;
	}
        
        @Override
        public BooleanField copy(){
            return new BooleanField(this.getFieldName(),values);
        }
	
}