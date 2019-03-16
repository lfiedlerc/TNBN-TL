// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/100pct aux/no refinement/partition1_model.elv" {

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
states = ("Default" "[38-59]" "[17-38]" "[0-17]");
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
states = ("Default" "[28-44]" "[14-28]" "[0-14]");
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
values= table (0.22841384124557854 0.37281641260012116 0.3987697461543004 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7981752948100906 0.6309977074971871 0.07189189089085696 0.20182470518990936 0.3690022925028129 0.928108109109143 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2907458122120666 0.30909232224050154 0.1430314803745766 0.6667715559838536 0.08763293910385117 0.3584379358437935 0.042482631804079865 0.6032747386556472 0.4985305837816298 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6222222222222222 0.031746031746031744 0.06666666666666667 0.09523809523809523 0.1111111111111111 0.1111111111111111 0.2 0.7619047619047619 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6363636363636364 0.5384615384615384 0.25 0.4 0.2857142857142857 0.25 0.6 0.5 0.15789473684210525 0.14285714285714285 0.25 0.07692307692307693 0.25 0.25 0.16666666666666666 0.4 0.15789473684210525 0.07692307692307693 0.09090909090909091 0.15384615384615385 0.25 0.2 0.2857142857142857 0.25 0.2 0.16666666666666666 0.21052631578947367 0.2857142857142857 0.25 0.07692307692307693 0.25 0.25 0.16666666666666666 0.1 0.05263157894736842 0.11538461538461539 0.09090909090909091 0.07692307692307693 0.25 0.2 0.14285714285714285 0.25 0.1 0.16666666666666666 0.05263157894736842 0.14285714285714285 0.25 0.07692307692307693 0.25 0.25 0.16666666666666666 0.1 0.10526315789473684 0.07692307692307693 0.18181818181818182 0.23076923076923078 0.25 0.2 0.2857142857142857 0.25 0.1 0.16666666666666666 0.5789473684210527 0.42857142857142855 0.25 0.7692307692307693 0.25 0.25 0.5 0.4 0.6842105263157895 0.7307692307692307 );
}

}
