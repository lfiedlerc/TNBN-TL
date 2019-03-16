// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/500pct aux/no refinement/partition1_model.elv" {

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
states = ("Default" "[39-59]" "[18-39]" "[0-18]");
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
states = ("Default" "[30-44]" "[14-30]" "[0-14]");
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
values= table (0.2260673622437821 0.3762019153449212 0.3977307224112967 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8153600525487122 0.6207308004339518 0.07299959975572609 0.1846399474512878 0.37926919956604827 0.927000400244274 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.31322414106754154 0.28671925599071374 0.1435805715582713 0.6453723974832667 0.09524874652208282 0.38002144314133063 0.041403461449191714 0.6180319974872035 0.4763979853003982 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5 0.125 0.6666666666666666 0.125 0.3333333333333333 0.02127659574468085 0.1 0.125 0.037037037037037035 0.0625 0.3333333333333333 0.1276595744680851 0.1 0.25 0.14814814814814814 0.125 0.16666666666666666 0.10638297872340426 0.3 0.5 0.14814814814814814 0.6875 0.16666666666666666 0.7446808510638298 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7058823529411765 0.6 0.14285714285714285 0.35714285714285715 0.18181818181818182 0.05714285714285714 0.058823529411764705 0.13333333333333333 0.19047619047619047 0.14285714285714285 0.09090909090909091 0.05714285714285714 0.11764705882352941 0.06666666666666667 0.047619047619047616 0.07142857142857142 0.09090909090909091 0.08571428571428572 0.11764705882352941 0.2 0.6190476190476191 0.42857142857142855 0.6363636363636364 0.8 );
}

}
