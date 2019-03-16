// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/100pct aux/no refinement/partition2_model.elv" {

// Network Properties

kindofgraph = "directed";
visualprecision = "0.00";
version = 1.0;
default node states = (present , absent);

// Variables

node Colision(finite-states) {
title = "Colision";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Leve" "Moderado" "Severo");
}

node Herida_Cabeza(finite-states) {
title = "Herida Cabeza";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[39-59]" "[19-39]" "[0-19]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[26-44]" "[12-26]" "[0-12]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2064349112724325 0.34364888522974313 0.44991620349782446 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7890843857191816 0.6001096766091562 0.10350283314009708 0.21091561428081845 0.3998903233908438 0.8964971668599029 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.25242187794489046 0.3114119287882517 0.09221509986190407 0.6603842336059909 0.12358684059397818 0.48001731351897275 0.08719388844911856 0.5650012306177701 0.42776758661912323 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.631578947368421 0.06060606060606061 0.15789473684210525 0.09090909090909091 0.05263157894736842 0.09090909090909091 0.15789473684210525 0.7575757575757576 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5 0.2857142857142857 0.25 0.25 0.2 0.25 0.42857142857142855 0.25 0.125 0.25 0.2 0.125 0.25 0.5 0.4 0.2 0.25 0.07142857142857142 0.16666666666666666 0.14285714285714285 0.25 0.25 0.2 0.25 0.14285714285714285 0.25 0.25 0.25 0.2 0.125 0.25 0.16666666666666666 0.2 0.2 0.0625 0.14285714285714285 0.16666666666666666 0.14285714285714285 0.25 0.25 0.4 0.25 0.14285714285714285 0.25 0.125 0.25 0.2 0.125 0.25 0.16666666666666666 0.2 0.2 0.125 0.21428571428571427 0.16666666666666666 0.42857142857142855 0.25 0.25 0.2 0.25 0.2857142857142857 0.25 0.5 0.25 0.4 0.625 0.25 0.16666666666666666 0.2 0.4 0.5625 0.5714285714285714 );
}

}
