// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/200 records/aux500pct/partition0_model.elv" {

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
states = ("Default" "[35-57]" "[15-35]" "[0-15]");
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
states = ("Default" "[18-44]" "[0-18]");
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
values= table (0.2413793103448276 0.4039408866995074 0.35467980295566504 );
}

relation Herida_Cabeza Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.9411764705882353 0.4 0.4 0.8846153846153846 0.7142857142857143 0.44680851063829785 0.2 0.35714285714285715 0.05660377358490566 0.058823529411764705 0.6 0.6 0.11538461538461539 0.2857142857142857 0.5531914893617021 0.8 0.6428571428571429 0.9433962264150944 );
}

relation Heridas_Internas Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.37142857142857144 0.3333333333333333 0.25 0.6296296296296297 0.13333333333333333 0.08333333333333333 0.45454545454545453 0.06666666666666667 0.07407407407407407 0.6 0.5 0.625 0.3333333333333333 0.06666666666666667 0.14583333333333334 0.45454545454545453 0.3333333333333333 0.3888888888888889 0.02857142857142857 0.16666666666666666 0.125 0.037037037037037035 0.8 0.7708333333333334 0.09090909090909091 0.6 0.5370370370370371 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7171717171717171 0.07339449541284404 0.050505050505050504 0.045871559633027525 0.13131313131313133 0.14678899082568808 0.10101010101010101 0.7339449541284404 );
}

relation Signos_Vitales Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6470588235294118 0.2976190476190476 0.12162162162162163 0.0784313725490196 0.15476190476190477 0.17567567567567569 0.27450980392156865 0.5476190476190477 0.7027027027027027 );
}

}
