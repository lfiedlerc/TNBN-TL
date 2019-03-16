// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/100pct aux/no refinement/partition0_model.elv" {

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
states = ("Default" "[29-44]" "[15-29]" "[0-15]");
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
values= table (0.24394782182810282 0.37669990774575224 0.37935227042614506 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.82754592418072 0.6452224585640434 0.10350283314009708 0.17245407581928 0.3547775414359566 0.8964971668599029 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.20345240638127665 0.27072959856617246 0.10811937891825017 0.7338384409514117 0.10324567548293857 0.38406149654568456 0.06270915266731167 0.6260247259508889 0.5078191245360653 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6363636363636364 0.11320754716981132 0.07272727272727272 0.09433962264150944 0.10909090909090909 0.07547169811320754 0.18181818181818182 0.7169811320754716 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7 0.6111111111111112 0.2 0.25 0.14285714285714285 0.25 0.5555555555555556 0.42857142857142855 0.047619047619047616 0.16666666666666666 0.25 0.15384615384615385 0.25 0.4 0.125 0.2857142857142857 0.16666666666666666 0.045454545454545456 0.1 0.05555555555555555 0.4 0.25 0.2857142857142857 0.25 0.1111111111111111 0.14285714285714285 0.14285714285714285 0.3333333333333333 0.25 0.07692307692307693 0.25 0.2 0.125 0.14285714285714285 0.1111111111111111 0.045454545454545456 0.1 0.1111111111111111 0.2 0.25 0.14285714285714285 0.25 0.1111111111111111 0.14285714285714285 0.14285714285714285 0.3333333333333333 0.25 0.15384615384615385 0.25 0.2 0.125 0.2857142857142857 0.1111111111111111 0.18181818181818182 0.1 0.2222222222222222 0.2 0.25 0.42857142857142855 0.25 0.2222222222222222 0.2857142857142857 0.6666666666666666 0.16666666666666666 0.25 0.6153846153846154 0.25 0.2 0.625 0.2857142857142857 0.6111111111111112 0.7272727272727273 );
}

}
