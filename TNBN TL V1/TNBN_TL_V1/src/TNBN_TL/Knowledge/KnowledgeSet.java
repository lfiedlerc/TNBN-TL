package TNBN_TL.Knowledge;

import java.io.*;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class KnowledgeSet{
	private ArrayList<Field> fields;
	private ArrayList<Record> records;
        
	public KnowledgeSet(ArrayList<Field> fields){
		this.fields = fields;
		records = new ArrayList<>();
	}
        
        public KnowledgeSet(ArrayList<Field> fields, ArrayList<Record> records){
		this.fields = fields;
		this.records = records;
	}
	
	public ArrayList<Field> getFields(){
		return fields;
	}
        
        public ArrayList<Field> getFieldsCopy(){
            ArrayList<Field> cpy = new ArrayList<>();
            
            for(int i = 0; i < fields.size(); ++i){
                cpy.add(fields.get(i).copy());
            }
            return cpy;
	}
	
	public String [] getFieldNames(){
		int numFields = fields.size();
		String [] fieldNames = new String[numFields];
		
		for(int i = 0; i < numFields; ++i){
			fieldNames[i] = fields.get(i).getFieldName();
		}
		
		return fieldNames;
	}
	
	public Field getFieldAt(int index){
		return fields.get(index);
	}
	
	public void setFieldAt(int index, Field f){
		fields.set(index,f);
	}
        
        public double getMaxValueOfNumericField(String field){
            double max = Double.MIN_VALUE;
            ArrayList data = this.getColumn(field);
            String value;
            double numeric;
            
            for(int i = 0; i < data.size(); ++i){
                value = data.get(i).toString().trim();
                if(!value.equals("Default")){
                    numeric = Double.parseDouble(value);
                    if(numeric > max){
                        max = numeric;
                    }
                }
            }
            return max;
        }
        
        public double getMinValueOfNumericField(String field){
            double min = Double.MIN_VALUE;
            ArrayList data = this.getColumn(field);
            String value;
            double numeric;
            
            for(int i = 0; i < data.size(); ++i){
                value = data.get(i).toString().trim();
                if(!value.equals("Default")){
                    numeric = Double.parseDouble(value);
                    if(numeric < min){
                        min = numeric;
                    }
                }
            }
            return min;
        }
	
	public ArrayList getFieldValues(int index){
		return fields.get(index).getValues();
	}
	
	public void setFieldValues(int index, ArrayList values){
		fields.get(index).setValues(values);
	}
	
	public ArrayList getFieldValues(String field){
		for(int i = 0; i < fields.size(); ++i){
			if(fields.get(i).getFieldName().equals(field))
				return fields.get(i).getValues();
		}
		return null;
	}
	
	public ArrayList<Record> getRecords(){
		return records;
	}
	
	public ArrayList<Record> getRecords(Record r){
		// size of r and numfields is different throw exception
		ArrayList<Record> result = new ArrayList<Record>();
		Object value;
		int i;
		boolean add;
		
		for(Record t : records){
			add = true;
			i = 0;
			while(i < r.getNumberOfFields() && add){
				value = r.getValueOfFieldAt(i);
				if(value != null){
					if(!value.toString().equals(t.getValueOfFieldAt(i).toString())){
						add = false;
					}
				}
				++i;
			}
			if(add){
				result.add(t);
			}
		}
		
		return result;
	}
        
        public boolean[] getRecordsIndexes(Record r){
		// size of r and numfields is different throw exception
		boolean [] result = new boolean[this.size()];
		Object value;
		int i;
		boolean add;
		
		for(int t = 0; t < this.size(); t++){
			add = true;
			i = 0;
			while(i < r.getNumberOfFields() && add){
				value = r.getValueOfFieldAt(i);
				if(value != null){
					if(!value.toString().equals(records.get(t).getValueOfFieldAt(i).toString())){
						add = false;
					}
				}
				++i;
			}
			if(add){
				result[t] = true;
			}
		}
		
		return result;
	}
        
        public void filter(int index, String value){
            ArrayList<Record> filtered = new ArrayList<>();
            for(Record r : records){
		if(!r.getValueOfFieldAt(index).toString().equals(value)){
                    filtered.add(r);
                }	
            }
            records = filtered;
        }
	
	public int size(){
		return records.size();
	}
	
	public int numberOfFields(){
		return fields.size();
	}
	
	public void loadKnowledge(String filename){
		int numFields = fields.size();
                records.clear();
		Record r;
		StringTokenizer tok;
		String record;
		Field f;
		
		try{
		
			BufferedReader in = new BufferedReader(new FileReader(filename));
		
			while((record = in.readLine()) != null){
				tok = new StringTokenizer(record);
			
				if(tok.countTokens() != numFields){
                                    System.out.println("Not enough tokens!");
                                    System.out.println(numFields);
                                    System.out.println(record);
					//throw exception
				}
			
				r = new Record(numFields);
			
				for(int i = 0; i < numFields; ++i){
					f = fields.get(i);
					if(f.getType().equals("String"))
						r.addFieldValuePair(new FieldValuePair((StringField)f, tok.nextToken()));
					else if(f.getType().equals("Double"))
						r.addFieldValuePair(new FieldValuePair((DoubleField)f, Double.parseDouble(tok.nextToken())));
					else if(f.getType().equals("Integer"))
						r.addFieldValuePair(new FieldValuePair((IntegerField)f, Integer.parseInt(tok.nextToken())));
					else if(f.getType().equals("Boolean"))
						r.addFieldValuePair(new FieldValuePair((BooleanField)f, Boolean.parseBoolean(tok.nextToken())));
					else if(f.getType().equals("Temporal"))
						r.addFieldValuePair(new FieldValuePair((TemporalField)f, tok.nextToken()));
				}
			
				records.add(r);
			}
			
			in.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void loadKnowledge(String filename, String delimiter){
		int numFields = fields.size();
                records.clear();
		Record r;
		StringTokenizer tok;
		String record;
		Field f;
		
		try{
		
			BufferedReader in = new BufferedReader(new FileReader(filename));
		
			while((record = in.readLine()) != null){
				tok = new StringTokenizer(record, delimiter);
			
				if(tok.countTokens() != numFields){
					//throw exception
				}
			
				r = new Record(numFields);
			
				for(int i = 0; i < numFields; ++i){
					f = fields.get(i);
					if(f.getType().equals("String"))
						r.addFieldValuePair(new FieldValuePair((StringField)f, tok.nextToken()));
					else if(f.getType().equals("Double"))
						r.addFieldValuePair(new FieldValuePair((DoubleField)f, Double.parseDouble(tok.nextToken())));
					else if(f.getType().equals("Integer"))
						r.addFieldValuePair(new FieldValuePair((IntegerField)f, Integer.parseInt(tok.nextToken())));
					else if(f.getType().equals("Boolean"))
						r.addFieldValuePair(new FieldValuePair((BooleanField)f, Boolean.parseBoolean(tok.nextToken())));
					else if(f.getType().equals("Temporal"))
						r.addFieldValuePair(new FieldValuePair((TemporalField)f, tok.nextToken()));
				}
			
				records.add(r);
			}
			
			in.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
        
        public void mergeKnowledgeSets(KnowledgeSet k2){
            ArrayList<Record> k2Records = k2.getRecords();
            
            for(Record r : k2Records){
                this.addRecord(r);
            }
        }
       
	public void addRecord(Record r){
		int size = r.getNumberOfFields();
		Field f;
		
		if(size != fields.size()){
			//throw exception
		}
		
		for(int i = 0; i < size; ++i){
			f = fields.get(i);
			if(!r.getTypeOfFieldAt(i).equals(f.getType())){
				//throw exception
			}
		}
		
		records.add(r);
	}
        
        public void addRecords(ArrayList<Record> recs){
            for(Record r : recs){
                records.add(r);
            }
        }
	
	public void writeToFile(String output){
		int numFields = fields.size();
		Record r;
		
		try{
			BufferedWriter out = new BufferedWriter(new FileWriter(output));
			
			for(int i = 0; i < records.size(); ++i){
				r = records.get(i);
				
				for(int j = 0; j < numFields; ++j){
					out.write(r.getValueOfFieldAt(j).toString());
					if(j < numFields - 1)
						out.write(" ");
				}
				out.newLine();
			}
			
			out.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
        
        public void writeColumnToFile(String output, int column){
		Record r;
		
		try{
			BufferedWriter out = new BufferedWriter(new FileWriter(output));
			
			for(int i = 0; i < records.size(); ++i){
				r = records.get(i);
				out.write(r.getValueOfFieldAt(column).toString());	
				out.newLine();
			}
			
			out.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
        
        public void writeColumnToFile(String output, int column, String filter){
		Record r;
		String f;
		try{
			BufferedWriter out = new BufferedWriter(new FileWriter(output));
			
			for(int i = 0; i < records.size(); ++i){
				r = records.get(i);
                                f = r.getValueOfFieldAt(column).toString();
                                if(!f.equals(filter)){
                                    out.write(f);	
                                    out.newLine();
                                }
			}
			
			out.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
        
        public void writeToArff(String output, String filter, String replace){
		int numFields = fields.size();
		Record r;
                ArrayList values;
                String value;
		
		try{
			BufferedWriter out = new BufferedWriter(new FileWriter(output));
                        
			out.write("@relation '" + output + "'");
                        out.newLine();
                        
                        for(int i = 0; i < numFields; ++i){
                            out.write("@attribute '" + fields.get(i).getFieldName() + "' ");
                            values = fields.get(i).getValues();
                            if(values.size() > 0){
                                out.write("{");
                                for(int j = 0; j < values.size(); ++j){
                                    out.write("'" + values.get(j).toString() + "'");
                                    if(j < values.size() - 1){
                                        out.write(",");
                                    }
                                }
                                out.write("}");
                            } else {
                                out.write("NUMERIC");
                            }
                            out.newLine();
                        }
                        
                        out.newLine();
                        out.write("@data");
                        out.newLine();
			for(int i = 0; i < records.size(); ++i){
				r = records.get(i);
				for(int j = 0; j < numFields; ++j){
                                    value = r.getValueOfFieldAt(j).toString();
                                    if(value.equals(filter)){
                                        out.write(replace);
                                    } else {
                                        out.write(value);
                                    }
                                    if(j < numFields - 1){
					out.write(",");
                                    }
				}
				out.newLine();
			}
			
			out.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public void deleteRecordAt(int index){
		records.remove(index);
	}
	
	public Record getRecordAt(int index){
		return records.get(index);
	}
	
	public void printRecordAt(int index){
		Record r = records.get(index);
		r.printRecord();
	}
	
	public int getIndexOfField(String field){
		for(int i = 0; i < fields.size(); ++i){
			if(fields.get(i).getFieldName().equals(field))
				return i;
		}
		return -1;
	}
	
	public ArrayList<Object> getColumn(int index){
		ArrayList<Object> column = new ArrayList<Object>(records.size());
		
		for(Record r : records){
			column.add(r.getValueOfFieldAt(index));
		}
		
		return column;
	}
	
	public ArrayList<Object> getColumn(String field){
		ArrayList<Object> column = new ArrayList<Object>(records.size());
		
		for(Record r : records){
			column.add(r.getValueOfField(field));
		}
		
		return column;
	}
        
        public ArrayList<Record> getRecordsAtColumn(String field){
		ArrayList<Record> column = new ArrayList<>(records.size());
                int index = this.getIndexOfField(field);
		
		for(Record r : records){
			column.add(new Record(new FieldValuePair(r.getFieldAt(index),r.getValueOfFieldAt(index))));
		}
		
		return column;
	}
	
	public Object getValueOfField(int numRecord, int numField){
		Record r = records.get(numRecord);
		return r.getValueOfFieldAt(numField);
	}
	
	public void setValueOfField(int numRecord, int numField, Object value){
		Record r = records.get(numRecord);
		r.setValueAt(numField,value);
	}
        
        public KnowledgeSet copy(){
            KnowledgeSet cpy = new KnowledgeSet(this.getFieldsCopy());
            
            for(Record r : records){
                cpy.addRecord(r.copy());
            }
            return cpy;
        }
        
        public void orderRecords(ArrayList<Field> fieldOrder){
            int index;
            Field f;
            FieldValuePair fv;
            
            for(int i = 0; i < fieldOrder.size(); ++i){
                index = this.getIndexOfField(fieldOrder.get(i).getFieldName());
                if(i != index){
                    f = fields.remove(index);
                    fields.add(i,f);
                    for(Record r : records){
                        fv = r.removeFieldValuePairAt(index);
                        r.addFieldValuePairAt(i, fv);
                    }
                }
            }
        }

}