// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/44 records/aux200pct/partition1_model.elv" {

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
states = ("Default" "[35-59]" "[16-35]" "[0-16]");
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
states = ("Default" "[16-45]" "[0-16]");
}

// Links of the associated graph:

link Colision Heridas_Internas;

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Pupilas_Dilatadas;

link Signos_Vitales Heridas_Internas;

link Signos_Vitales Pupilas_Dilatadas;

//Network Relationships:

relation Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4230769230769231 0.08333333333333333 0.5 0.3333333333333333 0.07692307692307693 0.5833333333333334 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5217391304347826 0.4782608695652174 );
}

relation Heridas_Internas Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5 0.3333333333333333 0.2857142857142857 0.5 0.25 0.125 0.25 0.2 0.14285714285714285 0.4 0.3333333333333333 0.42857142857142855 0.25 0.25 0.125 0.5 0.6 0.42857142857142855 0.1 0.3333333333333333 0.2857142857142857 0.25 0.5 0.75 0.25 0.2 0.42857142857142855 );
}

relation Pupilas_Dilatadas Herida_Cabeza Heridas_Internas Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.18181818181818182 0.25 0.2 0.5 0.25 0.3333333333333333 0.25 0.4 0.5 0.25 0.25 0.16666666666666666 0.2 0.16666666666666666 0.1 0.2 0.25 0.15384615384615385 0.45454545454545453 0.25 0.2 0.125 0.25 0.16666666666666666 0.25 0.2 0.08333333333333333 0.25 0.25 0.3333333333333333 0.2 0.16666666666666666 0.2 0.2 0.25 0.15384615384615385 0.2727272727272727 0.25 0.2 0.25 0.25 0.3333333333333333 0.25 0.2 0.25 0.25 0.25 0.16666666666666666 0.2 0.16666666666666666 0.2 0.2 0.25 0.07692307692307693 0.09090909090909091 0.25 0.4 0.125 0.25 0.16666666666666666 0.25 0.2 0.16666666666666666 0.25 0.25 0.3333333333333333 0.4 0.5 0.5 0.4 0.25 0.6153846153846154 );
}

relation Signos_Vitales Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.46153846153846156 0.125 0.07692307692307693 0.125 0.46153846153846156 0.75 );
}

}
