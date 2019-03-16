// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/100pct aux/no refinement/partition2_model.elv" {

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
states = ("Default" "[40-59]" "[20-40]" "[0-20]");
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
states = ("Default" "[26-44]" "[11-26]" "[0-11]");
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
values= table (0.23916813549501842 0.41762597197278734 0.34320589253219436 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7890843857191816 0.5429668194662991 0.12635997599723994 0.21091561428081845 0.4570331805337009 0.8736400240027601 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.29649440235214297 0.38302978095003687 0.156804144251843 0.4253307701006446 0.1180777750430716 0.3584379358437936 0.27817482754721246 0.4988924440068914 0.48475791990436345 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.375 0.2 0.125 0.1 0.25 0.1 0.25 0.6 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4 0.25 0.2 0.25 0.25 0.25 0.3333333333333333 0.25 0.25 0.25 0.25 0.14285714285714285 0.25 0.25 0.25 0.25 0.2 0.16666666666666666 0.2 0.25 0.2 0.25 0.25 0.25 0.16666666666666666 0.25 0.25 0.25 0.25 0.14285714285714285 0.25 0.25 0.25 0.25 0.2 0.16666666666666666 0.2 0.25 0.4 0.25 0.25 0.25 0.16666666666666666 0.25 0.25 0.25 0.25 0.14285714285714285 0.25 0.25 0.25 0.25 0.2 0.16666666666666666 0.2 0.25 0.2 0.25 0.25 0.25 0.3333333333333333 0.25 0.25 0.25 0.25 0.5714285714285714 0.25 0.25 0.25 0.25 0.4 0.5 );
}

}
