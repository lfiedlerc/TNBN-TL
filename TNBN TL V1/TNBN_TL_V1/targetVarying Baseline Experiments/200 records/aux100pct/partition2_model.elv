// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/200 records/aux100pct/partition2_model.elv" {

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
states = ("Default" "[32-58]" "[13-32]" "[0-13]");
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
states = ("Default" "[17-43]" "[0-17]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Pupilas_Dilatadas;

link Colision Signos_Vitales;

link Pupilas_Dilatadas Herida_Cabeza;

link Signos_Vitales Herida_Cabeza;

link Signos_Vitales Heridas_Internas;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2561576354679803 0.3891625615763547 0.35467980295566504 );
}

relation Herida_Cabeza Colision Pupilas_Dilatadas Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.9473684210526315 0.8333333333333334 0.8571428571428571 0.8888888888888888 0.6666666666666666 0.5 0.8 0.5 0.5 0.9090909090909091 0.25 0.6 0.9090909090909091 0.8333333333333334 0.7894736842105263 0.7142857142857143 0.3333333333333333 0.75 0.8 0.5 0.5 0.2727272727272727 0.3333333333333333 0.10526315789473684 0.6666666666666666 0.5 0.16666666666666666 0.6666666666666666 0.3333333333333333 0.125 0.25 0.5 0.14285714285714285 0.14285714285714285 0.125 0.05405405405405406 0.05263157894736842 0.16666666666666666 0.14285714285714285 0.1111111111111111 0.3333333333333333 0.5 0.2 0.5 0.5 0.09090909090909091 0.75 0.4 0.09090909090909091 0.16666666666666666 0.21052631578947367 0.2857142857142857 0.6666666666666666 0.25 0.2 0.5 0.5 0.7272727272727273 0.6666666666666666 0.8947368421052632 0.3333333333333333 0.5 0.8333333333333334 0.3333333333333333 0.6666666666666666 0.875 0.75 0.5 0.8571428571428571 0.8571428571428571 0.875 0.9459459459459459 );
}

relation Heridas_Internas Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4358974358974359 0.1 0.2727272727272727 0.41379310344827586 0.1111111111111111 0.08163265306122448 0.3333333333333333 0.25 0.09433962264150944 0.5384615384615384 0.8 0.45454545454545453 0.20689655172413793 0.3333333333333333 0.08163265306122448 0.6 0.5833333333333334 0.33962264150943394 0.02564102564102564 0.1 0.2727272727272727 0.3793103448275862 0.5555555555555556 0.8367346938775511 0.06666666666666667 0.16666666666666666 0.5660377358490566 );
}

relation Pupilas_Dilatadas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4909090909090909 0.3780487804878049 0.12 0.16363636363636364 0.10975609756097561 0.12 0.07272727272727272 0.17073170731707318 0.13333333333333333 0.2727272727272727 0.34146341463414637 0.6266666666666667 );
}

relation Signos_Vitales Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6851851851851852 0.3333333333333333 0.17567567567567569 0.14814814814814814 0.08641975308641975 0.13513513513513514 0.16666666666666666 0.5802469135802469 0.6891891891891891 );
}

}
