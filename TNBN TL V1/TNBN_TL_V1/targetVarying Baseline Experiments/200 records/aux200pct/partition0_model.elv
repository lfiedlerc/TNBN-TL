// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/200 records/aux200pct/partition0_model.elv" {

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
states = ("Default" "[32-58]" "[13-32]" "[0-13]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[17-44]" "[0-17]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Colision;

link Heridas_Internas Signos_Vitales;

link Pupilas_Dilatadas Signos_Vitales;

//Network Relationships:

relation Colision Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3695652173913043 0.42105263157894735 0.022988505747126436 0.45652173913043476 0.19736842105263158 0.5517241379310345 0.17391304347826086 0.3815789473684211 0.42528735632183906 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.76 0.6265060240963856 0.1095890410958904 0.24 0.37349397590361444 0.8904109589041096 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.21674876847290642 0.3645320197044335 0.4187192118226601 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7171717171717171 0.06422018348623854 0.06060606060606061 0.05504587155963303 0.13131313131313133 0.22935779816513763 0.09090909090909091 0.6513761467889908 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas Pupilas_Dilatadas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8333333333333334 0.3333333333333333 0.7777777777777778 0.6 0.7407407407407407 0.5 0.6666666666666666 0.6666666666666666 0.03571428571428571 0.2 0.16666666666666666 0.16666666666666666 0.25 0.25 0.2 0.46153846153846156 0.25 0.5 0.21428571428571427 0.07142857142857142 0.14285714285714285 0.25 0.07142857142857142 0.02631578947368421 0.08333333333333333 0.3333333333333333 0.1111111111111111 0.2 0.07407407407407407 0.3333333333333333 0.16666666666666666 0.16666666666666666 0.35714285714285715 0.6 0.3333333333333333 0.3333333333333333 0.25 0.25 0.4 0.15384615384615385 0.25 0.3333333333333333 0.14285714285714285 0.14285714285714285 0.42857142857142855 0.25 0.21428571428571427 0.10526315789473684 0.08333333333333333 0.3333333333333333 0.1111111111111111 0.2 0.18518518518518517 0.16666666666666666 0.16666666666666666 0.16666666666666666 0.6071428571428571 0.2 0.5 0.5 0.5 0.5 0.4 0.38461538461538464 0.5 0.16666666666666666 0.6428571428571429 0.7857142857142857 0.42857142857142855 0.5 0.7142857142857143 0.868421052631579 );
}

}
