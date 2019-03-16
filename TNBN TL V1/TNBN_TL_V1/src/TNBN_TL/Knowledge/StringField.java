package TNBN_TL.Knowledge;

import java.util.ArrayList;

public class StringField extends Field{
	private ArrayList<String> values;
	
	public StringField(String name, ArrayList<String> values){
		fieldName = name;
		this.values = new ArrayList<>(values.size());
		
		for(int i = 0; i < values.size(); ++i){
			this.values.add(values.get(i));
                }
	}
        
        @Override
	public String getType(){
		return "String";
	}
	
        @Override
	public ArrayList getValues(){
		ArrayList<String> vals = new ArrayList<>(values.size());
		for(int i = 0; i < values.size(); ++i){
			vals.add(values.get(i));
                }
		return vals;
	}
	
        @Override
	public void setValues(ArrayList values){
		ArrayList<String> vals = new ArrayList<>();
		
		for(int i = 0; i < values.size(); ++i){
			vals.add((String)values.get(i));
		}
		this.values = vals;
	}
        
        @Override
        public StringField copy(){
            return new StringField(this.getFieldName(),values);
        }
	
}