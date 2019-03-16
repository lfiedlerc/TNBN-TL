// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/200pct aux/no refinement/partition4_model.elv" {

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
states = ("Default" "[28-44]" "[13-28]" "[0-13]");
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
values= table (0.26370106781886765 0.38974958892964784 0.34654934325148445 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7868464177806402 0.6167566021734775 0.08041105929385561 0.21315358221935976 0.3832433978265226 0.9195889407061444 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.28881160680323864 0.18649037656903766 0.06398633909094159 0.6365646905395859 0.15364853556485356 0.3886296177091155 0.07462370265717547 0.6598610878661088 0.5473840431999427 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5714285714285714 0.1 0.75 0.11764705882352941 0.3333333333333333 0.14285714285714285 0.14285714285714285 0.1 0.07142857142857142 0.17647058823529413 0.16666666666666666 0.05714285714285714 0.14285714285714285 0.2 0.07142857142857142 0.11764705882352941 0.3333333333333333 0.2571428571428571 0.14285714285714285 0.6 0.10714285714285714 0.5882352941176471 0.16666666666666666 0.5428571428571428 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.75 0.6956521739130435 0.08695652173913043 0.16666666666666666 0.25 0.08333333333333333 0.125 0.08695652173913043 0.17391304347826086 0.16666666666666666 0.05 0.1111111111111111 0.0625 0.043478260869565216 0.13043478260869565 0.3333333333333333 0.15 0.08333333333333333 0.0625 0.17391304347826086 0.6086956521739131 0.3333333333333333 0.55 0.7222222222222222 );
}

}
