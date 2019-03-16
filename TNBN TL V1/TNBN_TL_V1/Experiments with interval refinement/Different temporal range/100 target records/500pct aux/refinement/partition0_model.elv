// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/500pct aux/refinement/partition0_model.elv" {

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
states = ("Default" "[35-57]" "[0-35]");
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
states = ("Default" "[29-46]" "[0-29]");
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
values= table (0.5 0.7142857142857143 0.08 0.125 0.2 0.03333333333333333 0.42857142857142855 0.19047619047619044 0.7199999999999999 0.375 0.05 0.3333333333333333 0.07142857142857142 0.09523809523809522 0.2 0.5 0.75 0.6333333333333333 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4486040777669346 0.5513959222330653 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2542424148144091 0.34780722308646195 0.39795036209912893 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6343630513516498 0.10173323288596973 0.6797920783933735 0.09334775033134796 0.5283215197189957 0.06339135075934783 0.12474672365649594 0.38945831860888025 0.11893437088246128 0.30079521694889394 0.19268567705096346 0.32658064743259574 0.23873941941156981 0.5067145865771453 0.19898635128411793 0.6037237333087729 0.27698566076076 0.6079740354720021 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8460833147225255 0.8272494536136903 0.0665830872558148 0.1734514245415383 0.11786691164431781 0.08283716961440361 0.01731562709371588 0.017275054638630973 0.06334565874910637 0.10007538805999311 0.09119097326883632 0.07314795579762426 0.13467709961779017 0.15355604123227531 0.8682081463848109 0.7246199394714317 0.7890810748160532 0.8421392859777768 );
}

}
