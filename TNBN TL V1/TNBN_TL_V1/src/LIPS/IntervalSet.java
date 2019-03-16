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

public class IntervalSet {
    ArrayList<Interval> intervalSet;

   public IntervalSet() {
        intervalSet= new ArrayList<Interval>();
    }

    public IntervalSet(ArrayList<Interval> intervalSet) {
        this.intervalSet = intervalSet;
    }

    public IntervalSet(Interval[] intervalos){
        intervalSet = new ArrayList<Interval>();
        for(int i=0;i<intervalos.length;i++)
            intervalSet.add(intervalos[i]);
    }


    public IntervalSet(String[] intervalos){
        intervalSet = new ArrayList<Interval>();
        for(int i=0;i<intervalos.length;i++){
            if (intervalos[i].compareTo("\"Default\"")!=0){
                String[] partes=intervalos[i].split("-");
                int ini= (int)Double.parseDouble(partes[0].substring(2));
                int fin= (int)Double.parseDouble(partes[1].substring(0,partes[1].length()-2));
                Interval tmp = new Interval(ini,fin);
                intervalSet.add(tmp);
            }
        }
    }


    public IntervalSet(Interval i){
        intervalSet = new ArrayList<Interval>();
        intervalSet.add(i);
    }

     public IntervalSet(IntervalSet i){
         intervalSet = new ArrayList<Interval>();
        for(Interval inter:i.getIntervalSet()){
            intervalSet.add(inter);
        }
    }

    public ArrayList<Interval> getIntervalSet() {
        return intervalSet;
    }

    public void setIntervalSet(ArrayList<Interval> intervalSet) {
        this.intervalSet = intervalSet;
    }

    public void add(Interval inter){
        intervalSet.add(inter);
    }

    public Interval getIntervalAtIndex(int i){
        return intervalSet.get(i);
    }

    public int size(){
        return intervalSet.size();
    }


    public ArrayList<String> intervalsToString(){

        ArrayList<String> out= new ArrayList<String>();
        for(Interval inter:intervalSet){
                out.add(inter.toString());
        }
        return out;
    }
	
	public ArrayList<String> intervalsToStringForm(){

        ArrayList<String> out= new ArrayList<String>();
        for(Interval inter:intervalSet){
                out.add(inter.stringForm());
        }
        return out;
    }

    public ArrayList<String> intervalsToStringWithDefault(){

        ArrayList<String> out= new ArrayList<String>();
        for(Interval inter:intervalSet){
                out.add(inter.toString());
        }
        out.add("Default");
        return out;
    }




    public String toString(){

        StringBuilder out= new StringBuilder();
        for(Interval inter:intervalSet){
                out.append(inter.toString());
        }
        return out.toString();
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final IntervalSet other = (IntervalSet) obj;
        if (this.intervalSet != other.intervalSet && (this.intervalSet == null || !this.intervalSet.equals(other.intervalSet))) {
            return false;
        }
        
        if (intervalSet.size()!=other.size())
            return false;

        for(int i=0;i<intervalSet.size();i++){
            if(intervalSet.get(i).equals(other.getIntervalAtIndex(i))==false){
                return false;
            }
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        return hash;
    }



    public int getIndexOfValue(double v){
        int conta=0;
        for(Interval inter:intervalSet){
            if (v>=inter.getStart()&& v<inter.getEnd())
                return conta;
            conta++;
        }
        return intervalSet.size();
    }

 

}
