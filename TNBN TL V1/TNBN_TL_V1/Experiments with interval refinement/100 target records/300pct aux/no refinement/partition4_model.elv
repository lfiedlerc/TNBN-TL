// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/300pct aux/no refinement/partition4_model.elv" {

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
states = ("Default" "[27-44]" "[13-27]" "[0-13]");
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
values= table (0.2671896852382635 0.3919312225227445 0.3408790922389921 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8351320144523862 0.6236801465829238 0.07598929163442483 0.16486798554761384 0.3763198534170762 0.9240107083655752 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.27545546359570316 0.18928330408962077 0.061451052729545506 0.6498373578520743 0.16014981778917534 0.3924263636259381 0.07470717855222257 0.650566878121204 0.5461225836445165 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5714285714285714 0.1 0.75 0.11764705882352941 0.3333333333333333 0.14285714285714285 0.14285714285714285 0.1 0.07142857142857142 0.17647058823529413 0.16666666666666666 0.05714285714285714 0.14285714285714285 0.2 0.07142857142857142 0.11764705882352941 0.3333333333333333 0.2571428571428571 0.14285714285714285 0.6 0.10714285714285714 0.5882352941176471 0.16666666666666666 0.5428571428571428 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.75 0.6956521739130435 0.08695652173913043 0.16666666666666666 0.25 0.08333333333333333 0.125 0.08695652173913043 0.17391304347826086 0.16666666666666666 0.1 0.1111111111111111 0.0625 0.043478260869565216 0.13043478260869565 0.3333333333333333 0.1 0.08333333333333333 0.0625 0.17391304347826086 0.6086956521739131 0.3333333333333333 0.55 0.7222222222222222 );
}

}
