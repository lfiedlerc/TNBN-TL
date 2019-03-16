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
public class DataSet {


    public ArrayList<Attribute> attributes, fullattributes;
    public ArrayList<Instance> instances;
    public Class theClass;


    public DataSet(){
        instances = new ArrayList<Instance>();
    }


    public DataSet( ArrayList<Instance> instances,ArrayList<Attribute> attributes) {
        this.attributes = attributes;
        fullattributes=attributes;
        this.instances = instances;
        theClass=null;
    }

    public DataSet( ArrayList<Instance> instances,ArrayList<Attribute> attributes,ArrayList<Attribute> full, Class c) {
        this.attributes = attributes;
        fullattributes=full;
        this.instances = instances;
        theClass=c;
    }

    public ArrayList<Attribute> getAttributes() {
        return attributes;
    }


    public Attribute getAttribute(int i) {

        int conta=0;
        for (Attribute a:attributes){
            if(conta==i)
                return a;
            conta++;
        }
        return null;
    }

    public void setAttributes(ArrayList<Attribute> attributes) {
        this.attributes = attributes;
    }

    public ArrayList<Instance> getInstances() {
        return instances;
    }

    public void setInstances(ArrayList<Instance> instances) {
        this.instances = instances;
    }

    public Class getTheClass() {
        return theClass;
    }

    public void setTheClass(Class theClass) {
        this.theClass = theClass;
    }

    private int getIndexAttribute(String value){
        for (int i=0;i<fullattributes.size();i++){
            if(fullattributes.get(i).getName().compareTo(value)==0)
                return i;
        }
        return -1;
    }


    public void addInstance(Instance ins){
        instances.add(ins);
    }

}
