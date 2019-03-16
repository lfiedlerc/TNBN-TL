// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/200pct aux/no refinement/partition2_model.elv" {

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

link Colision Pupilas_Dilatadas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.23263310665381914 0.43246803553158963 0.3348988578145913 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7910130844473069 0.592346345763221 0.10862534500814133 0.2089869155526931 0.407653654236779 0.8913746549918588 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.23352062163777645 0.26296916892279926 0.18585354673220783 0.7255110579796771 0.1286957092460415 0.3502331002331003 0.04096832038254632 0.6083351218311592 0.46391335303469194 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7272727272727273 0.125 0.6875 0.041666666666666664 0.25 0.06666666666666667 0.045454545454545456 0.125 0.0625 0.08333333333333333 0.25 0.06666666666666667 0.045454545454545456 0.125 0.125 0.16666666666666666 0.125 0.13333333333333333 0.18181818181818182 0.625 0.125 0.7083333333333334 0.375 0.7333333333333333 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7333333333333333 0.6521739130434783 0.08333333333333333 0.4 0.0625 0.12903225806451613 0.06666666666666667 0.043478260869565216 0.125 0.2 0.0625 0.0967741935483871 0.06666666666666667 0.043478260869565216 0.25 0.13333333333333333 0.1875 0.06451612903225806 0.13333333333333333 0.2608695652173913 0.5416666666666666 0.26666666666666666 0.6875 0.7096774193548387 );
}

}
