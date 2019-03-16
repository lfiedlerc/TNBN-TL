// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/100pct aux/no refinement/partition4_model.elv" {

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
states = ("Default" "[40-59]" "[19-40]" "[0-19]");
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
states = ("Default" "[29-44]" "[15-29]" "[0-15]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.21494554957030482 0.4202446299105942 0.36480982051910105 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8001954968302927 0.5976252045594668 0.06858219821946215 0.19980450316970733 0.40237479544053323 0.9314178017805378 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.49482076218477883 0.2728484699319058 0.11621102966621576 0.4253307701006447 0.11807777504307163 0.4512221977537988 0.07984846771457652 0.6090737550250226 0.4325667725799855 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7272727272727273 0.03333333333333333 0.045454545454545456 0.03333333333333333 0.045454545454545456 0.2 0.18181818181818182 0.7333333333333333 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5555555555555556 0.4 0.25 0.2 0.25 0.25 0.42857142857142855 0.4 0.08333333333333333 0.2 0.2 0.09090909090909091 0.25 0.25 0.25 0.4 0.16666666666666666 0.09090909090909091 0.1111111111111111 0.2 0.25 0.4 0.25 0.25 0.14285714285714285 0.2 0.16666666666666666 0.2 0.2 0.09090909090909091 0.25 0.25 0.25 0.2 0.08333333333333333 0.18181818181818182 0.1111111111111111 0.2 0.25 0.2 0.25 0.25 0.14285714285714285 0.2 0.16666666666666666 0.2 0.2 0.18181818181818182 0.25 0.25 0.25 0.2 0.16666666666666666 0.09090909090909091 0.2222222222222222 0.2 0.25 0.2 0.25 0.25 0.2857142857142857 0.2 0.5833333333333334 0.4 0.4 0.6363636363636364 0.25 0.25 0.25 0.2 0.5833333333333334 0.6363636363636364 );
}

}
