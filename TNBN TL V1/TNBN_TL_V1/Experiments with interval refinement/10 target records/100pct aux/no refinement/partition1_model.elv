// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/100pct aux/no refinement/partition1_model.elv" {

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
states = ("Default" "[29-44]" "[14-29]" "[0-14]");
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
values= table (0.26993736626424913 0.448395202742018 0.28166743099373276 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8090843857191816 0.6715382480377277 0.17969330933057326 0.19091561428081846 0.32846175196227234 0.8203066906694267 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3626031889630216 0.2820302458500834 0.21189479976090855 0.5134758189151495 0.10889599912489402 0.303347280334728 0.12392099212182893 0.6090737550250225 0.48475791990436345 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6666666666666666 0.16666666666666666 0.08333333333333333 0.16666666666666666 0.16666666666666666 0.16666666666666666 0.08333333333333333 0.5 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5 0.4 0.25 0.25 0.25 0.25 0.4 0.25 0.125 0.25 0.25 0.2 0.25 0.25 0.25 0.25 0.25 0.2 0.16666666666666666 0.2 0.25 0.25 0.25 0.25 0.2 0.25 0.125 0.25 0.25 0.4 0.25 0.25 0.25 0.25 0.25 0.2 0.16666666666666666 0.2 0.25 0.25 0.25 0.25 0.2 0.25 0.25 0.25 0.25 0.2 0.25 0.25 0.25 0.25 0.25 0.2 0.16666666666666666 0.2 0.25 0.25 0.25 0.25 0.2 0.25 0.5 0.25 0.25 0.2 0.25 0.25 0.25 0.25 0.25 0.4 );
}

}
