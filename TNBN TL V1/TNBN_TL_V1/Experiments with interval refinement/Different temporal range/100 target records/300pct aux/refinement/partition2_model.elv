// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/300pct aux/refinement/partition2_model.elv" {

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
num-states = 3;
states = ("Default" "[35-56]" "[0-35]");
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
states = ("Default" "[31-47]" "[20-31]" "[0-20]");
}

// Links of the associated graph:

link Colision Pupilas_Dilatadas;

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Colision;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.35714285714285715 0.6818181818181818 0.04347826086956522 0.21428571428571425 0.2 0.03333333333333333 0.5714285714285714 0.18181818181818182 0.8260869565217392 0.28571428571428564 0.26666666666666666 0.5 0.07142857142857142 0.13636363636363635 0.13043478260869568 0.49999999999999994 0.5333333333333333 0.46666666666666673 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4468533774868226 0.5531466225131774 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.26464463395449234 0.3408724103264064 0.3944829557191012 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6402033909397291 0.1032526584681375 0.681491364475113 0.09459677664685995 0.5221211228935989 0.06207725211727736 0.1199322030200903 0.38951793832648923 0.13650370093923725 0.30110887015184706 0.17396467894662848 0.3229251566175163 0.23776033230298604 0.50508919475303 0.17972987290332904 0.6022177403036941 0.30181823817246384 0.6129407431338846 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8460833147225255 0.8277536078445527 0.0680139480616756 0.1791203587819011 0.11530450275218954 0.08489444413711593 0.015201647928639457 0.016669005692462647 0.06090205883953406 0.09223366755259536 0.07975242428020095 0.07610411316506745 0.034203707839438775 0.03889434661574617 0.21223444747110357 0.14388452138204877 0.1928895843056023 0.18376359032540676 0.10261112351831632 0.11483092810363156 0.6570040286931553 0.5829167789324028 0.6101987811206072 0.6533816544903351 );
}

}
