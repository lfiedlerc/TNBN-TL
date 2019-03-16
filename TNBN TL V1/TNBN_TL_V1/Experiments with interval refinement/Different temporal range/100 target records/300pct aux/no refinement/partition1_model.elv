// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/300pct aux/no refinement/partition1_model.elv" {

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
states = ("Default" "[52-72]" "[34-52]" "[17-34]" "[0-17]");
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
states = ("Default" "[32-51]" "[18-32]" "[8-18]" "[0-8]");
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
values= table (0.6036269308062087 0.10744771402999251 0.6751507882232372 0.0930625238157135 0.34942306036338583 0.06391677921983835 0.08274927727788466 0.1909328365024568 0.07482375829371687 0.1739641206542978 0.152527340049944 0.12613913004930266 0.07177199046718304 0.22605859681809048 0.08161686115063108 0.18361386362701979 0.177469215534315 0.24096118648172377 0.09701113121520323 0.20559409648017243 0.07948881469470263 0.2370779787343291 0.16029019202617756 0.23444656984833998 0.1448406702335205 0.2699667561692878 0.0889197776377123 0.3122815131686398 0.16029019202617756 0.33453633440079533 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8034449767441031 0.7798909848684952 0.08623526397744634 0.20398072327617606 0.13210162436289388 0.08748148180193482 0.02574551024612029 0.03793614056734523 0.11237633427664669 0.12419213945647303 0.10624038472448276 0.0979356955872612 0.07729132934003438 0.04424693156959193 0.19722941014215672 0.15974964645593964 0.21568374199475113 0.20511812471339452 0.037724612825191337 0.0707668374625422 0.28095363978739873 0.24514341667780956 0.24545126410750545 0.27325459073460406 0.05579357084455087 0.06715910553202546 0.3232053518163517 0.2669340741336017 0.3005229848103669 0.3362101071628054 );
}

}
