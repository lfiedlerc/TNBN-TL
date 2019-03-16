/*
 * Created on 15-oct-2004
 *
 * Class to handle vectors. This tasks are very commonly used
 * and this class avoids repetitions
 */
package elvira.tools;

import java.util.*;
/**
 * @author mgomez
 *
 * Class to handle vectors
 */
public class VectorManipulator {
 
 /**
  * Method to check if all the values in the vector are
  * ceros
  * @param Vector of objects from class Double
  * @return results of the test
  */
  
  public static boolean checkAllCerosDoubles(Vector doubles) {
    double value;
    int i;
    
    // Loop over the values
    for(i=0; i < doubles.size(); i++) {
      value=((Double)doubles.elementAt(i)).doubleValue();
      
      // Check if cero
      if (value != 0.0) {
        return false;
      }
    }
    
    // Anyother way, return true
    return true;
  }

 /**
  * Method to get the the index of the Double object with maximum
  * value in the vector 
  * @param Vector of objects from class Double
  * @return index of the maximum value
  */
   
  public static int findMaxDoubles(Vector doubles) {
    int i;
    int indMax=0;
    double value;
    double max=Double.NEGATIVE_INFINITY;

    // Consider the values stored in the vector 
    for(i=0; i < doubles.size(); i++){
      value=((Double)doubles.elementAt(i)).doubleValue();
       
      // If the value in i-th position is bigger than max,
      // update max and indMax
      if (value > max){
        max=value;
        indMax=i;
      }
    }

    // Return indMax   
    return indMax;    
   }
  
   
 /**
  * Method to determine the set of repeated indixes of a given vector
  * @param values vector with values
  * @param indMax index related to maximum value
  * @param threshold to compute the matches: differences of value
  *        under a given threshold will not be considered as difference
  * @return vector of indices to return the repetitions
  */

  public static Vector isRepeatedMaxDoubles(Vector values, int indMax, double threshold){
    Vector repetitions=null;
    int i,j;
    double value1,value2;
    int flag=0;

    // Get the value related with max index
    value1=((Double)values.elementAt(indMax)).doubleValue();

    // Look this value in the whole vector, anyway
    for(i=0; i < values.size(); i++){
      
      // Do not consider max
      if (i != indMax){
        value2=((Double)values.elementAt(i)).doubleValue();

        // Compare both values
        if (Math.abs(value1-value2) <= threshold){
          
          // Get space for repetitions vector
          if (repetitions == null)
            repetitions=new Vector();
          
          // Insert max
          if(flag == 0){
            repetitions.addElement(new Integer(indMax));
            flag=1;
          }

          // Insert the repeated value
          
          repetitions.addElement(new Integer(i));
        }
      }
    }

    // Return repetitions
    return repetitions;
  }
  
 /**
  * Method to determine if a value is near to the values stored
  * in a vector (the difference between them must be less than a
  * given threshold)
  * @param value to test
  * @param vector of values to compare
  * @param threshold
  * @return results of the comparison
  */
  public static boolean isNearThanThresholdDoubles(double value, Vector vector,
  		                                           double threshold){
  	for(int i=0; i < vector.size(); i++){
  		double valueToCompare=((Double)vector.elementAt(i)).doubleValue();
  		double diff=Math.abs(value-valueToCompare);
  		if (diff <= threshold)
  			return true;
  	}
  	// It this point is reached, return false
  	return false;
  }
  
 /**
  * Method to determine the numer of ones in a vector of doubles
  * @param values Vector with double values
  * @return number of ones
  */
  public static int countOnesDoubles(Vector values){
  	int ones=0;
  	int i;
  	
  	for(i=0; i < values.size(); i++){
  		double value=((Double)values.elementAt(i)).doubleValue();
  		if (value == 1){
  			ones++;
  		}
  	}
  	
  	// Return the count
  	return ones;
  }
  
 /**
  * Method to determine the match between two vectors of policies
  * @param reference first vector with policies
  * @param toCompare second vector with policies
  * @return boolean
  */
  public static boolean lookForMatchDoubles(Vector reference, Vector toCompare){
  	boolean match=false;
  	int i,j;
  	
  	// Consider one by one the 1 values in reference. For every one check
  	// if the value in the same position, but in toCompare, is also 1. In
  	// this case set match to true and return
  	for(i=0; i < reference.size(); i++){
  	  // Get the value in i-position
  	  double refValue=((Double)reference.elementAt(i)).doubleValue();
  	  if (refValue == 1){
  	  	// Look for a match for it
  	  	double toCompValue=((Double)toCompare.elementAt(i)).doubleValue();
  	  	
  	  	// Compare both of them
  	  	if (toCompValue == 1){
  	  		match=true;
  	  		break;
  	  	}
  	  }
  	}
  	// return match
  	return match;
  }

 /**
  * Method to print the values of Double objects stored
  * in a vector
  * @param Vector of objects from class Double
  */
   
  public static void printDoubles(Vector doubles) {
    double value;
    int i;
     
    // Loop over the values
    for(i=0; i < doubles.size(); i++) {
      value=((Double)doubles.elementAt(i)).doubleValue();
      System.out.println("Vector[ "+i+"] = "+value);       
    }     
  } 

 /**
  * Method to get the medium value for utility given to vectors
  * @param utilities Vector with utilities
  * @param policies Vector with policies
  * @param medium value for utility given the policies
  */

  public static double getMediumValueForUtility(Vector utilities, Vector policies){
    int i;
    double utility=0;
    double policy;
    int ones=0;

    // Consider the values by one
    for(i=0; i < utilities.size(); i++){
      policy=((Double)policies.elementAt(i)).doubleValue();
      
      // Consider the utility for this position only if policy is 1
      if (policy == 1){
        ones++;
        utility+=((Double)utilities.elementAt(i)).doubleValue();
      }
    }

    // At the end, compute the medium value (only if ones != 0)
    if (ones != 0){
      utility=utility/(double)ones;
    }

    // Return the value of utility
    return utility;
  }
}
