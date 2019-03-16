// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/44 records/aux500pct/partition2_model.elv" {

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
states = ("Default" "[16-43]" "[0-16]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Pupilas_Dilatadas;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.14893617021276595 0.2765957446808511 0.574468085106383 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.75 0.5714285714285714 0.14285714285714285 0.25 0.42857142857142855 0.8571428571428571 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3333333333333333 0.26666666666666666 0.06896551724137931 0.5555555555555556 0.13333333333333333 0.5172413793103449 0.1111111111111111 0.6 0.41379310344827586 );
}

relation Pupilas_Dilatadas Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6666666666666666 0.4444444444444444 0.4444444444444444 0.2 0.05555555555555555 0.1111111111111111 0.1111111111111111 0.3333333333333333 0.1111111111111111 0.2 0.2222222222222222 0.1111111111111111 0.1111111111111111 0.1111111111111111 0.1111111111111111 0.2 0.05555555555555555 0.2222222222222222 0.1111111111111111 0.1111111111111111 0.3333333333333333 0.4 0.6666666666666666 0.5555555555555556 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.625 0.5 0.25 0.25 0.23529411764705882 0.058823529411764705 0.125 0.125 0.25 0.25 0.11764705882352941 0.17647058823529413 0.25 0.375 0.5 0.5 0.6470588235294118 0.7647058823529411 );
}

}
