/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

/**
 *
 * @author pablohl
 */
public class GaussianDistribution {


    public static double evaluate(double x, double mean, double sd){

        double variance=sd*sd;
        double exp=Math.exp((-1)*(Math.pow(x-mean,2)/(2 * variance ))  );
        return 1/(Math.sqrt(2*Math.PI* (variance))) * exp;

    }


}
