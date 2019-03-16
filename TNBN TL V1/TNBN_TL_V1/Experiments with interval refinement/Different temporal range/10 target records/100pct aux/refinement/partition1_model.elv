// Bayesian Network 
//   Elvira format 

bnet "Network" {

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
num-states = 3;
states = ("Default" "[37-62]" "[0-37]");
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
states = ("Default" "[34-48]" "[16-34]" "[0-16]");
}

// Links of the associated graph:

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Colision;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5 0.6 0.125 0.4444444444444444 0.3333333333333333 0.14285714285714285 0.3333333333333333 0.20000000000000004 0.7500000000000001 0.2222222222222222 0.3333333333333333 0.42857142857142855 0.16666666666666666 0.20000000000000004 0.125 0.3333333333333333 0.3333333333333333 0.42857142857142855 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.44176978750730117 0.5582302124926988 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2897474089878769 0.3257359342520982 0.3845166567600249 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6205012866365449 0.08645094333635703 0.15579420864394472 0.35256370843522256 0.22170714307022904 0.5590374824359607 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8349996875129763 0.8192478887614102 0.07295492577654107 0.17795357758190827 0.13391378835234982 0.09304772291339966 0.014831488762878538 0.01882834492068644 0.05657164823017171 0.07124402327623461 0.07324196293003385 0.07997174387136356 0.07786531600511232 0.058367869254127965 0.3430796731378155 0.25940131551859785 0.3240956859653998 0.338062371819855 0.07044957162367306 0.10167306257170679 0.5255688609770791 0.4895743137956635 0.4669175136789658 0.48710062176194163 );
}

}
