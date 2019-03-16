// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/44 records/aux200pct/partition3_model.elv" {

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
states = ("Default" "[32-59]" "[15-32]" "[0-15]");
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
states = ("Default" "[17-43]" "[0-17]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

link Pupilas_Dilatadas Signos_Vitales;

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

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5714285714285714 0.041666666666666664 0.10714285714285714 0.16666666666666666 0.14285714285714285 0.08333333333333333 0.17857142857142858 0.7083333333333334 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas Pupilas_Dilatadas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6666666666666666 0.3333333333333333 0.25 0.6 0.6666666666666666 0.4 0.3333333333333333 0.6 0.1111111111111111 0.3333333333333333 0.2 0.3333333333333333 0.3333333333333333 0.3333333333333333 0.3333333333333333 0.5 0.3333333333333333 0.25 0.3333333333333333 0.2222222222222222 0.3333333333333333 0.4 0.25 0.08333333333333333 0.16666666666666666 0.3333333333333333 0.5 0.2 0.1111111111111111 0.2 0.3333333333333333 0.2 0.3333333333333333 0.3333333333333333 0.2 0.3333333333333333 0.3333333333333333 0.3333333333333333 0.3333333333333333 0.25 0.3333333333333333 0.25 0.3333333333333333 0.1111111111111111 0.3333333333333333 0.2 0.25 0.16666666666666666 0.16666666666666666 0.3333333333333333 0.25 0.2 0.2222222222222222 0.4 0.3333333333333333 0.2 0.5555555555555556 0.3333333333333333 0.6 0.3333333333333333 0.3333333333333333 0.3333333333333333 0.3333333333333333 0.25 0.3333333333333333 0.5 0.3333333333333333 0.6666666666666666 0.3333333333333333 0.4 0.5 0.75 );
}

}
