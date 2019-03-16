// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/200 records/aux200pct/partition3_model.elv" {

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
states = ("Default" "[36-58]" "[16-36]" "[0-16]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[18-42]" "[0-18]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Pupilas_Dilatadas Heridas_Internas;

link Pupilas_Dilatadas Signos_Vitales;

link Signos_Vitales Heridas_Internas;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2660098522167488 0.4088669950738916 0.3251231527093596 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8909090909090909 0.5952380952380952 0.13432835820895522 0.10909090909090909 0.40476190476190477 0.8656716417910447 );
}

relation Heridas_Internas Colision Pupilas_Dilatadas Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2962962962962963 0.5 0.1 0.6 0.3333333333333333 0.3333333333333333 0.1111111111111111 0.3333333333333333 0.2 0.3333333333333333 0.3333333333333333 0.4 0.5333333333333333 0.1 0.13043478260869565 0.25 0.25 0.2 0.3333333333333333 0.3333333333333333 0.1 0.45454545454545453 0.5714285714285714 0.13043478260869565 0.2857142857142857 0.3333333333333333 0.16666666666666666 0.16666666666666666 0.3333333333333333 0.16666666666666666 0.25 0.3333333333333333 0.08333333333333333 0.2222222222222222 0.4 0.1891891891891892 0.6666666666666666 0.25 0.5 0.2 0.3333333333333333 0.3333333333333333 0.7777777777777778 0.3333333333333333 0.6 0.5833333333333334 0.3333333333333333 0.4 0.3333333333333333 0.1 0.08695652173913043 0.25 0.25 0.2 0.3333333333333333 0.3333333333333333 0.2 0.2727272727272727 0.2857142857142857 0.21739130434782608 0.2857142857142857 0.3333333333333333 0.3333333333333333 0.5 0.3333333333333333 0.16666666666666666 0.5 0.3333333333333333 0.5 0.5555555555555556 0.4 0.35135135135135137 0.037037037037037035 0.25 0.4 0.2 0.3333333333333333 0.3333333333333333 0.1111111111111111 0.3333333333333333 0.2 0.08333333333333333 0.3333333333333333 0.2 0.13333333333333333 0.8 0.782608695652174 0.5 0.5 0.6 0.3333333333333333 0.3333333333333333 0.7 0.2727272727272727 0.14285714285714285 0.6521739130434783 0.42857142857142855 0.3333333333333333 0.5 0.3333333333333333 0.3333333333333333 0.6666666666666666 0.25 0.3333333333333333 0.4166666666666667 0.2222222222222222 0.2 0.4594594594594595 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7064220183486238 0.030303030303030304 0.06422018348623854 0.0707070707070707 0.11926605504587157 0.1414141414141414 0.11009174311926606 0.7575757575757576 );
}

relation Signos_Vitales Herida_Cabeza Pupilas_Dilatadas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5189873417721519 0.5555555555555556 0.5333333333333333 0.6428571428571429 0.2 0.3333333333333333 0.0625 0.2077922077922078 0.11392405063291139 0.2222222222222222 0.06666666666666667 0.14285714285714285 0.2 0.1111111111111111 0.0625 0.07792207792207792 0.3670886075949367 0.2222222222222222 0.4 0.21428571428571427 0.6 0.5555555555555556 0.875 0.7142857142857143 );
}

}
