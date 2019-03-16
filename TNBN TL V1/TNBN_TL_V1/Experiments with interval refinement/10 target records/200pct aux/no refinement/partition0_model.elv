// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/200pct aux/no refinement/partition0_model.elv" {

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
states = ("Default" "[37-59]" "[18-37]" "[0-18]");
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
values= table (0.26638964138122767 0.48833061954951346 0.24527973906925893 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7943464177806403 0.44923523465210996 0.24612534500814134 0.20565358221935978 0.5507647653478901 0.7538746549918587 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.1585973301454473 0.25259916317991626 0.26598540929084863 0.6065152420800957 0.17017573221757323 0.3702660658727604 0.23488742777445706 0.5772251046025104 0.363748524836391 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2857142857142857 0.25 0.4 0.1 0.25 0.25 0.2857142857142857 0.25 0.2 0.2 0.25 0.25 0.14285714285714285 0.25 0.2 0.3 0.25 0.25 0.2857142857142857 0.25 0.2 0.4 0.25 0.25 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.25 0.16666666666666666 0.16666666666666666 0.4 0.2 0.125 0.25 0.3333333333333333 0.16666666666666666 0.2 0.4 0.125 0.25 0.3333333333333333 0.16666666666666666 0.2 0.2 0.125 0.25 0.16666666666666666 0.5 0.2 0.2 0.625 );
}

}
