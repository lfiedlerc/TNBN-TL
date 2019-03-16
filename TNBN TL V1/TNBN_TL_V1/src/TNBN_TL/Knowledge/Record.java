package TNBN_TL.Knowledge;

import java.util.ArrayList;

public class Record{
	private ArrayList<FieldValuePair> tuple;
	
	public Record(){
		tuple = new ArrayList<FieldValuePair>();
	}
        
        public Record(FieldValuePair pair){
		tuple = new ArrayList<FieldValuePair>();
                tuple.add(pair);
	}
	
	public Record(int numberOfFields){
		tuple = new ArrayList<FieldValuePair>(numberOfFields);
	}
	
	public Record(ArrayList<FieldValuePair> tuple){
		this.tuple = new ArrayList<FieldValuePair>(tuple.size());
		
		for(int i = 0; i < tuple.size(); ++i)
			this.tuple.add(new FieldValuePair(tuple.get(i).getField(),tuple.get(i).getValue()));
	}
	
	public int getNumberOfFields(){
		return tuple.size();
	}
	
	public ArrayList<FieldValuePair> getTuple(){
		ArrayList<FieldValuePair> tp = new ArrayList<FieldValuePair>(tuple.size());
		for(int i = 0; i < tuple.size(); ++i)
			tp.add(new FieldValuePair(tuple.get(i).getField(),tuple.get(i).getValue()));

		return tp;
	}
	
	public void setTuple(ArrayList<FieldValuePair> tuple){
		this.tuple = new ArrayList<FieldValuePair>(tuple.size());
		
		for(int i = 0; i < tuple.size(); ++i)
			this.tuple.add(new FieldValuePair(tuple.get(i).getField(),tuple.get(i).getValue()));
	}
	
	public void addFieldValuePair(FieldValuePair pair){
		tuple.add(new FieldValuePair(pair.getField(), pair.getValue()));
	}
	
	public void addFieldValuePairAt(int index, FieldValuePair pair){
		tuple.add(index,new FieldValuePair(pair.getField(), pair.getValue()));
	}
	
	public void deleteFieldValuePairAt(int index){
		tuple.remove(index);
	}
        
        public FieldValuePair removeFieldValuePairAt(int index){
		return tuple.remove(index);
	}
	
	public void deleteFieldValuePair(String field){
		for(int i = 0; i < tuple.size(); ++i){
			if(tuple.get(i).getFieldName().equals(field)){
				tuple.remove(i);
				return;
			}
		}
	}
	
	public void setValueAt(int index, Object value){
		tuple.get(index).setValue(value);
	}
	
	public void setValueAt(String field, Object value){
		for(int i = 0; i < tuple.size(); ++i){
			if(tuple.get(i).getFieldName().equals(field)){
				tuple.get(i).setValue(value);
			}
		}
	}
	
	public String getNameOfFieldAt(int index){
		return tuple.get(index).getFieldName();
	}
	
	public String getTypeOfFieldAt(int index){
		return tuple.get(index).getField().getType();
	}
	
	public Field getFieldAt(int index){
		return tuple.get(index).getField();
	}
	
	public Object getValueOfFieldAt(int index){
		return tuple.get(index).getValue();
	}
	
	public Object getValueOfField(String field){
		for(int i = 0; i < tuple.size(); ++i){
			if(tuple.get(i).getFieldName().equals(field)){
				return tuple.get(i).getValue();
			}
		}
		
		return null;
	}
	
	public void printRecord(){
		for(int i = 0; i < tuple.size(); ++i){
                    if(tuple.get(i).getValue() != null){
			System.out.print(tuple.get(i).getValue().toString() + " ");
                    } else {
                        System.out.print("% ");
                    }
		}
		System.out.println();
	}
        
        public Record copy(){
            Record cpy = new Record(this.getNumberOfFields());
            
            for(int i = 0; i < this.getNumberOfFields(); ++i){
                cpy.addFieldValuePair(new FieldValuePair(new TemporalField(this.getFieldAt(i).getFieldName()),this.getValueOfFieldAt(i)));
            }
            return cpy;
        }
	
}