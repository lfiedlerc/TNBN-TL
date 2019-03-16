/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author Pablo
 *
 * Esta clase obtiene el modelo de Mezcla de Gausianas en 1 dimension
 * para lo cual aplica el algoritmo EM
 *
 */
public class MixtureGaussians {


    double means[];
    double sigmas[];
    double phis[];
    int numInstances=1;
    int numGaussian=2;
    DataSet data;
    double sumaW[];
    double pr[];
    boolean verbose;

    public MixtureGaussians(int numG){
            numGaussian=numG;
            verbose=false;
    }

    public void toFile(String file, ArrayList<String> texto){
            try{
            FileWriter fstream = new FileWriter(file);
            BufferedWriter out = new BufferedWriter(fstream);
            for(String l:texto){
                out.write(l);
                out.newLine();
            }
            out.close();
            }catch (Exception e){
              System.err.println("Error: " + e.getMessage());
            }
    }
// what are the initial values?????
    public Interval[] algorithmEM(DataSet d){

        data=d;
        double error=0;
        double errorAnt=Double.MIN_VALUE;
        double epsilon=0.00001;

        means= new double[numGaussian];
        sigmas= new double[numGaussian];
        phis= new double[numGaussian];
        sumaW= new double [numGaussian];
        pr= new double [numGaussian];

        numInstances=data.getInstances().size();

        for(int i=0;i<numInstances;i++){
            Instance ins=data.getInstances().get(i);
            ins.setNWeights(numGaussian);
        }

       for(int i=0;i<numInstances;i++){
            Instance ins=data.getInstances().get(i);
     //       System.out.println(ins.toStringWeight());
       }
       getIniciales();

       error=getError();
       double dif=Double.MAX_VALUE;
       while (dif>epsilon ){
  //      for (int k=0;k<10;k++){
               eStep();
               mStep();

               errorAnt=error;
               error=getError();
               dif=error-errorAnt;
        }

       if (verbose==true){
            System.out.println("Error mix->"+errorAnt);
            System.out.println("Error mix--->"+error);
       }
       
        ArrayList<String> salida = new ArrayList<String>();
        for(int i=0;i<numInstances;i++){
            Instance ins=data.getInstances().get(i);
       //     System.out.println(ins.toStringWeight());
            salida.add(ins.toStringWeight());
        }
   //     System.out.println("error"+errorAnt+" "+error);

        for(int i=0;i<numGaussian;i++){
  //              System.out.println("K Gauss:"+ means[i]+" "+sigmas[i]+" "+phis[i]);
        }
        toFile("mixture.txt",salida);
        return getIntervalos();

    }
    
    public Interval[] algorithmEM(DataSet d, double [] mean, double [] std, double [] mixing){

        data=d;
        double error=0;
        double errorAnt=Double.MIN_VALUE;
        double epsilon=0.00001;

        means= new double[numGaussian];
        sigmas= new double[numGaussian];
        phis= new double[numGaussian];
        sumaW= new double [numGaussian];
        pr= new double [numGaussian];

        numInstances=data.getInstances().size();

        for(int i=0;i<numInstances;i++){
            Instance ins=data.getInstances().get(i);
            ins.setNWeights(numGaussian);
        }

       for(int i=0;i<numInstances;i++){
            Instance ins=data.getInstances().get(i);
     //       System.out.println(ins.toStringWeight());
       }
       getIniciales(mean,std,mixing);

       error=getError();
       double dif=Double.MAX_VALUE;
       while (dif>epsilon ){
  //      for (int k=0;k<10;k++){
               eStep();
               mStep();

               errorAnt=error;
               error=getError();
               dif=error-errorAnt;
        }

       if (verbose==true){
            System.out.println("Error mix->"+errorAnt);
            System.out.println("Error mix--->"+error);
       }
       
        ArrayList<String> salida = new ArrayList<String>();
        for(int i=0;i<numInstances;i++){
            Instance ins=data.getInstances().get(i);
       //     System.out.println(ins.toStringWeight());
            salida.add(ins.toStringWeight());
        }
   //     System.out.println("error"+errorAnt+" "+error);

        for(int i=0;i<numGaussian;i++){
  //              System.out.println("K Gauss:"+ means[i]+" "+sigmas[i]+" "+phis[i]);
        }
        toFile("mixture.txt",salida);
        return getIntervalos();

    }

