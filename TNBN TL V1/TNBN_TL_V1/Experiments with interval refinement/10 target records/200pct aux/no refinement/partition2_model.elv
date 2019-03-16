// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/200pct aux/no refinement/partition2_model.elv" {

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
states = ("Default" "[41-59]" "[22-41]" "[0-22]");
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
states = ("Default" "[29-44]" "[15-29]" "[0-15]");
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
values= table (0.23562041061199687 0.4267921580110519 0.33758743137695124 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7743464177806403 0.5317749171917925 0.12612534500814132 0.22565358221935977 0.4682250828082075 0.8738746549918586 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.31285116557083087 0.368289539748954 0.15580409827271752 0.4081888822474596 0.12059414225941424 0.3702660658727604 0.2789599521817095 0.5111163179916318 0.47392983585452203 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3333333333333333 0.25 0.3333333333333333 0.2857142857142857 0.25 0.14285714285714285 0.16666666666666666 0.25 0.16666666666666666 0.14285714285714285 0.25 0.14285714285714285 0.3333333333333333 0.25 0.16666666666666666 0.14285714285714285 0.25 0.14285714285714285 0.16666666666666666 0.25 0.3333333333333333 0.42857142857142855 0.25 0.5714285714285714 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.42857142857142855 0.25 0.2 0.25 0.2 0.1111111111111111 0.14285714285714285 0.25 0.2 0.25 0.2 0.1111111111111111 0.14285714285714285 0.25 0.4 0.25 0.2 0.1111111111111111 0.2857142857142857 0.25 0.2 0.25 0.4 0.6666666666666666 );
}

}
