// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/200 records/aux200pct/partition4_model.elv" {

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
states = ("Default" "[33-58]" "[14-33]" "[0-14]");
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
states = ("Default" "[17-44]" "[0-17]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

link Pupilas_Dilatadas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.22660098522167488 0.3891625615763547 0.3842364532019704 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8085106382978723 0.5375 0.1518987341772152 0.19148936170212766 0.4625 0.8481012658227848 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3333333333333333 0.25925925925925924 0.0875 0.625 0.16049382716049382 0.4125 0.041666666666666664 0.5802469135802469 0.5 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6914893617021277 0.07894736842105263 0.09574468085106383 0.09649122807017543 0.1702127659574468 0.12280701754385964 0.0425531914893617 0.7017543859649122 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas Pupilas_Dilatadas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8 0.6666666666666666 0.375 0.4 0.6538461538461539 0.6666666666666666 0.4444444444444444 0.3333333333333333 0.1111111111111111 0.2 0.14285714285714285 0.25 0.3333333333333333 0.5 0.2 0.2857142857142857 0.3333333333333333 0.25 0.14285714285714285 0.125 0.125 0.14285714285714285 0.2 0.023809523809523808 0.15 0.16666666666666666 0.25 0.4 0.07692307692307693 0.16666666666666666 0.2222222222222222 0.3333333333333333 0.2222222222222222 0.2 0.14285714285714285 0.25 0.3333333333333333 0.25 0.4 0.21428571428571427 0.3333333333333333 0.375 0.14285714285714285 0.1875 0.25 0.2857142857142857 0.3 0.16666666666666666 0.05 0.16666666666666666 0.375 0.2 0.2692307692307692 0.16666666666666666 0.3333333333333333 0.3333333333333333 0.6666666666666666 0.6 0.7142857142857143 0.5 0.3333333333333333 0.25 0.4 0.5 0.3333333333333333 0.375 0.7142857142857143 0.6875 0.625 0.5714285714285714 0.5 0.8095238095238095 );
}

}
