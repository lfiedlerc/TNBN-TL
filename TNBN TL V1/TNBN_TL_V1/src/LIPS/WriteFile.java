/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import elvira.Bnet;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.ArrayList;

/**
 *
 * @author Pablo
 */
public class WriteFile {

        public static void toFile(String file, ArrayList<String> texto){
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


     public static void toFile(String file, String[][] texto){
            try{
            FileWriter fstream = new FileWriter(file);
            BufferedWriter out = new BufferedWriter(fstream);
            for(String[] l:texto){
                StringBuilder str= new StringBuilder();
                for(String cad:l){
                    str.append(cad+" ");
                }
                out.write(str.toString());
                out.newLine();
            }
            out.close();
            }catch (Exception e){
              System.err.println("Error: " + e.getMessage());
            }
    }

    public static void toFile(String file,StringBuilder texto){
            try{
            FileWriter fstream = new FileWriter(file);
            BufferedWriter out = new BufferedWriter(fstream);
            out.write(texto.toString());
            out.close();
            }catch (Exception e){
              System.err.println("Error: " + e.getMessage());
            }
    }

    public static void toFile(String file,String texto){
            try{
            FileWriter fstream = new FileWriter(file);
            BufferedWriter out = new BufferedWriter(fstream);
            out.write(texto);
            out.close();
            }catch (Exception e){
              System.err.println("Error: " + e.getMessage());
            }
    }

    public static void toFileAppend(String file,String texto){
            try{
            FileWriter fstream = new FileWriter(file,true);
            BufferedWriter out = new BufferedWriter(fstream);
            out.write(texto.toString());
            out.close();
            }catch (Exception e){
              System.err.println("Error: " + e.getMessage());
            }
    }


    public static void toFile(String file, Bnet red){
        try{
         FileWriter   f2 = new FileWriter(file);
         red.saveBnet(f2);
         f2.close();
         }catch(Exception e){
             System.out.println("Error");e.printStackTrace();
         }
    }


    public static void toFile(String file, ArrayList<ArrayList<Integer>> tabla, boolean algo){
        StringBuilder str = new StringBuilder();
        for(ArrayList<Integer> linea:tabla){
            str.append(linea+"\n");
        }
        toFile(file,str);
    }

}
