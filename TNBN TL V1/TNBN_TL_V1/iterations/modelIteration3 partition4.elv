// Bayesian Network 
//   Elvira format 

bnet "Network" {

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
states = ("Default" "[32-58]" "[0-32]");
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
states = ("Default" "[31-45]" "[15-31]" "[0-15]");
}

// Links of the associated graph:

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
values= table (0.7333333333333333 0.6363636363636364 0.09090909090909091 0.4 0.2631578947368421 0.05714285714285713 0.20000000000000004 0.2272727272727273 0.8636363636363636 0.4 0.15789473684210525 0.3142857142857142 0.06666666666666668 0.13636363636363638 0.045454545454545456 0.2 0.5789473684210527 0.6285714285714284 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.44877897975179276 0.5512210202482072 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.24696544537375764 0.34786908323212623 0.4051654713941162 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6379095581847902 0.10797239884526554 0.1467934223575175 0.36744142120104345 0.21285046241840033 0.5222752276190932 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8394283321665654 0.8210690332923077 0.06973252935741713 0.17806850815809064 0.14211235632528302 0.09655481900188928 0.01735909922523617 0.015274594718949338 0.05446530858563131 0.10758265600024992 0.08274043263867828 0.07977916872775681 0.07811594651356277 0.0763729735947467 0.38779299712969495 0.27325994624063477 0.3374938699735562 0.3622405498990039 0.06292673469148112 0.08510131343414631 0.48583055258383134 0.4389372364810197 0.4354759612562015 0.4592692686219514 );
}

}
