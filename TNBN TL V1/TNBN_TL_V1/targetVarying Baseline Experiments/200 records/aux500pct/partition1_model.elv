// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/200 records/aux500pct/partition1_model.elv" {

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
states = ("Default" "[34-60]" "[15-34]" "[0-15]");
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
states = ("Default" "[18-42]" "[0-18]");
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
values= table (0.6428571428571429 0.3333333333333333 0.6 0.7619047619047619 0.6 0.6363636363636364 0.4 0.07142857142857142 0.1 0.2222222222222222 0.14285714285714285 0.14285714285714285 0.2857142857142857 0.125 0.05263157894736842 0.14285714285714285 0.2222222222222222 0.02631578947368421 0.32142857142857145 0.3333333333333333 0.2 0.16666666666666666 0.2 0.2727272727272727 0.4 0.6428571428571429 0.7333333333333333 0.1111111111111111 0.2857142857142857 0.42857142857142855 0.14285714285714285 0.125 0.21052631578947367 0.2857142857142857 0.5555555555555556 0.39473684210526316 0.03571428571428571 0.3333333333333333 0.2 0.07142857142857142 0.2 0.09090909090909091 0.2 0.2857142857142857 0.16666666666666666 0.6666666666666666 0.5714285714285714 0.42857142857142855 0.5714285714285714 0.75 0.7368421052631579 0.5714285714285714 0.2222222222222222 0.5789473684210527 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5792079207920792 0.4207920792079208 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.20689655172413793 0.3694581280788177 0.4236453201970443 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7166666666666667 0.09090909090909091 0.1 0.056818181818181816 0.075 0.22727272727272727 0.10833333333333334 0.625 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8666666666666667 0.7692307692307693 0.06976744186046512 0.4117647058823529 0.17857142857142858 0.10416666666666667 0.03333333333333333 0.057692307692307696 0.27906976744186046 0.29411764705882354 0.21428571428571427 0.14583333333333334 0.1 0.17307692307692307 0.6511627906976745 0.29411764705882354 0.6071428571428571 0.75 );
}

}
