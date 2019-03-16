// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/500pct aux/no refinement/partition1_model.elv" {

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
values= table (0.2675908872624527 0.45178070548681815 0.28062840725072913 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8262691434578031 0.6612713409744924 0.18080101819544242 0.1737308565421969 0.33872865902550775 0.8191989818045575 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3850815178184966 0.25965717960029555 0.2124438909446032 0.4920766604145626 0.11651180654312565 0.324930787632265 0.12284182176694079 0.6238310138565788 0.4626253214231317 );
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
