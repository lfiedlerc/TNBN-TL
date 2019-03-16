// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/440 records/aux100pct/partition3_model.elv" {

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
states = ("Default" "[34-59]" "[15-34]" "[0-15]");
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
states = ("Default" "[20-44]" "[0-20]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Signos_Vitales Herida_Cabeza;

link Signos_Vitales Heridas_Internas;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.21896162528216703 0.39954853273137697 0.38148984198645597 );
}

relation Herida_Cabeza Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.9466666666666667 0.4 0.6363636363636364 0.8372093023255814 0.5555555555555556 0.5625 0.5555555555555556 0.12 0.06557377049180328 0.05333333333333334 0.6 0.36363636363636365 0.16279069767441862 0.4444444444444444 0.4375 0.4444444444444444 0.88 0.9344262295081968 );
}

relation Heridas_Internas Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.42105263157894735 0.5 0.21739130434782608 0.5909090909090909 0.25 0.09734513274336283 0.25 0.07692307692307693 0.07317073170731707 0.5657894736842105 0.3333333333333333 0.6086956521739131 0.22727272727272727 0.07142857142857142 0.1415929203539823 0.5714285714285714 0.3076923076923077 0.36585365853658536 0.013157894736842105 0.16666666666666666 0.17391304347826086 0.18181818181818182 0.6785714285714286 0.7610619469026548 0.17857142857142858 0.6153846153846154 0.5609756097560976 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6441441441441441 0.04424778761061947 0.12162162162162163 0.07964601769911504 0.11711711711711711 0.1415929203539823 0.11711711711711711 0.7345132743362832 );
}

relation Signos_Vitales Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7474747474747475 0.2346368715083799 0.15204678362573099 0.04040404040404041 0.1452513966480447 0.14035087719298245 0.21212121212121213 0.6201117318435754 0.7076023391812866 );
}

}
