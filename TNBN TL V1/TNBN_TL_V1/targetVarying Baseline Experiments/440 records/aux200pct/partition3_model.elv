// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/440 records/aux200pct/partition3_model.elv" {

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
states = ("Default" "[35-56]" "[16-35]" "[0-16]");
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
states = ("Default" "[21-43]" "[0-21]");
}

// Links of the associated graph:

link Colision Heridas_Internas;

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Signos_Vitales Heridas_Internas;

//Network Relationships:

relation Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.38461538461538464 0.057777777777777775 0.5067873303167421 0.29333333333333333 0.1085972850678733 0.6488888888888888 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.49547511312217196 0.504524886877828 );
}

relation Heridas_Internas Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.42105263157894735 0.5 0.21739130434782608 0.5777777777777777 0.25925925925925924 0.09734513274336283 0.25 0.07692307692307693 0.07317073170731707 0.5657894736842105 0.3333333333333333 0.6086956521739131 0.2222222222222222 0.07407407407407407 0.1415929203539823 0.5714285714285714 0.3076923076923077 0.36585365853658536 0.013157894736842105 0.16666666666666666 0.17391304347826086 0.2 0.6666666666666666 0.7610619469026548 0.17857142857142858 0.6153846153846154 0.5609756097560976 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6486486486486487 0.05752212389380531 0.10810810810810811 0.061946902654867256 0.11711711711711711 0.1415929203539823 0.12612612612612611 0.7389380530973452 );
}

relation Signos_Vitales Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5429864253393665 0.09777777777777778 0.08144796380090498 0.1511111111111111 0.3755656108597285 0.7511111111111111 );
}

}
