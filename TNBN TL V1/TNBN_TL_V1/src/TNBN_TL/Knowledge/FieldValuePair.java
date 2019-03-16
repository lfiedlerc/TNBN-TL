package TNBN_TL.Knowledge;

import TNBN_TL.Temporal;

public class FieldValuePair{
	private Field f;
	private Object value;
	
	// add code to make sure it belongs to the possible values ?
	public FieldValuePair(Field f, Object value){
		this.f = f;
		this.value = value;
	}
	
	public FieldValuePair(StringField f, String value){
		this.f = f;
		this.value = value;
	}
	
	public FieldValuePair(IntegerField f, Integer value){
		this.f = f;
		this.value = value;
	}
	
	public FieldValuePair(DoubleField f, Double value){
		this.f = f;
		this.value = value;
	}
	
	public FieldValuePair(BooleanField f, Boolean value){
		this.f = f;
		this.value = value;
	}
	
	public FieldValuePair(TemporalField f, Temporal value){
		this.f = f;
		this.value = value;
	}
	
	public Field getField(){
		return f;
	}
	
	public Object getValue(){
		return value;
	}
	
	public void setValue(Object value){
		this.value = value;
	}
	
	public String getFieldName(){
		return f.getFieldName();
	}
	
	@Override
	public boolean equals(Object o){
		FieldValuePair f = (FieldValuePair)o;
		if(f.getFieldName().equals(this.getFieldName()) && f.getValue().equals(this.getValue()))
			return true;
		return false;
	}
        
        @Override
        public String toString(){
            return f.getFieldName() + ": " + value.toString();
        }
}