// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/200pct aux/no refinement/partition2_model.elv" {

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
states = ("Default" "[28-44]" "[14-28]" "[0-14]");
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
values= table (0.20288718638941095 0.3528150712680077 0.44429774234258135 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7743464177806403 0.5889177743346496 0.10326820215099847 0.22565358221935977 0.4110822256653504 0.8967317978490016 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2687786411635784 0.2966716875871687 0.09121505388277859 0.6432423457528059 0.12610320781032075 0.49184544354793963 0.0879790130836156 0.5772251046025104 0.4169395025692818 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5555555555555556 0.2 0.5454545454545454 0.1111111111111111 0.42857142857142855 0.07407407407407407 0.2222222222222222 0.2 0.09090909090909091 0.1111111111111111 0.2857142857142857 0.1111111111111111 0.1111111111111111 0.4 0.09090909090909091 0.1111111111111111 0.14285714285714285 0.07407407407407407 0.1111111111111111 0.2 0.2727272727272727 0.6666666666666666 0.14285714285714285 0.7407407407407407 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5555555555555556 0.4444444444444444 0.2222222222222222 0.2 0.2222222222222222 0.05555555555555555 0.1111111111111111 0.1111111111111111 0.2222222222222222 0.2 0.05555555555555555 0.05555555555555555 0.1111111111111111 0.1111111111111111 0.1111111111111111 0.2 0.16666666666666666 0.2222222222222222 0.2222222222222222 0.3333333333333333 0.4444444444444444 0.4 0.5555555555555556 0.6666666666666666 );
}

}
