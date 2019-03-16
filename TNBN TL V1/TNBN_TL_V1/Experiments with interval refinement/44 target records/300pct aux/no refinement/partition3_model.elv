// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/300pct aux/no refinement/partition3_model.elv" {

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
states = ("Default" "[41-59]" "[20-41]" "[0-20]");
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
states = ("Default" "[30-44]" "[14-30]" "[0-14]");
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
values= table (0.23190771870242377 0.4315924495419554 0.3364998317556209 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8862683780887498 0.6107481510422327 0.11670357734871055 0.11373162191125019 0.3892518489577674 0.8832964226512895 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.1452411869379118 0.28844648400593875 0.12086254396481226 0.7850598759197808 0.127095424483736 0.4648003620398085 0.06969893714230752 0.5844580915103252 0.41433709399537927 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.46153846153846156 0.25 0.5882352941176471 0.08333333333333333 0.3333333333333333 0.0625 0.07692307692307693 0.25 0.058823529411764705 0.16666666666666666 0.16666666666666666 0.1875 0.23076923076923078 0.25 0.17647058823529413 0.08333333333333333 0.16666666666666666 0.0625 0.23076923076923078 0.25 0.17647058823529413 0.6666666666666666 0.3333333333333333 0.6875 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6 0.6428571428571429 0.08333333333333333 0.4 0.18181818181818182 0.125 0.2 0.07142857142857142 0.25 0.2 0.09090909090909091 0.0625 0.1 0.07142857142857142 0.08333333333333333 0.2 0.18181818181818182 0.125 0.1 0.21428571428571427 0.5833333333333334 0.2 0.5454545454545454 0.6875 );
}

}
