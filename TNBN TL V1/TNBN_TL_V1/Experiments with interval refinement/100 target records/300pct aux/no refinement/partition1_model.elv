// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/300pct aux/no refinement/partition1_model.elv" {

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
states = ("Default" "[29-44]" "[14-29]" "[0-14]");
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
values= table (0.22835473378195278 0.3841642322314823 0.3874810339865649 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8317229235432952 0.6267293496321269 0.06723549224232755 0.16827707645670473 0.3732706503678731 0.9327645077576725 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.29374643222321895 0.2971450085600017 0.13949614803405502 0.662902335443157 0.09665058854451555 0.3740628117895828 0.043351232333623986 0.6062044028954827 0.486441040176362 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5 0.125 0.6666666666666666 0.125 0.3333333333333333 0.02127659574468085 0.1 0.125 0.037037037037037035 0.0625 0.3333333333333333 0.1276595744680851 0.1 0.25 0.14814814814814814 0.125 0.16666666666666666 0.10638297872340426 0.3 0.5 0.14814814814814814 0.6875 0.16666666666666666 0.7446808510638298 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7058823529411765 0.6 0.14285714285714285 0.35714285714285715 0.18181818181818182 0.05714285714285714 0.11764705882352941 0.13333333333333333 0.19047619047619047 0.14285714285714285 0.09090909090909091 0.08571428571428572 0.058823529411764705 0.06666666666666667 0.047619047619047616 0.07142857142857142 0.09090909090909091 0.05714285714285714 0.11764705882352941 0.2 0.6190476190476191 0.42857142857142855 0.6363636363636364 0.8 );
}

}
