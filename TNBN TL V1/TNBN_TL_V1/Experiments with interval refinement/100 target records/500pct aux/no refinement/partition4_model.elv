// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/500pct aux/no refinement/partition4_model.elv" {

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
states = ("Default" "[39-59]" "[19-39]" "[0-19]");
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
states = ("Default" "[27-44]" "[12-27]" "[0-12]");
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
values= table (0.26490231370009276 0.38396890563618336 0.3511287806637239 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.818769143457803 0.6176815973847487 0.08175339914782337 0.1812308565421969 0.3823184026152513 0.9182466008521766 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2949331724400257 0.17885755152033275 0.06553547625376174 0.6323074198921839 0.15874797576674257 0.39838499497768576 0.0727594076677903 0.6623944727129246 0.5360795287685524 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5714285714285714 0.1 0.75 0.11764705882352941 0.3333333333333333 0.14285714285714285 0.10714285714285714 0.1 0.07142857142857142 0.11764705882352941 0.16666666666666666 0.05714285714285714 0.17857142857142858 0.2 0.07142857142857142 0.17647058823529413 0.3333333333333333 0.22857142857142856 0.14285714285714285 0.6 0.10714285714285714 0.5882352941176471 0.16666666666666666 0.5714285714285714 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.75 0.6956521739130435 0.08695652173913043 0.16666666666666666 0.25 0.08333333333333333 0.125 0.08695652173913043 0.17391304347826086 0.16666666666666666 0.1 0.1111111111111111 0.0625 0.043478260869565216 0.13043478260869565 0.3333333333333333 0.1 0.08333333333333333 0.0625 0.17391304347826086 0.6086956521739131 0.3333333333333333 0.55 0.7222222222222222 );
}

}
