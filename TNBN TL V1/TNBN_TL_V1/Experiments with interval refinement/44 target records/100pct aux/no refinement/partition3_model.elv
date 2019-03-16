// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/100pct aux/no refinement/partition3_model.elv" {

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
values= table (0.23196682616604952 0.4202446299105942 0.34778854392335634 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8527207493555452 0.6150165089072929 0.12135997599723994 0.14727925064445482 0.38498349109270713 0.8786400240027601 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.14224056692675938 0.3003937976864386 0.12439787630533385 0.7889290964604773 0.11807777504307163 0.4491754860940192 0.06883033661276339 0.5815284272704898 0.4264266376006469 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5714285714285714 0.041666666666666664 0.10714285714285714 0.16666666666666666 0.14285714285714285 0.041666666666666664 0.17857142857142858 0.75 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4 0.5833333333333334 0.25 0.25 0.25 0.25 0.5 0.4 0.08333333333333333 0.4 0.2 0.1 0.4 0.4 0.25 0.25 0.2 0.2 0.2 0.08333333333333333 0.25 0.25 0.25 0.25 0.25 0.2 0.25 0.2 0.2 0.1 0.2 0.2 0.25 0.25 0.1 0.1 0.2 0.08333333333333333 0.25 0.25 0.25 0.25 0.125 0.2 0.08333333333333333 0.2 0.2 0.2 0.2 0.2 0.25 0.25 0.2 0.1 0.2 0.25 0.25 0.25 0.25 0.25 0.125 0.2 0.5833333333333334 0.2 0.4 0.6 0.2 0.2 0.25 0.25 0.5 0.6 );
}

}
