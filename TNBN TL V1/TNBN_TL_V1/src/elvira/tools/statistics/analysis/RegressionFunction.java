/*
*   Interface RegressionFunction
*
*   The sum of squares function needed by the
*   non-linear regression methods in the class Regression
*   is supplied by means of this interface, RegressionFunction
*
*   WRITTEN BY: Michael Thomas Flanagan
*
*   DATE:	    February 2002
*   MODIFIED:   14 April 2004
*
*   DOCUMENTATION:
*   See Michael Thomas Flanagan's JAVA library on-line web page:
*   Regression.html
*
*   Copyright (c) April 2004
*
*   PERMISSION TO COPY:
*   Permission to use, copy and modify this software and its documentation for
*   NON-COMMERCIAL purposes is granted, without fee, provided that an acknowledgement
*   to the author, Michael Thomas Flanagan at www.ee.ucl.ac.uk/~mflanaga, appears in all copies.
*
*   Dr Michael Thomas Flanagan makes no representations about the suitability
*   or fitness of the software for any or for a particular purpose.
*   Michael Thomas Flanagan shall not be liable for any damages suffered
*   as a result of using, modifying or distributing this software or its derivatives.
*
***************************************************************************************/


package elvira.tools.statistics.analysis;

// Interface for Regression class
// Sum of squares function for non-linear regression methods
public interface RegressionFunction{
    double function(double[]param, double[] x);
}
