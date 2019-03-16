// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/100pct aux/no refinement/partition1_model.elv" {

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
states = ("Default" "[40-59]" "[19-40]" "[0-19]");
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
states = ("Default" "[27-44]" "[12-27]" "[0-12]");
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
values= table (0.24898810276179417 0.40322335331484954 0.34778854392335634 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.82754592418072 0.6191572956567752 0.09635997599723994 0.17245407581928 0.38084270434322476 0.90364002400276 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.31538262709810827 0.2853690734566934 0.12439787630533385 0.5764365680683673 0.12559013715794418 0.48806300762983024 0.1081808048335245 0.5890407893853623 0.387539116064836 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4444444444444444 0.08 0.14814814814814814 0.16 0.25925925925925924 0.08 0.14814814814814814 0.68 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5555555555555556 0.5 0.2 0.25 0.2 0.25 0.5714285714285714 0.3333333333333333 0.09090909090909091 0.2 0.25 0.2 0.25 0.25 0.2 0.2 0.16666666666666666 0.125 0.1111111111111111 0.125 0.2 0.25 0.2 0.25 0.14285714285714285 0.16666666666666666 0.18181818181818182 0.2 0.25 0.1 0.25 0.25 0.2 0.2 0.25 0.125 0.1111111111111111 0.125 0.2 0.25 0.2 0.25 0.14285714285714285 0.16666666666666666 0.18181818181818182 0.2 0.25 0.1 0.25 0.25 0.2 0.2 0.08333333333333333 0.125 0.2222222222222222 0.25 0.4 0.25 0.4 0.25 0.14285714285714285 0.3333333333333333 0.5454545454545454 0.4 0.25 0.6 0.25 0.25 0.4 0.4 0.5 0.625 );
}

}
