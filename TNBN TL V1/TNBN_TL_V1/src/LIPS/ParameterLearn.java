/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import elvira.Bnet;
import elvira.database.DataBaseCases;
import elvira.learning.DELearning;
import java.io.FileInputStream;
import java.io.FileWriter;

/**
 *
 * @author pablohl
 */
public class ParameterLearn {


    public static void main(String []args){
        try{
        ParameterLearn p = new ParameterLearn();
     //   p.learn();

        }catch(Exception e){
            e.printStackTrace();}
    }

    public EvaluacionRed learn(Bnet red, String archivoDBC) throws Exception{

      FileWriter f2 = new FileWriter("miRed.elv");
      red.saveBnet(f2);
      f2.close();
  
      EvaluacionRed out= null;

      String args[] = {archivoDBC,"miRed.elv","output.elv"};
      if(args.length < 3){
        System.out.println("Too few arguments. Usage: file.dbc file.elv output.elv");
        System.exit(0);
      }
      else{
        FileInputStream f = new FileInputStream(args[0]);
        DataBaseCases cases = new DataBaseCases(f);
        //}catch(IOException e){};

        FileInputStream fnet = new FileInputStream(args[1]);
        Bnet bnet = new Bnet(fnet);
        //}catch(IOException e){};

        DELearning output = new DELearning(cases,bnet);
        output.learning();
        f2 = new FileWriter(args[2]);
        output.getOutput().saveBnet(f2);
        f2.close();

        Bnet r=output.getOutput();
        out = new EvaluacionRed(r);


      }


      return out;
    }



  public EvaluacionRed learn(Bnet red, String archivoDBC,boolean algo) throws Exception{

      FileWriter f2 = new FileWriter("miRed.elv");
      red.saveBnet(f2);
      f2.close();

      EvaluacionRed out= null;

      String args[] = {archivoDBC,"miRed.elv","output.elv"};
      if(args.length < 3){
        System.out.println("Too few arguments. Usage: file.dbc file.elv output.elv");
        System.exit(0);
      }
      else{
        FileInputStream f = new FileInputStream(args[0]);
        DataBaseCases cases = new DataBaseCases(f);
        //}catch(IOException e){};

        FileInputStream fnet = new FileInputStream(args[1]);
        Bnet bnet = new Bnet(fnet);
        //}catch(IOException e){};

        DELearning output = new DELearning(cases,bnet);
        output.learning();
 
        Bnet r=output.getOutput();
        out = new EvaluacionRed(r);


      }


      return out;
    }


}
