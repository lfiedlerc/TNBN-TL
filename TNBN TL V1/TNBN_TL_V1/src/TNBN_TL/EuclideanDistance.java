package TNBN_TL;

public class EuclideanDistance implements Distance{
    
    @Override
    public double calculate(double x1, double x2){
        double d;
        d = x1 - x2;
        return Math.sqrt(d * d);
    }
}