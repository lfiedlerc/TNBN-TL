// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/300pct aux/no refinement/partition3_model.elv" {

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
states = ("Default" "[30-44]" "[16-30]" "[0-16]");
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
values= table (0.17757056649293113 0.49051225314261004 0.33191718036445883 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7226320144523861 0.6783810012837785 0.20170357734871056 0.2773679855476138 0.32161899871622146 0.7982964226512894 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2554224979560429 0.18928330408962074 0.15326881191132144 0.509606598374453 0.11056822783101633 0.3740628117895829 0.23497090366950418 0.7001484680793629 0.4726683762990957 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.25 0.25 0.6 0.2 0.2 0.16666666666666666 0.25 0.25 0.2 0.2 0.4 0.16666666666666666 0.25 0.25 0.1 0.2 0.2 0.16666666666666666 0.25 0.25 0.1 0.4 0.2 0.5 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.25 0.25 0.09090909090909091 0.25 0.4 0.3333333333333333 0.25 0.25 0.36363636363636365 0.25 0.2 0.16666666666666666 0.25 0.25 0.09090909090909091 0.25 0.2 0.16666666666666666 0.25 0.25 0.45454545454545453 0.25 0.2 0.3333333333333333 );
}

}
