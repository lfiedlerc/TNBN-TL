// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/100pct aux/no refinement/partition3_model.elv" {

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
states = ("Default" "[28-44]" "[13-28]" "[0-13]");
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
values= table (0.17762967395655688 0.4791644335112489 0.34320589253219436 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6890843857191815 0.6826493591488387 0.20635997599723996 0.3109156142808185 0.31735064085116127 0.79364002400276 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2524218779448905 0.20123061777012058 0.156804144251843 0.5134758189151495 0.10155057839035195 0.3584379358437936 0.23410230313996003 0.6972188038395275 0.48475791990436345 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5454545454545454 0.14285714285714285 0.2727272727272727 0.14285714285714285 0.09090909090909091 0.14285714285714285 0.09090909090909091 0.5714285714285714 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.1 0.25 0.25 0.2 0.25 0.25 0.2 0.25 0.4 0.4 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.3 0.25 0.25 0.2 0.25 0.25 0.4 0.25 0.2 0.2 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.1 0.25 0.25 0.2 0.25 0.25 0.2 0.25 0.2 0.2 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.5 0.25 0.25 0.4 0.25 0.25 0.2 0.25 0.2 0.2 );
}

}
