// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/500pct aux/refinement/partition2_model.elv" {

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
states = ("Default" "[39-59]" "[20-39]" "[0-20]");
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
states = ("Default" "[35-41]" "[24-35]" "[5-24]");
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
values= table (0.20408843227063606 0.3470343879745432 0.4488771797548208 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8062691434578031 0.5898427695459209 0.10461054200496622 0.19373085654219688 0.41015723045407915 0.8953894579950338 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2749002068003655 0.28903886253846384 0.09276419104559873 0.638985075105404 0.1312026480122098 0.5016008208165097 0.08611471809423042 0.5797584894493263 0.4056349881378914 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5555555555555556 0.2 0.5454545454545454 0.1111111111111111 0.42857142857142855 0.07407407407407407 0.2222222222222222 0.2 0.09090909090909091 0.1111111111111111 0.2857142857142857 0.1111111111111111 0.1111111111111111 0.4 0.09090909090909091 0.1111111111111111 0.14285714285714285 0.07407407407407407 0.1111111111111111 0.2 0.2727272727272727 0.6666666666666666 0.14285714285714285 0.7407407407407407 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8433509934551177 0.8398074565488005 0.07639028810854323 0.1650621770147146 0.11805549536993072 0.05581198559637894 0.019370576078130614 0.018981522204271392 0.1090487316365584 0.08945762389128058 0.1356837699430876 0.12352280475172822 0.02891549762387613 0.027609486842576574 0.22140197029240644 0.17295140618980914 0.16881585330128338 0.19120653338281215 0.07720157132588287 0.08771764048943599 0.4147156309208509 0.4204508322890187 0.4244062106359367 0.43656004967049145 );
}

}
