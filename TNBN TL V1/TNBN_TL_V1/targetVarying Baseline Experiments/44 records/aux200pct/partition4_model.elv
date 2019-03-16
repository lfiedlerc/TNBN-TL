// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/44 records/aux200pct/partition4_model.elv" {

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
states = ("Default" "[34-59]" "[14-34]" "[0-14]");
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

link Colision Heridas_Internas;

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Pupilas_Dilatadas;

link Signos_Vitales Heridas_Internas;

link Signos_Vitales Pupilas_Dilatadas;

//Network Relationships:

relation Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3333333333333333 0.06896551724137931 0.6190476190476191 0.3448275862068966 0.047619047619047616 0.5862068965517241 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.41304347826086957 0.5869565217391305 );
}

relation Heridas_Internas Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.625 0.5 0.5 0.5 0.16666666666666666 0.16666666666666666 0.4 0.2 0.06666666666666667 0.25 0.25 0.25 0.3333333333333333 0.16666666666666666 0.1111111111111111 0.4 0.4 0.4666666666666667 0.125 0.25 0.25 0.16666666666666666 0.6666666666666666 0.7222222222222222 0.2 0.4 0.4666666666666667 );
}

relation Pupilas_Dilatadas Herida_Cabeza Heridas_Internas Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6 0.25 0.5 0.3333333333333333 0.25 0.25 0.25 0.5 0.6 0.2 0.2 0.2 0.2 0.2 0.09090909090909091 0.25 0.16666666666666666 0.0625 0.1 0.25 0.16666666666666666 0.16666666666666666 0.25 0.25 0.25 0.16666666666666666 0.1 0.2 0.2 0.2 0.2 0.2 0.18181818181818182 0.25 0.16666666666666666 0.0625 0.1 0.25 0.16666666666666666 0.16666666666666666 0.25 0.25 0.25 0.16666666666666666 0.1 0.2 0.2 0.4 0.2 0.2 0.18181818181818182 0.25 0.3333333333333333 0.125 0.2 0.25 0.16666666666666666 0.3333333333333333 0.25 0.25 0.25 0.16666666666666666 0.2 0.4 0.4 0.2 0.4 0.4 0.5454545454545454 0.25 0.3333333333333333 0.75 );
}

relation Signos_Vitales Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.42857142857142855 0.10344827586206896 0.14285714285714285 0.1724137931034483 0.42857142857142855 0.7241379310344828 );
}

}
