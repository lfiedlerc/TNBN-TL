// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/200 records/aux500pct/partition3_model.elv" {

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
states = ("Default" "[35-59]" "[15-35]" "[0-15]");
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
states = ("Default" "[16-42]" "[0-16]");
}

// Links of the associated graph:

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

link Pupilas_Dilatadas Heridas_Internas;

//Network Relationships:

relation Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4537037037037037 0.061224489795918366 0.46296296296296297 0.3469387755102041 0.08333333333333333 0.5918367346938775 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5247524752475248 0.4752475247524752 );
}

relation Heridas_Internas Colision Pupilas_Dilatadas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2571428571428571 0.6 0.09090909090909091 0.35714285714285715 0.23809523809523808 0.14285714285714285 0.09090909090909091 0.29411764705882354 0.2 0.1111111111111111 0.07692307692307693 0.2 0.6285714285714286 0.2 0.8181818181818182 0.5714285714285714 0.14285714285714285 0.14285714285714285 0.2727272727272727 0.20588235294117646 0.3 0.3333333333333333 0.5384615384615384 0.4 0.11428571428571428 0.2 0.09090909090909091 0.07142857142857142 0.6190476190476191 0.7142857142857143 0.6363636363636364 0.5 0.5 0.5555555555555556 0.38461538461538464 0.4 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7064220183486238 0.030303030303030304 0.06422018348623854 0.0707070707070707 0.12844036697247707 0.1414141414141414 0.10091743119266056 0.7575757575757576 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7333333333333333 0.8055555555555556 0.16666666666666666 0.6 0.3333333333333333 0.3333333333333333 0.6923076923076923 0.6 0.08571428571428572 0.36363636363636365 0.2222222222222222 0.13636363636363635 0.5 0.6666666666666666 0.42857142857142855 0.18181818181818182 0.2222222222222222 0.10714285714285714 0.13333333333333333 0.027777777777777776 0.16666666666666666 0.2 0.16666666666666666 0.3333333333333333 0.07692307692307693 0.2 0.2571428571428571 0.36363636363636365 0.1111111111111111 0.045454545454545456 0.25 0.16666666666666666 0.14285714285714285 0.18181818181818182 0.1111111111111111 0.03571428571428571 0.13333333333333333 0.16666666666666666 0.6666666666666666 0.2 0.5 0.3333333333333333 0.23076923076923078 0.2 0.6571428571428571 0.2727272727272727 0.6666666666666666 0.8181818181818182 0.25 0.16666666666666666 0.42857142857142855 0.6363636363636364 0.6666666666666666 0.8571428571428571 );
}

}
