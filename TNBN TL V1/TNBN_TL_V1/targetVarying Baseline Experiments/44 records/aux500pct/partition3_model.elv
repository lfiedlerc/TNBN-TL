// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/44 records/aux500pct/partition3_model.elv" {

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
states = ("Default" "[32-55]" "[15-32]" "[0-15]");
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
values= table (0.2127659574468085 0.46808510638297873 0.3191489361702128 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.9090909090909091 0.6086956521739131 0.1875 0.09090909090909091 0.391304347826087 0.8125 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.16666666666666666 0.25 0.11764705882352941 0.75 0.125 0.47058823529411764 0.08333333333333333 0.625 0.4117647058823529 );
}

relation Pupilas_Dilatadas Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4 0.5 0.5833333333333334 0.2 0.09090909090909091 0.125 0.1 0.21428571428571427 0.08333333333333333 0.2 0.18181818181818182 0.125 0.2 0.07142857142857142 0.25 0.2 0.09090909090909091 0.125 0.3 0.21428571428571427 0.08333333333333333 0.4 0.6363636363636364 0.625 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6666666666666666 0.6923076923076923 0.09090909090909091 0.5 0.2 0.13333333333333333 0.2222222222222222 0.07692307692307693 0.2727272727272727 0.25 0.1 0.13333333333333333 0.1111111111111111 0.23076923076923078 0.6363636363636364 0.25 0.7 0.7333333333333333 );
}

}
