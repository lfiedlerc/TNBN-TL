// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/44 records/aux200pct/partition0_model.elv" {

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
states = ("Default" "[32-58]" "[14-32]" "[0-14]");
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
states = ("Default" "[16-44]" "[0-16]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Pupilas_Dilatadas;

link Signos_Vitales Heridas_Internas;

link Signos_Vitales Pupilas_Dilatadas;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3191489361702128 0.3191489361702128 0.3617021276595745 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.9375 0.6875 0.1111111111111111 0.0625 0.3125 0.8888888888888888 );
}

relation Heridas_Internas Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.15384615384615385 0.5 0.16666666666666666 0.3333333333333333 0.16666666666666666 0.18181818181818182 0.3333333333333333 0.14285714285714285 0.13333333333333333 0.7692307692307693 0.25 0.6666666666666666 0.5 0.16666666666666666 0.18181818181818182 0.3333333333333333 0.2857142857142857 0.4666666666666667 0.07692307692307693 0.25 0.16666666666666666 0.16666666666666666 0.6666666666666666 0.6363636363636364 0.3333333333333333 0.5714285714285714 0.4 );
}

relation Pupilas_Dilatadas Herida_Cabeza Heridas_Internas Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5 0.2 0.4 0.5333333333333333 0.25 0.2857142857142857 0.25 0.5 0.6666666666666666 0.25 0.25 0.2 0.25 0.2 0.2727272727272727 0.25 0.25 0.2 0.16666666666666666 0.4 0.2 0.06666666666666667 0.25 0.42857142857142855 0.25 0.16666666666666666 0.1111111111111111 0.25 0.25 0.4 0.25 0.2 0.09090909090909091 0.25 0.25 0.1 0.16666666666666666 0.2 0.2 0.06666666666666667 0.25 0.14285714285714285 0.25 0.16666666666666666 0.1111111111111111 0.25 0.25 0.2 0.25 0.2 0.2727272727272727 0.25 0.125 0.1 0.16666666666666666 0.2 0.2 0.3333333333333333 0.25 0.14285714285714285 0.25 0.16666666666666666 0.1111111111111111 0.25 0.25 0.2 0.25 0.4 0.36363636363636365 0.25 0.375 0.6 );
}

relation Signos_Vitales Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5 0.045454545454545456 0.14285714285714285 0.2727272727272727 0.35714285714285715 0.6818181818181818 );
}

}
