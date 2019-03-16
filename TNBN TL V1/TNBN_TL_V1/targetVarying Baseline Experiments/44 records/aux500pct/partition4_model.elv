// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/44 records/aux500pct/partition4_model.elv" {

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
states = ("Default" "[34-58]" "[14-34]" "[0-14]");
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
states = ("Default" "[18-44]" "[0-18]");
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
values= table (0.1702127659574468 0.46808510638297873 0.3617021276595745 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7777777777777778 0.5652173913043478 0.05555555555555555 0.2222222222222222 0.43478260869565216 0.9444444444444444 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7 0.20833333333333334 0.10526315789473684 0.2 0.125 0.47368421052631576 0.1 0.6666666666666666 0.42105263157894735 );
}

relation Pupilas_Dilatadas Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6666666666666666 0.3333333333333333 0.6666666666666666 0.14285714285714285 0.07692307692307693 0.05555555555555555 0.08333333333333333 0.16666666666666666 0.08333333333333333 0.14285714285714285 0.15384615384615385 0.05555555555555555 0.08333333333333333 0.16666666666666666 0.08333333333333333 0.2857142857142857 0.15384615384615385 0.16666666666666666 0.16666666666666666 0.3333333333333333 0.16666666666666666 0.42857142857142855 0.6153846153846154 0.7222222222222222 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6363636363636364 0.6 0.09090909090909091 0.3333333333333333 0.16666666666666666 0.058823529411764705 0.09090909090909091 0.2 0.18181818181818182 0.3333333333333333 0.16666666666666666 0.17647058823529413 0.2727272727272727 0.2 0.7272727272727273 0.3333333333333333 0.6666666666666666 0.7647058823529411 );
}

}
