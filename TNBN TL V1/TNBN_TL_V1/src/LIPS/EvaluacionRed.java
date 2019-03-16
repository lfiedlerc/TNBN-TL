/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package LIPS;

import elvira.Bnet;
import java.util.ArrayList;

/**
 *
 * @author pablohl
 */
public class EvaluacionRed {

    private Bnet red;
    private double promInferencia;
    private ArrayList<Double> resulInferencia;
    private double divergenceKL,divergenceKL2;
    private double fitness;
    private ArrayList<IntervalSet> arrayInterval;
    private double diferenciaTiempo;


    public EvaluacionRed(Bnet red) {
        this.red = red;
    }




    public EvaluacionRed(Bnet red, double divergenceKL,double divergenceKL2, double fitness) {
        this.red = red;
        this.divergenceKL = divergenceKL;
        this.divergenceKL2 = divergenceKL2;

        this.fitness=fitness;
    }


    public EvaluacionRed(Bnet red,double promInferencia, ArrayList<Double> resulInferencia) {
        this.promInferencia = promInferencia;
        this.resulInferencia = resulInferencia;
        this.red = red;
    }

    public EvaluacionRed(Bnet red,ArrayList<Double> resulInferencia) {
        this.resulInferencia = resulInferencia;
        double suma=0;
        for(Double d:resulInferencia){
            suma+=d;
        }
        suma/=resulInferencia.size();
        promInferencia=suma;
        this.red = red;
    }



    public double getPromInferencia() {
        return promInferencia;
    }

    public void setPromInferencia(double promInferencia) {
        this.promInferencia = promInferencia;
    }

    public Bnet getRed() {
        return red;
    }

    public void setRed(Bnet red) {
        this.red = red;
    }

    public ArrayList<Double> getResulInferencia() {
        return resulInferencia;
    }

    public void setResulInferencia(ArrayList<Double> resulInferencia) {
        this.resulInferencia = resulInferencia;
        double suma=0;
        for(Double d:resulInferencia){
            suma+=d;
        }
        suma/=resulInferencia.size();
        promInferencia=suma;
    }

    public double getDivergenceKL() {
        return divergenceKL;
    }

    public void setDivergenceKL(double divergenceKL) {
        this.divergenceKL = divergenceKL;
    }

    public double getFitness() {
        return fitness;
    }

    public void setFitness(double fitness) {
        this.fitness = fitness;
    }

    public ArrayList<IntervalSet> getArrayInterval() {
        return arrayInterval;
    }

    public void setArrayInterval(ArrayList<IntervalSet> arrayInterval) {
        this.arrayInterval = arrayInterval;
    }

    public double getDiferenciaTiempo() {
        return diferenciaTiempo;
    }

    public void setDiferenciaTiempo(double diferenciaTiempo) {
        this.diferenciaTiempo = diferenciaTiempo;
    }


    public double getCalidadCombinada(double param){
        return (param*this.getPromInferencia()) + ((1-param)*this.getDiferenciaTiempo());
    }

    public double getDivergenceKL2() {
        return divergenceKL2;
    }

    public void setDivergenceKL2(double divergenceKL2) {
        this.divergenceKL2 = divergenceKL2;
    }



}
