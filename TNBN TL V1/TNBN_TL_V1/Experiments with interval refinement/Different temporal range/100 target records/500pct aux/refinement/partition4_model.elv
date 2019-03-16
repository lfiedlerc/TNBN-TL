// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/500pct aux/refinement/partition4_model.elv" {

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
states = ("Default" "[35-58]" "[0-35]");
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
states = ("Default" "[28-46]" "[0-28]");
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
values= table (0.7333333333333334 0.6363636363636365 0.09090909090909091 0.39999999999999997 0.26315789473684204 0.057142857142857134 0.2 0.2272727272727273 0.8636363636363636 0.39999999999999997 0.15789473684210523 0.3142857142857143 0.06666666666666667 0.13636363636363638 0.045454545454545456 0.19999999999999998 0.5789473684210525 0.6285714285714286 );
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
values= table (0.2507750084343814 0.34780722308646195 0.40141776847915667 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6319508992344899 0.0990257615234092 0.6772153334943083 0.095261552072132 0.5241778520738206 0.06423054167460257 0.13774937104674062 0.42072828903804355 0.1273572153559872 0.3008925134338695 0.18412248332795636 0.3202411035158027 0.22814739579616417 0.47819361632128854 0.19323163709184266 0.601785026867739 0.28963087265071785 0.6134488671244273 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8478213410141232 0.8305870736936829 0.06899468990074532 0.17057852475681964 0.1180547368749193 0.08240509970010258 0.01733680925155558 0.023101762678134147 0.07176105838493241 0.11058953003242404 0.09489284476662262 0.09287397776314751 0.13291553759525945 0.14438601673833845 0.8573558028094556 0.7169887863768826 0.7851917743434262 0.822863442981487 );
}

}
