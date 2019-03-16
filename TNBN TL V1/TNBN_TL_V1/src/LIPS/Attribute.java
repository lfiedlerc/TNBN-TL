/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import java.util.LinkedHashSet;

/**
 *
 * @author Pablo
 */
public class Attribute implements Cloneable{

    protected String name;
    protected LinkedHashSet<Double> values;
    protected LinkedHashSet<String> valuesStr;

    public Attribute()
    {
        name=null;
        values=null;
    }

    public Attribute(String nom){
        values= null;
        name=nom;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LinkedHashSet<Double> getValues() {
        return values;
    }
	
	public LinkedHashSet<String> getValuesStr() {
        return valuesStr;
    }

    public void setValues(LinkedHashSet<Double> values) {
        this.values = values;
    }

    public void setValuesStr(LinkedHashSet<String> values) {
        this.valuesStr = values;
    }
    public Double getValue(int i) {

         int index=0;
         for(Double val:values){
             if(index==i)
                 return val;
             index++;
         }
        return -1.0;
    }

   public String getValueStr(int i) {

         int index=0;
         for(String val:valuesStr){
             if(index==i)
                 return val;
             index++;
         }
        return null;
    }


    @Override
    protected Attribute clone() {
        Attribute nuevo= new Attribute(name);
        nuevo.setValues(values);
        return nuevo;
    }
    
    public String toString(){
        return "A:"+name+"{"+values+"}";

    }

}
