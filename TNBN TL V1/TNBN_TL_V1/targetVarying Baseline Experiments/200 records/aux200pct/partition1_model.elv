// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/200 records/aux200pct/partition1_model.elv" {

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
states = ("Default" "[34-57]" "[14-34]" "[0-14]");
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
states = ("Default" "[22-44]" "[0-22]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Pupilas_Dilatadas Signos_Vitales;

link Signos_Vitales Heridas_Internas;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.32019704433497537 0.35467980295566504 0.3251231527093596 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.9393939393939394 0.6438356164383562 0.14925373134328357 0.06060606060606061 0.3561643835616438 0.8507462686567164 );
}

relation Heridas_Internas Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.35185185185185186 0.2 0.21428571428571427 0.47368421052631576 0.15384615384615385 0.0625 0.375 0.3333333333333333 0.06521739130434782 0.6111111111111112 0.4 0.5714285714285714 0.3684210526315789 0.07692307692307693 0.125 0.375 0.5 0.30434782608695654 0.037037037037037035 0.4 0.21428571428571427 0.15789473684210525 0.7692307692307693 0.8125 0.25 0.16666666666666666 0.6304347826086957 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.725 0.10227272727272728 0.09166666666666666 0.045454545454545456 0.075 0.25 0.10833333333333334 0.6022727272727273 );
}

relation Signos_Vitales Herida_Cabeza Pupilas_Dilatadas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.550561797752809 0.5384615384615384 0.36363636363636365 0.6666666666666666 0.18181818181818182 0.16666666666666666 0.20833333333333334 0.18181818181818182 0.056179775280898875 0.15384615384615385 0.36363636363636365 0.06666666666666667 0.18181818181818182 0.3333333333333333 0.16666666666666666 0.16363636363636364 0.39325842696629215 0.3076923076923077 0.2727272727272727 0.26666666666666666 0.6363636363636364 0.5 0.625 0.6545454545454545 );
}

}
