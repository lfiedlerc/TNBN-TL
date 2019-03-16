// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/200pct aux/refinement/partition3_model.elv" {

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
states = ("Default" "[50-65]" "[22-50]" "[6-22]");
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
states = ("Default" "[28-48]" "[5-28]");
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
values= table (0.238734224540973 0.39009938550192397 0.3711663899571031 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8209834798222376 0.6039938949794662 0.09170895601572568 0.17901652017776246 0.3960061050205338 0.9082910439842744 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.14151138716356104 0.32871436798157216 0.10747396784800876 0.7776708074534161 0.15811001192875654 0.49671458257215934 0.08081780538302277 0.5131756200896713 0.3958114495798319 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6312417436414199 0.10003144096928987 0.6738189850009795 0.09499217105158062 0.5442314126346257 0.06006025680564124 0.07615659642188068 0.20525598714735496 0.08975450748295197 0.21109882384247194 0.0987148553279843 0.16574830292936238 0.16233379763611405 0.5052455068242584 0.14667200003311665 0.41174721086105914 0.2394360320721321 0.5035391481398351 0.1282637413421148 0.18749344979806462 0.08756537315409947 0.2800717068801113 0.11551738389444968 0.26855421234124544 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8497773030978062 0.8342902946621552 0.06952039710389268 0.17251704960658548 0.11362374118799676 0.08265610093853672 0.02180652051806039 0.025107531111794666 0.09018833030435083 0.136735074423983 0.12761961841534078 0.11945755933724217 0.12599322965990448 0.13809142111487066 0.8380915572184796 0.6883903746862592 0.7564362836982017 0.7956324235103109 );
}

}
