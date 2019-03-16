/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import java.util.ArrayList;
import java.util.Arrays;

/**
 *
 * @author Pablo
 */
public class NodeState {

    private ArrayList<Interval[]> intervalos;

    public NodeState() {
    }

    public NodeState(ArrayList<Interval[]> intervalos) {
        this.intervalos = intervalos;
    }

    public ArrayList<Interval[]> getIntervalos() {
        return intervalos;
    }

/*    public void setIntervalos(ArrayList<Interval[]> intervalos) {
        this.intervalos = intervalos;
    }
*/

     public void setIntervalos(ArrayList<IntervalSet> intervalos) {
         this.intervalos = new ArrayList<Interval[]>();
        for (IntervalSet set:intervalos){
            ArrayList<Interval> tmp= new ArrayList<Interval>();
            for(Interval inter:set.getIntervalSet()){
                tmp.add(inter);
            }
            Interval[] tmpArray=tmp.toArray(new Interval[0]);
            this.intervalos.add(tmpArray);
        }
    }
     
     public Interval[] getIntervalosAtK(int k){
         Interval [] intervals = new Interval[intervalos.get(k).length];
         for(int i = 0; i < intervalos.get(k).length; ++i){
             intervals[i] = new Interval(intervalos.get(k)[i].getStart(),intervalos.get(k)[i].getEnd());
         }
         return intervals;
     }

    /*public Interval[] getIntervalosAtK(int k){
        return intervalos.get(k);
    }*/

    public int numIntervals(){
        return intervalos.size();
    }

    @Override
    public String toString(){
        StringBuilder str= new StringBuilder();
        for(Interval[] inter:intervalos){
            str.append("\n"+Arrays.toString(inter));
        }
        return str.toString();
    }

}
