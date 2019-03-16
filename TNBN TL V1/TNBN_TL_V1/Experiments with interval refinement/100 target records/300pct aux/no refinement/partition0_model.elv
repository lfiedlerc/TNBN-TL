// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/300pct aux/no refinement/partition0_model.elv" {

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
states = ("Default" "[38-59]" "[19-38]" "[0-19]");
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
values= table (0.24388871436447707 0.3880477273771134 0.36806355825840953 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8610935529139246 0.6409541006989832 0.09884643449156767 0.13890644708607536 0.3590458993010168 0.9011535655084323 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.20645302639242907 0.2587822848856726 0.10458404657772861 0.7299692204107151 0.11226332492360294 0.39968637249147393 0.06357775319685578 0.6289543901907243 0.49572958093079766 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.56 0.14285714285714285 0.6551724137931034 0.06666666666666667 0.4444444444444444 0.15384615384615385 0.08 0.14285714285714285 0.06896551724137931 0.06666666666666667 0.2222222222222222 0.1282051282051282 0.12 0.14285714285714285 0.13793103448275862 0.13333333333333333 0.1111111111111111 0.07692307692307693 0.24 0.5714285714285714 0.13793103448275862 0.7333333333333333 0.2222222222222222 0.6410256410256411 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7333333333333333 0.6363636363636364 0.038461538461538464 0.2222222222222222 0.14285714285714285 0.06451612903225806 0.06666666666666667 0.045454545454545456 0.15384615384615385 0.2222222222222222 0.14285714285714285 0.03225806451612903 0.06666666666666667 0.09090909090909091 0.15384615384615385 0.3333333333333333 0.09523809523809523 0.16129032258064516 0.13333333333333333 0.22727272727272727 0.6538461538461539 0.2222222222222222 0.6190476190476191 0.7419354838709677 );
}

}
