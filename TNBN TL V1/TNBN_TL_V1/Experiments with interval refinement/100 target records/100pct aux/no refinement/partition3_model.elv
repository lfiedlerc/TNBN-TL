// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/100pct aux/no refinement/partition3_model.elv" {

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
values= table (0.23229733639120959 0.3922338883282765 0.375468775280514 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8716930813713555 0.5620144385139181 0.09514046380211799 0.12830691862864455 0.4379855614860819 0.904859536197882 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.22487655019035774 0.25811492252831847 0.1253237696752341 0.7062931131968788 0.14306074672741528 0.4213986849970114 0.06883033661276339 0.5988243307442662 0.4532775453277546 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5833333333333334 0.08333333333333333 0.125 0.06666666666666667 0.1875 0.15 0.10416666666666667 0.7 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4 0.8333333333333334 0.2 0.25 0.25 0.25 0.5555555555555556 0.42857142857142855 0.2 0.5 0.14285714285714285 0.05 0.5 0.2 0.2 0.3333333333333333 0.1 0.09523809523809523 0.2 0.05555555555555555 0.2 0.25 0.25 0.25 0.2222222222222222 0.14285714285714285 0.2 0.16666666666666666 0.14285714285714285 0.1 0.16666666666666666 0.2 0.2 0.16666666666666666 0.2 0.09523809523809523 0.1 0.05555555555555555 0.2 0.25 0.25 0.25 0.1111111111111111 0.2857142857142857 0.13333333333333333 0.16666666666666666 0.14285714285714285 0.1 0.16666666666666666 0.2 0.2 0.16666666666666666 0.1 0.09523809523809523 0.3 0.05555555555555555 0.4 0.25 0.25 0.25 0.1111111111111111 0.14285714285714285 0.4666666666666667 0.16666666666666666 0.5714285714285714 0.75 0.16666666666666666 0.4 0.4 0.3333333333333333 0.6 0.7142857142857143 );
}

}
