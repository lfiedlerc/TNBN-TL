// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/500pct aux/no refinement/partition1_model.elv" {

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
states = ("Default" "[39-59]" "[20-39]" "[0-20]");
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

link Colision Pupilas_Dilatadas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.24664162375999776 0.4066088560596496 0.3467495201803527 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8447306819193415 0.6088903885935399 0.09746768486210908 0.15526931808065841 0.3911096114064601 0.902532315137891 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.33786095595358334 0.2629960072069056 0.1249469674890285 0.5550374095677805 0.1332059445761758 0.5096465149273671 0.10710163447863637 0.6037980482169186 0.36540651758360426 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.21428571428571427 0.2 0.5625 0.18181818181818182 0.4 0.058823529411764705 0.21428571428571427 0.2 0.125 0.18181818181818182 0.2 0.17647058823529413 0.2857142857142857 0.4 0.25 0.09090909090909091 0.2 0.058823529411764705 0.2857142857142857 0.2 0.0625 0.5454545454545454 0.2 0.7058823529411765 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6666666666666666 0.5 0.07692307692307693 0.16666666666666666 0.15384615384615385 0.14285714285714285 0.08333333333333333 0.1 0.15384615384615385 0.16666666666666666 0.15384615384615385 0.07142857142857142 0.08333333333333333 0.1 0.15384615384615385 0.16666666666666666 0.15384615384615385 0.07142857142857142 0.16666666666666666 0.3 0.6153846153846154 0.5 0.5384615384615384 0.7142857142857143 );
}

}
