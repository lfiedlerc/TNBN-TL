package TNBN_TL;

import java.util.ArrayList;

public class Combinations{
	
	public static ArrayList<Object []> getSets(Object [] values, int start, int n, int k, int maxk){
		ArrayList<Object []> sets = new ArrayList<Object []>();
		int aux[] = new int[maxk];
		combinations(values,sets,aux,start,n,k,maxk);
		return sets;
	}
	
	private static void combinations (Object [] values, ArrayList<Object []> sets, int aux[], int start, int n, int k, int maxk) {
        int i;

        /* k here counts through positions in the maxk-element v.
         * if k > maxk, then the v is complete and we can use it.
         */
        if (k >= maxk) {
            /* insert code here to use combinations as you please */
			Object set [] = new Object[maxk];
			for (i=0; i<maxk; i++) {
				set[i]=values[aux[i]];
			}
				
            sets.add(set);
            return;
        }

        /* for this k'th element of the v, try all start..n
         * elements in that position
         */
        for (i=start; i<n; i++) {
			aux[k] = i;
			/* recursively generate combinations of integers
		     * from i+1..n
			 */
			combinations (values, sets, aux, i+1, n, k+1, maxk);
        }
	}
}