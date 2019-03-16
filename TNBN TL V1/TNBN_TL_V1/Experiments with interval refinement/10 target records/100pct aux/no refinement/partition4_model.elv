// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/100pct aux/no refinement/partition4_model.elv" {

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
states = ("Default" "[30-44]" "[15-30]" "[0-15]");
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
values= table (0.26993736626424913 0.4176259719727872 0.31243666176296353 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8090843857191816 0.5429668194662991 0.14635997599723993 0.19091561428081846 0.4570331805337009 0.8536400240027601 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.25242187794489046 0.2177578144228402 0.1788404064554692 0.6236571299332805 0.1180777750430716 0.402510460251046 0.12392099212182892 0.6641644105340881 0.41864913329348474 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5555555555555556 0.1111111111111111 0.1111111111111111 0.1111111111111111 0.2222222222222222 0.1111111111111111 0.1111111111111111 0.6666666666666666 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4 0.5 0.25 0.25 0.25 0.25 0.25 0.25 0.16666666666666666 0.25 0.25 0.2857142857142857 0.25 0.25 0.25 0.25 0.2 0.2 0.2 0.16666666666666666 0.25 0.25 0.25 0.25 0.25 0.25 0.16666666666666666 0.25 0.25 0.14285714285714285 0.25 0.25 0.25 0.25 0.2 0.4 0.2 0.16666666666666666 0.25 0.25 0.25 0.25 0.25 0.25 0.16666666666666666 0.25 0.25 0.14285714285714285 0.25 0.25 0.25 0.25 0.2 0.2 0.2 0.16666666666666666 0.25 0.25 0.25 0.25 0.25 0.25 0.5 0.25 0.25 0.42857142857142855 0.25 0.25 0.25 0.25 0.4 0.2 );
}

}
