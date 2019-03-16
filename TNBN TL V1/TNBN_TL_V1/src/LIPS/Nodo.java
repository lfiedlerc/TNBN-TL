/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

/**
 *
 * @author Pablo
 */
public class Nodo {

   IntervalSet intervalSet;
   String name;

    public Nodo(IntervalSet intervalSet, String name) {
        this.intervalSet = intervalSet;
        this.name = name;
    }

    public IntervalSet getIntervalSet() {
        return intervalSet;
    }

    public void setIntervalSet(IntervalSet intervalSet) {
        this.intervalSet = intervalSet;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }



}
