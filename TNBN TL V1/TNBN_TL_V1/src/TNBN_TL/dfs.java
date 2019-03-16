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
public class dfs {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        boolean [][] graph = { {false,true,true,false,false},
										{false,false,false,true,false},
										{false,false,false,false,false},
										{false,false,false,false,true},
										{true,false,false,false,false}
										};
        ArrayList<Integer> cycle = Graph.getCycle(0, graph);
        
        for(int i = 0; i < cycle.size(); ++i)
            System.out.println(cycle.get(i));
    }
}
