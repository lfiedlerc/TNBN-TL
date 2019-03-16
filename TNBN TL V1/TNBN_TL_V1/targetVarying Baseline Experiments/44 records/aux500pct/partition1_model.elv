// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/44 records/aux500pct/partition1_model.elv" {

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
states = ("Default" "[34-59]" "[15-34]" "[0-15]");
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
states = ("Default" "[19-45]" "[0-19]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Pupilas_Dilatadas;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2553191489361702 0.425531914893617 0.3191489361702128 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8461538461538461 0.6190476190476191 0.125 0.15384615384615385 0.38095238095238093 0.875 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.42857142857142855 0.22727272727272727 0.11764705882352941 0.42857142857142855 0.13636363636363635 0.5294117647058824 0.14285714285714285 0.6363636363636364 0.35294117647058826 );
}

relation Pupilas_Dilatadas Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.16666666666666666 0.5 0.5384615384615384 0.16666666666666666 0.07692307692307693 0.14285714285714285 0.4166666666666667 0.1 0.07692307692307693 0.3333333333333333 0.15384615384615385 0.14285714285714285 0.3333333333333333 0.3 0.23076923076923078 0.16666666666666666 0.15384615384615385 0.07142857142857142 0.08333333333333333 0.1 0.15384615384615385 0.3333333333333333 0.6153846153846154 0.6428571428571429 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7272727272727273 0.5555555555555556 0.08333333333333333 0.2 0.16666666666666666 0.15384615384615385 0.09090909090909091 0.1111111111111111 0.16666666666666666 0.2 0.25 0.07692307692307693 0.18181818181818182 0.3333333333333333 0.75 0.6 0.5833333333333334 0.7692307692307693 );
}

}
