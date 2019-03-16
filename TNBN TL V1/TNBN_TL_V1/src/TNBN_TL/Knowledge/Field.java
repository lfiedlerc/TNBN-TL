package TNBN_TL.Knowledge;

import java.util.ArrayList;
import java.util.Objects;

public abstract class Field{
	public String fieldName;
        
	public String getFieldName(){
		return fieldName;
	}
	
	public void setFieldName(String name){
		fieldName = name;
	}
        
        public static int indexOfField(ArrayList<Field> fields, String name){
            int i = 0;
            for(Field f : fields){
                if(f.getFieldName().equals(name)){
                    return i;
                }
                i++;
            }
            return -1;
        }

	public abstract String getType();
	public abstract ArrayList getValues();
	public abstract void setValues(ArrayList values);
        public abstract Field copy();
}