    private Interval[] getIntervalos(){
        ArrayList<Interval> intervalIns= new ArrayList<Interval>();

        Interval [] intervalos = new Interval[0];
        int finultimo=0;
        for(int i=0;i<numGaussian;i++){
            double start=means[i]-Math.sqrt(sigmas[i]);
            double end=means[i]+Math.sqrt(sigmas[i]);
            if(start<0)
                start=0;

            int ini=Math.round((float)start);
            int fin=Math.round((float)end);

            //Si el inicio es mas grande que el fin adios
            if (ini>=fin)
                return intervalos;

            //Si no hay suficientes intervalos como los que se piden
            //adios
            if (ini<finultimo)
                return intervalos;

            finultimo=fin;
            intervalIns.add(new Interval(ini,fin));
        }

        intervalos= new Interval[intervalIns.size()];
        for(int i=0;i<intervalIns.size();i++)
            intervalos[i]= intervalIns.get(i);


        return intervalos;

    }

    private Interval[] getIntervalosMinMax(){
        Interval[] intervalos= new Interval[numGaussian];
        ArrayList<ArrayList<Double>> intervalIns= new ArrayList<ArrayList<Double>>();

        for(int i=0;i<numGaussian;i++)
            intervalIns.add(new ArrayList<Double>());

        for(int i=0;i<numInstances;i++){
            Instance ins=data.getInstances().get(i);
            intervalIns.get(indexOfMax(ins)).add(ins.getAttribute(0));
        }

        for(int i=0;i<numGaussian;i++){
            Collections.sort(intervalIns.get(i));
            int ultimo=intervalIns.get(i).size()-1;
            intervalos[i]= new Interval(intervalIns.get(i).get(0),intervalIns.get(i).get(ultimo));
        }
        return intervalos;

    }

    private int indexOfMax(Instance ins){

        double max=Double.MIN_VALUE;
        int index=-1;
        for(int i=0;i<ins.getNumWeights();i++){
            if(max<ins.getWeight(i)){
                max=ins.getWeight(i);
                index=i;
            }
        }
        return index;
    }


    private void eStep(){
           double[] sumaProb= new double[numGaussian];
           for(int j=0;j<numGaussian;j++){
                calculaProbas(j);
           }

           for(int l=0;l<numGaussian;l++){
                  for(int i=0;i<numInstances;i++){
                     Instance ins=data.getInstances().get(i);
                     double val=ins.getWeight(l)*phis[l];

                     double suma=0;
                     for(int j=0;j<numGaussian;j++){
                        double newval=ins.getWeight(j)*phis[j];
                        suma+= newval;
                     }
                     ins.setWeight(l, val/suma);
           //          System.out.println("Pr -----"+ins.toStringWeight());
                  }
           }

   }

    private void calculaProbas(int index){
      double weights[]= new double[numInstances];

      for(int i=0;i<numInstances;i++){
        Instance ins=data.getInstances().get(i);
        weights[i]=GaussianDistribution.evaluate(ins.getAttribute(0), means[index], sigmas[index]);
   //     System.out.println(index+" -----"+weights[i]);
      }

       for(int i=0;i<numInstances;i++){
           Instance ins=data.getInstances().get(i);
           ins.setWeight(index,weights[i]);
       }
    }


