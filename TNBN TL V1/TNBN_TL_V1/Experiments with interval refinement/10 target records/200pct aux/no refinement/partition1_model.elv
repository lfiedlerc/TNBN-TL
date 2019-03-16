// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/200pct aux/no refinement/partition1_model.elv" {

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
states = ("Default" "[41-59]" "[21-41]" "[0-21]");
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
states = ("Default" "[27-44]" "[13-27]" "[0-13]");
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
values= table (0.26638964138122767 0.4575613887802827 0.2760489698384897 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7943464177806403 0.660346345763221 0.17945867834147466 0.20565358221935978 0.33965365423677896 0.8205413216585253 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3789599521817095 0.2672900046490005 0.2108947537817831 0.4963339310619645 0.11141236634123663 0.31517541036369484 0.12470611675632597 0.6212976290097628 0.47392983585452203 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5714285714285714 0.25 0.5555555555555556 0.2 0.25 0.2 0.14285714285714285 0.25 0.1111111111111111 0.2 0.25 0.2 0.14285714285714285 0.25 0.2222222222222222 0.2 0.25 0.2 0.14285714285714285 0.25 0.1111111111111111 0.4 0.25 0.4 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5714285714285714 0.4 0.125 0.25 0.25 0.16666666666666666 0.14285714285714285 0.2 0.125 0.25 0.25 0.3333333333333333 0.14285714285714285 0.2 0.25 0.25 0.25 0.16666666666666666 0.14285714285714285 0.2 0.5 0.25 0.25 0.3333333333333333 );
}

}
