package TNBN_TL.Knowledge;

import TNBN_TL.Temporal;
import java.util.ArrayList;

public class TemporalField extends Field{
	private ArrayList<Temporal> values;
	
	public TemporalField(String name, ArrayList<Temporal> values){
		fieldName = name;
		this.values = new ArrayList<>(values.size());
		
		for(int i = 0; i < values.size(); ++i){
			this.values.add(values.get(i));
                }
	}
        
        public TemporalField(String name, String[] values){
		fieldName = name;
		this.values = new ArrayList<>(values.length);
		
		for(int i = 0; i < values.length; ++i){
                    if(i == values.length - 1){
                        this.values.add(new Temporal());
                    } else {
                        if(i == values.length - 2){
                            this.values.add(new Temporal(values[i],2));
                        } else {
                            this.values.add(new Temporal(values[i],1));
                        }
                    }	
                }
	}
	
	public TemporalField(String name){
		fieldName = name;
		this.values = new ArrayList<>();
	}

        @Override
	public String getType(){
		return "Temporal";
	}
	
        @Override
	public ArrayList getValues(){
		ArrayList<Temporal> vals = new ArrayList<>(values.size());
		for(int i = 0; i < values.size(); ++i){
			vals.add(values.get(i));
                }
		return vals;
	}
	
        @Override
	public void setValues(ArrayList values){
		ArrayList<Temporal> vals = new ArrayList<>();
		
		for(int i = 0; i < values.size(); ++i){
			vals.add((Temporal)values.get(i));
		}
		this.values = vals;
	}
        
        @Override
        public TemporalField copy(){
            return new TemporalField(this.getFieldName(),values);
        }
	
}