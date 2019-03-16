// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/440 records/aux200pct/partition1_model.elv" {

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
states = ("Default" "[36-59]" "[16-36]" "[0-16]");
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
states = ("Default" "[20-45]" "[0-20]");
}

// Links of the associated graph:

link Colision Heridas_Internas;

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Signos_Vitales Heridas_Internas;

//Network Relationships:

relation Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4469026548672566 0.07272727272727272 0.4690265486725664 0.33181818181818185 0.084070796460177 0.5954545454545455 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5067873303167421 0.49321266968325794 );
}

relation Heridas_Internas Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.39473684210526316 0.2 0.21052631578947367 0.4444444444444444 0.06060606060606061 0.06481481481481481 0.2692307692307692 0.1111111111111111 0.09734513274336283 0.5921052631578947 0.6 0.5526315789473685 0.3111111111111111 0.12121212121212122 0.10185185185185185 0.5 0.3333333333333333 0.4247787610619469 0.013157894736842105 0.2 0.23684210526315788 0.24444444444444444 0.8181818181818182 0.8333333333333334 0.23076923076923078 0.5555555555555556 0.4778761061946903 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7004405286343612 0.08597285067873303 0.05726872246696035 0.06334841628959276 0.1145374449339207 0.1583710407239819 0.1277533039647577 0.6923076923076923 );
}

relation Signos_Vitales Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4823008849557522 0.1409090909090909 0.12831858407079647 0.11363636363636363 0.3893805309734513 0.7454545454545455 );
}

}
