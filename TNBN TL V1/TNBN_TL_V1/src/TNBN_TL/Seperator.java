/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package TNBN_TL;

import java.util.ArrayList;

/**
 *
 * @author lfiedlerc
 */
public class Seperator {
    private int indexX;
    private int indexY;
    private ArrayList<Integer> seperators;
    
    public Seperator(int indexX, int indexY){
        this.indexX = indexX;
        this.indexY = indexY;
        seperators = new ArrayList<>();
    }
    
    public void addSeperator(int s){
        seperators.add(s);
    }
    
    public int getIndexX(){
        return indexX;
    }
    
    public int getIndexY(){
        return indexY;
    }
    
    public boolean isSeperator(int index){
        Integer i = new Integer(index);
        return seperators.contains(i);
    }
}
