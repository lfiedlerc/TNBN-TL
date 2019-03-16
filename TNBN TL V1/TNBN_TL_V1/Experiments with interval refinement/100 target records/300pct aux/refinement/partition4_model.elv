// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/300pct aux/refinement/partition4_model.elv" {

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
states = ("Default" "[36-54]" "[7-36]");
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
states = ("Default" "[29-44]" "[15-29]" "[0-15]");
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
values= table (0.2671896852382635 0.3919312225227445 0.3408790922389921 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8351320144523862 0.6236801465829238 0.07598929163442483 0.16486798554761384 0.3763198534170762 0.9240107083655752 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.27545546359570316 0.18928330408962077 0.061451052729545506 0.6498373578520743 0.16014981778917534 0.3924263636259381 0.07470717855222257 0.650566878121204 0.5461225836445165 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6466839784137184 0.07574049996809062 0.7165015878468874 0.08073177831488956 0.5877049340502336 0.08063074652286242 0.10815796579171887 0.29196569477752177 0.08848039614969755 0.26444702267653863 0.1374316886499221 0.25498131639404986 0.16584221421396894 0.44063534303846846 0.13362345540974732 0.4713273465391368 0.2061475329748832 0.48123234361693923 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.75 0.6956521739130435 0.08695652173913043 0.16666666666666666 0.25 0.08333333333333333 0.125 0.08695652173913043 0.17391304347826086 0.16666666666666666 0.05 0.08333333333333333 0.0625 0.043478260869565216 0.13043478260869565 0.3333333333333333 0.15 0.08333333333333333 0.0625 0.17391304347826086 0.6086956521739131 0.3333333333333333 0.55 0.75 );
}

}
