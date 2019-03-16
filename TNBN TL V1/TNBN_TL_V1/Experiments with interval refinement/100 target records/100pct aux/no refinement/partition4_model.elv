// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/100pct aux/no refinement/partition4_model.elv" {

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
states = ("Default" "[39-59]" "[18-39]" "[0-18]");
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
values= table (0.2672487927018892 0.38058340289138326 0.35216780440672757 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8015843857191816 0.627948504447984 0.08064569028295422 0.19841561428081844 0.372051495552016 0.9193543097170458 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.27245484358455074 0.2012306177701206 0.06498638507006707 0.6537065783927708 0.15113216834851093 0.3768014876801488 0.07383857802267846 0.6476372138813684 0.5582121272497842 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6851851851851852 0.1111111111111111 0.07407407407407407 0.05555555555555555 0.12962962962962962 0.2222222222222222 0.1111111111111111 0.6111111111111112 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7142857142857143 0.6470588235294118 0.2 0.2 0.25 0.2 0.5 0.625 0.09090909090909091 0.2 0.16666666666666666 0.07142857142857142 0.25 0.3333333333333333 0.25 0.25 0.2857142857142857 0.12 0.14285714285714285 0.11764705882352941 0.4 0.2 0.125 0.4 0.16666666666666666 0.125 0.13636363636363635 0.2 0.16666666666666666 0.14285714285714285 0.25 0.16666666666666666 0.25 0.25 0.07142857142857142 0.08 0.07142857142857142 0.058823529411764705 0.2 0.2 0.125 0.2 0.16666666666666666 0.125 0.13636363636363635 0.4 0.3333333333333333 0.14285714285714285 0.25 0.16666666666666666 0.25 0.25 0.14285714285714285 0.08 0.07142857142857142 0.17647058823529413 0.2 0.4 0.5 0.2 0.16666666666666666 0.125 0.6363636363636364 0.2 0.3333333333333333 0.6428571428571429 0.25 0.3333333333333333 0.25 0.25 0.5 0.72 );
}

}
