// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/44 records/aux500pct/partition0_model.elv" {

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
states = ("Default" "[36-60]" "[14-36]" "[0-14]");
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

link Heridas_Internas Pupilas_Dilatadas;

link Heridas_Internas Signos_Vitales;

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

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.17647058823529413 0.17647058823529413 0.10526315789473684 0.7647058823529411 0.23529411764705882 0.42105263157894735 0.058823529411764705 0.5882352941176471 0.47368421052631576 );
}

relation Pupilas_Dilatadas Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5 0.5 0.7272727272727273 0.2 0.08333333333333333 0.21428571428571427 0.25 0.1111111111111111 0.09090909090909091 0.4 0.25 0.14285714285714285 0.125 0.1111111111111111 0.09090909090909091 0.2 0.25 0.07142857142857142 0.125 0.2777777777777778 0.09090909090909091 0.2 0.4166666666666667 0.5714285714285714 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.42857142857142855 0.7058823529411765 0.1 0.25 0.09090909090909091 0.07692307692307693 0.2857142857142857 0.058823529411764705 0.2 0.25 0.18181818181818182 0.3076923076923077 0.2857142857142857 0.23529411764705882 0.7 0.5 0.7272727272727273 0.6153846153846154 );
}

}
