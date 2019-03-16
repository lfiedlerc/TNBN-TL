// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/200pct aux/no refinement/partition4_model.elv" {

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
states = ("Default" "[42-59]" "[23-42]" "[0-23]");
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
values= table (0.26638964138122767 0.4267921580110519 0.30681820060772047 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7943464177806403 0.5317749171917925 0.14612534500814134 0.20565358221935978 0.4682250828082075 0.8538746549918588 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2687786411635784 0.20301757322175729 0.17784036047634372 0.6065152420800957 0.12059414225941421 0.41433859028001285 0.12470611675632597 0.6763882845188285 0.4078210492436433 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.42857142857142855 0.25 0.5 0.14285714285714285 0.25 0.16666666666666666 0.14285714285714285 0.25 0.16666666666666666 0.14285714285714285 0.25 0.16666666666666666 0.2857142857142857 0.25 0.16666666666666666 0.14285714285714285 0.25 0.16666666666666666 0.14285714285714285 0.25 0.16666666666666666 0.5714285714285714 0.25 0.5 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4 0.5 0.16666666666666666 0.25 0.2 0.25 0.2 0.16666666666666666 0.16666666666666666 0.25 0.2 0.25 0.2 0.16666666666666666 0.16666666666666666 0.25 0.2 0.125 0.2 0.16666666666666666 0.5 0.25 0.4 0.375 );
}

}
