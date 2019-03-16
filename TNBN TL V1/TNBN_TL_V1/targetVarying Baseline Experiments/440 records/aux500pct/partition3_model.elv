// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/440 records/aux500pct/partition3_model.elv" {

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
states = ("Default" "[34-58]" "[14-34]" "[0-14]");
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
states = ("Default" "[20-44]" "[0-20]");
}

// Links of the associated graph:

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Colision;

link Heridas_Internas Signos_Vitales;

link Signos_Vitales Colision;

//Network Relationships:

relation Colision Herida_Cabeza Heridas_Internas Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5087719298245614 0.3333333333333333 0.42857142857142855 0.6825396825396826 0.3333333333333333 0.6428571428571429 0.125 0.058823529411764705 0.05714285714285714 0.36363636363636365 0.2222222222222222 0.14285714285714285 0.1111111111111111 0.16666666666666666 0.09375 0.1111111111111111 0.045454545454545456 0.010869565217391304 0.42105263157894735 0.5 0.42857142857142855 0.15873015873015872 0.3333333333333333 0.21428571428571427 0.5 0.7647058823529411 0.8428571428571429 0.2727272727272727 0.5555555555555556 0.42857142857142855 0.1111111111111111 0.16666666666666666 0.21875 0.5555555555555556 0.3181818181818182 0.30434782608695654 0.07017543859649122 0.16666666666666666 0.14285714285714285 0.15873015873015872 0.3333333333333333 0.14285714285714285 0.375 0.17647058823529413 0.1 0.36363636363636365 0.2222222222222222 0.42857142857142855 0.7777777777777778 0.6666666666666666 0.6875 0.3333333333333333 0.6363636363636364 0.6847826086956522 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.49547511312217196 0.504524886877828 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.21218961625282168 0.3340857787810384 0.45372460496614 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6441441441441441 0.04424778761061947 0.12162162162162163 0.07964601769911504 0.12162162162162163 0.17699115044247787 0.11261261261261261 0.6991150442477876 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.859375 0.8243243243243243 0.06741573033707865 0.2571428571428571 0.08860759493670886 0.05982905982905983 0.0625 0.013513513513513514 0.16853932584269662 0.2 0.12658227848101267 0.17094017094017094 0.078125 0.16216216216216217 0.7640449438202247 0.5428571428571428 0.7848101265822784 0.7692307692307693 );
}

}
