// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/100pct aux/no refinement/partition1_model.elv" {

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
states = ("Default" "[48-73]" "[30-48]" "[13-30]" "[0-13]");
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
states = ("Default" "[32-53]" "[17-32]" "[7-17]" "[0-7]");
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
values= table (0.23488099962182768 0.3757343514223802 0.3893846489557921 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8043247488998055 0.6115388295018509 0.07798769963947944 0.19567525110019443 0.38846117049814916 0.9220123003605205 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2336271824717563 0.31886864884744054 0.12036581364829398 0.7005717220130092 0.1339124719030198 0.43838685203412076 0.06580109551523453 0.5472188792495396 0.4412473343175853 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6036269308062086 0.10744771402999251 0.6695731443062521 0.0873909801694863 0.33721691208128823 0.06065234421416106 0.10498745316867242 0.21146382450179918 0.09554489881873124 0.25168978475489395 0.1908034099715836 0.19384018623791588 0.07598493485682391 0.2602769101503279 0.08428686548545133 0.1792123282205919 0.18856023422027043 0.21749816939381705 0.09584730270771076 0.2762902076826127 0.09331265565587554 0.22856105243992447 0.1669508309652975 0.25531270867289246 0.11955337846058434 0.1445213436352677 0.0572824357336898 0.2531458544151033 0.11646861276156034 0.2726965914812135 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8034449767441031 0.7735104982664895 0.07878195219457253 0.20075381051194335 0.12914645162091232 0.07763090599532971 0.02574551024612029 0.04431662716935082 0.11982964605952046 0.12419213945647303 0.1180610756924089 0.11024891534551762 0.06441366481523933 0.05306366833398905 0.23550930779935142 0.20368206010232354 0.23090009238481365 0.24572107051287595 0.0506022773499864 0.07345860801361441 0.3412475532915495 0.2528665329073576 0.2501633260989034 0.282349982166771 0.05579357084455087 0.055650598216556116 0.22463154065500607 0.21850545702190244 0.27172905420296173 0.2840491259795057 );
}

}
