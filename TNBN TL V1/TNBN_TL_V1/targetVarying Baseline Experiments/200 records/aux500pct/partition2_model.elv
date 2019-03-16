// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/200 records/aux500pct/partition2_model.elv" {

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
states = ("Default" "[36-57]" "[16-36]" "[0-16]");
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
states = ("Default" "[19-45]" "[0-19]");
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
values= table (0.5862068965517241 0.3333333333333333 0.6 0.6774193548387096 0.75 0.5714285714285714 0.14285714285714285 0.125 0.1111111111111111 0.125 0.2 0.1 0.125 0.18181818181818182 0.12 0.1111111111111111 0.3333333333333333 0.02 0.3448275862068966 0.3333333333333333 0.2 0.1935483870967742 0.125 0.2857142857142857 0.7142857142857143 0.625 0.8148148148148148 0.375 0.2 0.4 0.125 0.2727272727272727 0.12 0.7777777777777778 0.3333333333333333 0.4 0.06896551724137931 0.3333333333333333 0.2 0.12903225806451613 0.125 0.14285714285714285 0.14285714285714285 0.25 0.07407407407407407 0.5 0.6 0.5 0.75 0.5454545454545454 0.76 0.1111111111111111 0.3333333333333333 0.58 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4900990099009901 0.5099009900990099 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.21182266009852216 0.35960591133004927 0.42857142857142855 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5686274509803921 0.08490566037735849 0.11764705882352941 0.07547169811320754 0.12745098039215685 0.12264150943396226 0.18627450980392157 0.7169811320754716 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8709677419354839 0.725 0.1388888888888889 0.35294117647058826 0.15789473684210525 0.125 0.03225806451612903 0.15 0.16666666666666666 0.17647058823529413 0.23684210526315788 0.017857142857142856 0.0967741935483871 0.125 0.6944444444444444 0.47058823529411764 0.6052631578947368 0.8571428571428571 );
}

}
