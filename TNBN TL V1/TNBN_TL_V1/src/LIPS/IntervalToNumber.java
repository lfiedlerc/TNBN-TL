/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import Utility.Beta;
import Utility.Exponential;
import Utility.Poisson;
import Utility.Triangular;
import elvira.FiniteStates;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Random;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import elvira.database.DataBaseCases;
import java.util.Arrays;
import java.util.LinkedHashSet;
/**
 *
 * @author Pablo
 *
 * Esta clase sirve para que dada unos intervalos iniciales obtenga datos numericos basado en alguna
 * distribucion como uniforme, gausiana
 *
 */
public class IntervalToNumber {

    public static final int UNIFORM=0;
    public static final int GAUSSIAN=1;
    public static final int EXPONENTIAL=2;
    public static final int POISSON=3;
    public static final int TRIANGULAR=4;
    public static final int BETA=5;
    boolean primera=true;
    double step;
    double step2;
    boolean verbose=false;

    /**
     * Este metodo convierte de un archivo de casos de elvira (.dbc) con intervalos discretos
     * obtiene valores numericos en lugar de los intervalos y da como salida un archivo .txt en formato de columnas
     * @param file el archivo de entrada (.dbc)
     * @param tipo constante que determina la distribucion usada para genera los datos
     * @param indicesColumnas son los indices de las columnas que tienen intervalos
     */


    public void preprocessElvira(String file,String fileOut, int tipo,ArrayList<Integer>indicesColumnas){ //se obtienen todas las instancias del archivo k entro
       ArrayList<String>salida=new ArrayList<String>();
        try{
        FileInputStream f = new FileInputStream(file);
        DataBaseCases cases = new DataBaseCases(f);

        for(int k=0;k<cases.getVariables().size();k++){
                FiniteStates node = (FiniteStates)cases.getVariables().elementAt(k);
                if (verbose==true)
                     System.out.println(Arrays.toString(node.getStringStates()));
        }

        //temporales tiene los indices de las columnas que queremos cambiar
        LinkedHashSet<Integer> temporales= new LinkedHashSet<Integer>();
        temporales.addAll(indicesColumnas);

        for(int j=0;j<cases.getNumberOfCases();j++){
            int[] caso=cases.getCaseListMem().getCase(j);

     //       System.out.println(Arrays.toString(caso));
            int tam=caso.length;
            Pattern pat=null;
            Matcher mat=null;

            String linea="";
            for(int i=0;i<tam;i++){
                String v= caso[i]+"";
                if (temporales.contains(i)==true){
                     FiniteStates node = (FiniteStates)cases.getVariables().elementAt(i);
                     String intervalo=node.getState(caso[i]);
                     intervalo=intervalo.substring(2);
                     intervalo=intervalo.substring(0,intervalo.length()-2);
             //        System.out.println(intervalo);
                     pat=Pattern.compile("-");
                     mat=pat.matcher(intervalo);
               //      System.out.println(intervalo);
                     int intervalIni=0,intervalFin=0;
                     double valor=-1;
                     if(mat.find()){
                         while(valor<0){
                             intervalIni=Integer.parseInt(intervalo.substring(0,mat.start()));
                             intervalFin=Integer.parseInt(intervalo.substring(mat.start()+1));
                             switch(tipo){
                                 case UNIFORM:  valor=getUniform(intervalIni,intervalFin); break;
                                 case GAUSSIAN:  valor=getGaussian(intervalIni,intervalFin); break;
                                 case EXPONENTIAL: valor=getExponential(intervalIni,intervalFin); break;
                                 case TRIANGULAR: valor=getTriangular(intervalIni,intervalFin); break;
                                 case POISSON: valor=getPoisson(intervalIni,intervalFin); break;
                                 case BETA: valor=getBeta(intervalIni,intervalFin); break;
                             }
                         }
                         linea+=valor+" ";
                     }
                     else{
                        linea+="Default ";

                     }
                }else
                {
                    FiniteStates node = (FiniteStates)cases.getVariables().elementAt(i);
                    String intervalo=node.getState(caso[i]);
                    intervalo=intervalo.substring(1, intervalo.length()-1);
                    linea+=intervalo+" ";
                }
            }
            salida.add(linea);
       }
       WriteFile.toFile(fileOut,salida);

       }catch(Exception e){e.printStackTrace();}

    }

