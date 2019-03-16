// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/200 records/aux500pct/partition4_model.elv" {

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
states = ("Default" "[35-60]" "[14-35]" "[0-14]");
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
states = ("Default" "[18-45]" "[0-18]");
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
values= table (0.22660098522167488 0.3891625615763547 0.3842364532019704 );
}

relation Herida_Cabeza Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.9642857142857143 0.5 0.6 0.8095238095238095 0.35714285714285715 0.46938775510204084 0.3333333333333333 0.26666666666666666 0.10714285714285714 0.03571428571428571 0.5 0.4 0.19047619047619047 0.6428571428571429 0.5306122448979592 0.6666666666666666 0.7333333333333333 0.8928571428571429 );
}

relation Heridas_Internas Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.41379310344827586 0.2222222222222222 0.25 0.5454545454545454 0.3333333333333333 0.12 0.3076923076923077 0.1875 0.03508771929824561 0.5517241379310345 0.6666666666666666 0.625 0.3181818181818182 0.13333333333333333 0.12 0.5384615384615384 0.3125 0.40350877192982454 0.034482758620689655 0.1111111111111111 0.125 0.13636363636363635 0.5333333333333333 0.76 0.15384615384615385 0.5 0.5614035087719298 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6808510638297872 0.07894736842105263 0.07446808510638298 0.09649122807017543 0.20212765957446807 0.12280701754385964 0.0425531914893617 0.7017543859649122 );
}

relation Signos_Vitales Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5625 0.24691358024691357 0.1375 0.14583333333333334 0.16049382716049382 0.175 0.2916666666666667 0.5925925925925926 0.6875 );
}

}
