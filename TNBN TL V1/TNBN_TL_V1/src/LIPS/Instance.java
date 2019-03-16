/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import java.util.ArrayList;

/**
 *
 * @author Pablo
 */
public class Instance {

    private ArrayList<Double> attributes;
    private ArrayList<String> attributesStr;
    private ArrayList<AttributeValue> atv;
    private ArrayList<Double> weight = new ArrayList<Double>();;

    private int theClass;

    public int getNumWeights(){
        return weight.size();
    }

    public Instance(ArrayList<Double> att, int clas){
        attributes=att;
        theClass=clas;
    }

    public Instance(ArrayList<Double> att, int clas, ArrayList<AttributeValue> ats){
       attributes=att;
        theClass=clas;
        atv=ats;
    }

    public Instance(ArrayList<String> att, int clas, ArrayList<AttributeValue> ats, boolean nada){
       attributesStr=att;
        theClass=clas;
        atv=ats;
    }

    public Instance(ArrayList<String> attStr,ArrayList<Double> att, int clas, ArrayList<AttributeValue> ats){
       attributesStr=attStr;
       attributes=att;
        theClass=clas;
        atv=ats;
    }

    public ArrayList<AttributeValue> getAtv() {
        return atv;
    }

    public void setAtv(ArrayList<AttributeValue> atv) {
        this.atv = atv;
    }

    
    public ArrayList<Double> getAttributes() {
        return attributes;
    }

    public ArrayList<String> getAttributesStr() {
        return attributesStr;
    }

    public void setAttributes(ArrayList<Double> attributes) {
        this.attributes = attributes;
    }

    public int getTheclass() {
        return theClass;
    }


    public void setTheclass(int theclass) {
        this.theClass = theclass;
    }

    public String getAttributeStr(int i){
        return attributesStr.get(i);
    }

    public Double getAttribute(int i){
        return attributes.get(i);
    }

    public double getWeight(int index) {
        return weight.get(index);
    }

    public void setWeight(int index,double w) {
        weight.set(index, w);
    }

    public void setNWeights(int size) {
        for(int i=0;i<size;i++)
             weight.add(0.0);

    }

    @Override
    public String toString(){
        String att=attributesStr+" "+attributes+"";
        att=att.substring(1, att.length()-1);
                return att+", "+theClass;
    }

    public String toStringWeight(){
        String att=attributes+"";
        att=att.substring(1, att.length()-1);
        StringBuilder cadena= new StringBuilder();
        for(int i=0;i<this.getNumWeights();i++)
            cadena.append(","+weight.get(i));
        return att+cadena;
    }

}