    public void preprocessElvira(String file, int tipo,ArrayList<Integer>indicesColumnas){ //se obtienen todas las instancias del archivo k entro
        preprocessElvira(file,file+"noInterval.txt",tipo,indicesColumnas);
    }


      public void preprocess(String file, int tipo){ //se obtienen todas las instancias del archivo k entro
        ArrayList<String> archivo=ReadFile.getInfoFromFile(file);
        ArrayList<String>salida=new ArrayList<String>();

        boolean primero=true;
        for(String instancia: archivo){
            StringTokenizer tok= new StringTokenizer(instancia,",");
            ArrayList<Double> att= new ArrayList<Double>();
            int tam=tok.countTokens();

            if(primero==true){
                for(int i=0;i<tam-1;i++){
                }
                primero=false;
                continue;
            }
            Pattern pat=null;
            Matcher mat=null;

            String linea="";
            for(int i=0;i<tam;i++){
                String v=tok.nextToken();
                pat=Pattern.compile("\\Q[\\E*\\Q]\\E");
                mat=pat.matcher(v);
                double valor=0;
                if(mat.find()){
                      String intervalo=v.substring(1,mat.start());
                      pat=Pattern.compile("-");
                      mat=pat.matcher(intervalo);
                     int intervalIni=0,intervalFin=0;
                     if(mat.find()){
                         intervalIni=Integer.parseInt(intervalo.substring(0,mat.start()));
                         intervalFin=Integer.parseInt(intervalo.substring(mat.start()+1));
                     }
                     switch(tipo){
                         case UNIFORM:  valor=getUniform(intervalIni,intervalFin); break;
                         case GAUSSIAN:  valor=getGaussian(intervalIni,intervalFin); break;
                         case EXPONENTIAL: valor=getExponential(intervalIni,intervalFin); break;
                         case TRIANGULAR: valor=getTriangular(intervalIni,intervalFin); break;
                         case POISSON: valor=getPoisson(intervalIni,intervalFin); break;
                         case BETA: valor=getBeta(intervalIni,intervalFin); break;
                     }
               //      if(valor<0)
               //          valor=0;
                     linea+=valor+" ";
               //      System.out.println("\t{"+valor+"}");
                }else
                {
                    linea+=v+" ";
                }
            }
            salida.add(linea);
       }
       WriteFile.toFile(file+"noInterval.txt",salida);
     
    }




    public double getGaussian(double ini, double fin){

        double stDev=(fin-ini)/2;
        double media=(fin+ini)/2;
        Random r= new Random();
        double gau;
        gau=r.nextGaussian();
        gau*=stDev;
        gau+=media;
        return gau;
    }

    public double getUniform(int ini,int fin){
       double rnd=Math.random()*(fin-ini);
       double valor=(int)(rnd+ini);
       return valor;
    }

    public double getExponential(int ini,int fin){
       double media=(fin+ini)/2;
       Exponential e= new Exponential(media);
       double valor=e.sampleDouble();
       return valor;
    }

    public double getTriangular(int ini,int fin){
       if (primera==true){
            step=(fin-ini-2)*Math.random();
            primera=false;
       }
       double media=ini+step;
       Triangular e= new Triangular(ini,media,fin);
       double valor=e.sampleDouble();
       return valor;
    }

    public double getPoisson(int ini,int fin){
       if (primera==true){
            step=0.1+(Math.random()*2);
            primera=false;
       }

       Poisson e= new Poisson(step);
       double valor=ini+e.sampleDouble();
       return valor;
    }

    public double getBeta(int ini,int fin){
       if (primera==true){
            step=Math.random()*10;
            step2=Math.random()*10;
            primera=false;
       }
       int alfa=Math.round((float)step);
       int beta=Math.round((float)step2);

       Beta e= new Beta(alfa,beta);
       double valor=ini+((fin-ini)*e.sampleDouble());
       return valor;
    }
}