    private void mStep(){

        double meanUp=0, meanDown=0, sigmaUp=0,sigmaDown=0, phisTmp=0;

        for (int index=0;index<numGaussian;index++){
            phisTmp=0;
            for(int i=0;i<numInstances;i++){
                Instance ins=data.getInstances().get(i);
                phisTmp+=ins.getWeight(index);
       //         System.out.println(ins.getWeight(index));
            }
      //      System.out.println("phis"+phisTmp+" "+numInstances);
            phis[index]=phisTmp/numInstances;
        }

        for (int index=0;index<numGaussian;index++){
            meanUp=0; meanDown=0;
            for(int i=0;i<numInstances;i++){
                Instance ins=data.getInstances().get(i);
                meanUp+=(ins.getWeight(index)*ins.getAttribute(0));
                meanDown+=ins.getWeight(index);
            }
            means[index]=meanUp/meanDown;
        }

        for (int index=0;index<numGaussian;index++){
            sigmaUp=0; sigmaDown=0;
            for(int i=0;i<numInstances;i++){
                Instance ins=data.getInstances().get(i);
                double derecha=ins.getAttribute(0)-means[index];
                sigmaUp+=(ins.getWeight(index)*Math.pow(derecha,2));
                sigmaDown+=ins.getWeight(index);
            }
            sigmas[index]=sigmaUp/sigmaDown;
        }

   //     for (int index=0;index<numGaussian;index++){
   //          System.out.println("cluster"+index+" "+phis[index]+" "+sigmas[index]+" "+means[index]);
   //     }
    }

    private boolean esMax(Instance ins, int index){
        double max=ins.getWeight(index);

    //    System.out.println("m "+ins.toStringWeight()+" "+index);
        for (int i=0;i<numGaussian;i++){
            if (max<ins.getWeight(i))
                return false;
        }
        return true;
    }

    public void getIniciales(){

        double max=Double.MIN_VALUE;
        double min=Double.MAX_VALUE;

        for(int i=0;i<numInstances;i++){
            Instance ins= data.getInstances().get(i);
            double val=ins.getAttribute(0);
            if(val>max){
                max=val;
            }
            if(val<min){
                min=val;
            }
        }
        double proba=1.0/numGaussian;

        double interval=max-min;
        double step=interval/(numGaussian+1);
        for (int i=0;i<numGaussian;i++){
               phis[i]=proba;
               means[i]=((i+1)*step)+min;
               sigmas[i]=Math.sqrt(step/2);
       //        System.out.println("cluster"+i+" pi"+phis[i]+" sig "+sigmas[i]+" mean "+means[i]);
        }

    }
    
    public void getIniciales(double [] mean, double [] std, double [] mixing){
        double proba=1.0/numGaussian;
        for (int i=0;i<numGaussian;i++){
               phis[i]=mixing[i];
               means[i]=mean[i];
               sigmas[i]=std[i];
       //        System.out.println("cluster"+i+" pi"+phis[i]+" sig "+sigmas[i]+" mean "+means[i]);
        }

    }

    public double getError(){
        double mul=1;

        for(int i=0;i<numInstances;i++){
            Instance ins= data.getInstances().get(i);
            double suma=0;
            for (int j=0;j<numGaussian;j++){
                suma+=phis[j]*GaussianDistribution.evaluate(ins.getAttribute(0), means[j], sigmas[j]);
            }
            mul*=suma;
        }
   //     System.out.println("error "+mul);
       return mul;
    }


    public static void main(String[] args){

        MixtureGaussians mix = new MixtureGaussians(2);

        DataSet d = new DataSet();
        ArrayList<Double> tmp = new ArrayList<Double>();
        tmp.add(3.0);
        Instance i = new Instance(tmp,0);
        d.addInstance(i);

        tmp = new ArrayList<Double>();
        tmp.add(5.0);
        i = new Instance(tmp,0);
        d.addInstance(i);

        tmp = new ArrayList<Double>();
        tmp.add(8.0);
        i = new Instance(tmp,0);
        d.addInstance(i);

        tmp = new ArrayList<Double>();
        tmp.add(10.0);
        i = new Instance(tmp,0);
        d.addInstance(i);

        mix.algorithmEM(d);

    }

}
