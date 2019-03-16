// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/200pct aux/no refinement/partition0_model.elv" {

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
states = ("Default" "[37-59]" "[17-37]" "[0-17]");
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
states = ("Default" "[28-44]" "[13-28]" "[0-13]");
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
values= table (0.24040009694508127 0.3858660937840168 0.37373380927090194 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8128079562421787 0.6340305562895369 0.10326820215099847 0.1871920437578213 0.3659694437104632 0.8967317978490016 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.21980916959996458 0.25598935736508954 0.1071193329391247 0.7166965530982268 0.10576204269928118 0.3958896265746514 0.06349427730180868 0.6382485999356292 0.4969910404862239 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.56 0.14285714285714285 0.6551724137931034 0.06666666666666667 0.4444444444444444 0.15384615384615385 0.08 0.14285714285714285 0.10344827586206896 0.06666666666666667 0.2222222222222222 0.1282051282051282 0.16 0.14285714285714285 0.10344827586206896 0.13333333333333333 0.1111111111111111 0.10256410256410256 0.2 0.5714285714285714 0.13793103448275862 0.7333333333333333 0.2222222222222222 0.6153846153846154 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7333333333333333 0.6363636363636364 0.038461538461538464 0.2222222222222222 0.14285714285714285 0.06451612903225806 0.06666666666666667 0.045454545454545456 0.15384615384615385 0.2222222222222222 0.14285714285714285 0.03225806451612903 0.06666666666666667 0.09090909090909091 0.15384615384615385 0.3333333333333333 0.09523809523809523 0.16129032258064516 0.13333333333333333 0.22727272727272727 0.6538461538461539 0.2222222222222222 0.6190476190476191 0.7419354838709677 );
}

}
