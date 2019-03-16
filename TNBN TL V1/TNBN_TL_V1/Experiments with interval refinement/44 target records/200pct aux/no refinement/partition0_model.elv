// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/200pct aux/no refinement/partition0_model.elv" {

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
states = ("Default" "[38-59]" "[18-38]" "[0-18]");
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
states = ("Default" "[31-44]" "[16-31]" "[0-16]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Pupilas_Dilatadas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.27097229277238966 0.3698363478637524 0.35919135936385793 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8493464177806402 0.6353463457632211 0.09056978945258576 0.15065358221935976 0.364653654236779 0.9094302105474141 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.16507858373474912 0.2370441545655919 0.11521098368709028 0.7815090889912449 0.1935082451390598 0.4282562295665136 0.05341232727400582 0.5694476002953482 0.45653278674639614 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5 0.25 0.7142857142857143 0.25 0.4 0.15789473684210525 0.1111111111111111 0.25 0.07142857142857142 0.125 0.2 0.21052631578947367 0.16666666666666666 0.25 0.07142857142857142 0.125 0.2 0.15789473684210525 0.2222222222222222 0.25 0.14285714285714285 0.5 0.2 0.47368421052631576 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.375 0.6666666666666666 0.09090909090909091 0.2 0.08333333333333333 0.07142857142857142 0.25 0.05555555555555555 0.09090909090909091 0.2 0.08333333333333333 0.2857142857142857 0.125 0.05555555555555555 0.2727272727272727 0.2 0.16666666666666666 0.14285714285714285 0.25 0.2222222222222222 0.5454545454545454 0.4 0.6666666666666666 0.5 );
}

}
