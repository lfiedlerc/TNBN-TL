// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/440 records/aux100pct/partition1_model.elv" {

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
states = ("Default" "[37-59]" "[16-37]" "[0-16]");
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

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Signos_Vitales Herida_Cabeza;

link Signos_Vitales Heridas_Internas;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2618510158013544 0.4018058690744921 0.3363431151241535 );
}

relation Herida_Cabeza Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.9342105263157895 0.5 0.7435897435897436 0.7608695652173914 0.6666666666666666 0.5 0.24 0.375 0.07964601769911504 0.06578947368421052 0.5 0.2564102564102564 0.2391304347826087 0.3333333333333333 0.5 0.76 0.625 0.9203539823008849 );
}

relation Heridas_Internas Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4025974025974026 0.14285714285714285 0.2 0.425531914893617 0.07142857142857142 0.06306306306306306 0.2692307692307692 0.11764705882352941 0.09649122807017543 0.5844155844155844 0.7142857142857143 0.55 0.2978723404255319 0.10714285714285714 0.10810810810810811 0.5 0.35294117647058826 0.42105263157894735 0.012987012987012988 0.14285714285714285 0.25 0.2765957446808511 0.8214285714285714 0.8288288288288288 0.23076923076923078 0.5294117647058824 0.4824561403508772 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7004405286343612 0.08597285067873303 0.05286343612334802 0.058823529411764705 0.11894273127753303 0.16289592760180996 0.1277533039647577 0.6923076923076923 );
}

relation Signos_Vitales Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.635593220338983 0.25 0.15894039735099338 0.0423728813559322 0.14444444444444443 0.09933774834437085 0.3220338983050847 0.6055555555555555 0.7417218543046358 );
}

}
