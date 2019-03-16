// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/500pct aux/no refinement/partition3_model.elv" {

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
states = ("Default" "[39-59]" "[20-39]" "[0-20]");
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
states = ("Default" "[28-44]" "[13-28]" "[0-13]");
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
values= table (0.22962034716425309 0.4236301326553943 0.3467495201803527 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8699055070941667 0.6047496018440576 0.12246768486210909 0.13009449290583325 0.39525039815594254 0.8775323151378909 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.16471889578223436 0.27802073143665074 0.12494696748902852 0.7675299379598903 0.12569358246130324 0.47075899339155625 0.06775116625787524 0.596285686102046 0.40429403911941525 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.46153846153846156 0.25 0.5882352941176471 0.08333333333333333 0.3333333333333333 0.0625 0.15384615384615385 0.25 0.058823529411764705 0.16666666666666666 0.16666666666666666 0.1875 0.15384615384615385 0.25 0.17647058823529413 0.08333333333333333 0.16666666666666666 0.0625 0.23076923076923078 0.25 0.17647058823529413 0.6666666666666666 0.3333333333333333 0.6875 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6 0.6428571428571429 0.08333333333333333 0.4 0.18181818181818182 0.125 0.2 0.07142857142857142 0.25 0.2 0.09090909090909091 0.125 0.1 0.07142857142857142 0.08333333333333333 0.2 0.18181818181818182 0.0625 0.1 0.21428571428571427 0.5833333333333334 0.2 0.5454545454545454 0.6875 );
}

}
