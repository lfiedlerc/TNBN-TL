// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/200pct aux/refinement/partition4_model.elv" {

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
num-states = 5;
states = ("Default" "[47-65]" "[28-47]" "[15-28]" "[0-15]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 5;
states = ("Default" "[32-48]" "[21-32]" "[10-21]" "[0-10]");
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
values= table (0.25221803152196637 0.37920175780240795 0.36858021067562563 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8058466644842212 0.6101775781405995 0.08189564579666574 0.19415333551577885 0.38982242185940047 0.9181043542033342 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.22287043664996423 0.25543619961412106 0.07446823053368329 0.6928883321403007 0.17125576862908692 0.44918628335520566 0.08424123120973516 0.5733080317567919 0.47634548611111116 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6314445114089339 0.0990257615234092 0.6775495494591753 0.09372688692733473 0.5241778520738206 0.06393736977559647 0.09929992438723026 0.23092196868517664 0.09265817544276571 0.21862670975155016 0.10127941301239964 0.21587130239767555 0.0973903104567066 0.33691893791771677 0.08895184842505507 0.2765534448139267 0.18153857049392386 0.2605343304799533 0.06492687363780439 0.17981628709091627 0.064860722809936 0.18686043568508562 0.08981381908646759 0.2549514519696685 0.10502876617880123 0.15142424176077157 0.07412654035421257 0.2223639184652519 0.10127941301239964 0.2028445858736779 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8478213410141232 0.8311633081158674 0.06899468990074532 0.17057852475681964 0.12072135361587907 0.08417969774364396 0.020168256010176445 0.01688366918841326 0.06255766905805268 0.09317289699868325 0.0754192981208137 0.07616723305894445 0.02933564510571119 0.03564330161998355 0.16927369274531903 0.12423052933157767 0.16003607162221445 0.1505209605688664 0.056837812392315425 0.05252697080839682 0.3348675226048703 0.268557173702087 0.2906402220265504 0.32643099882404764 0.04400346765856678 0.06190678702418195 0.3624664942481288 0.3416339556618386 0.3513435595384248 0.36088760425547484 );
}

}
