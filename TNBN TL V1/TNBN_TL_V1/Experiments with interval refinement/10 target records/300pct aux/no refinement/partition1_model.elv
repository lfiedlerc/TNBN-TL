// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/300pct aux/no refinement/partition1_model.elv" {

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
states = ("Default" "[39-59]" "[19-39]" "[0-19]");
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
states = ("Default" "[27-44]" "[12-27]" "[0-12]");
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
values= table (0.26987825880062344 0.4597430223733793 0.2703787188259973 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8426320144523862 0.6672698901726675 0.17503691068204388 0.15736798554761383 0.3327301098273326 0.8249630893179561 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.36560380897417394 0.27008293216958357 0.20835946742038697 0.5096065983744529 0.11791364856555842 0.31897215628051734 0.12478959265137303 0.612003419264858 0.4726683762990957 );
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
