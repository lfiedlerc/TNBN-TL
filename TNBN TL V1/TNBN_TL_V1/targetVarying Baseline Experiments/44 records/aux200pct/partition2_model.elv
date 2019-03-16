// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/44 records/aux200pct/partition2_model.elv" {

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
states = ("Default" "[35-60]" "[15-35]" "[0-15]");
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
values= table (0.3333333333333333 0.0625 0.4444444444444444 0.1875 0.2222222222222222 0.75 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.34782608695652173 0.6521739130434783 );
}

relation Heridas_Internas Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5 0.25 0.2 0.6 0.25 0.16666666666666666 0.1111111111111111 0.25 0.09090909090909091 0.3333333333333333 0.5 0.6 0.2 0.25 0.16666666666666666 0.6666666666666666 0.25 0.45454545454545453 0.16666666666666666 0.25 0.2 0.2 0.5 0.6666666666666666 0.2222222222222222 0.5 0.45454545454545453 );
}

relation Pupilas_Dilatadas Herida_Cabeza Heridas_Internas Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.625 0.25 0.4 0.2857142857142857 0.25 0.5 0.4 0.2 0.42857142857142855 0.25 0.25 0.2 0.14285714285714285 0.2 0.07142857142857142 0.25 0.2 0.11764705882352941 0.125 0.25 0.2 0.42857142857142855 0.25 0.16666666666666666 0.2 0.2 0.14285714285714285 0.25 0.25 0.2 0.2857142857142857 0.4 0.14285714285714285 0.25 0.4 0.058823529411764705 0.125 0.25 0.2 0.14285714285714285 0.25 0.16666666666666666 0.2 0.2 0.14285714285714285 0.25 0.25 0.2 0.14285714285714285 0.2 0.07142857142857142 0.25 0.2 0.23529411764705882 0.125 0.25 0.2 0.14285714285714285 0.25 0.16666666666666666 0.2 0.4 0.2857142857142857 0.25 0.25 0.4 0.42857142857142855 0.2 0.7142857142857143 0.25 0.2 0.5882352941176471 );
}

relation Signos_Vitales Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5 0.125 0.1111111111111111 0.09375 0.3888888888888889 0.78125 );
}

}
