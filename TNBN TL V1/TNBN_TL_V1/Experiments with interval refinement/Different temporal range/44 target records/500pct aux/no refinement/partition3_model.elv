// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/500pct aux/no refinement/partition3_model.elv" {

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
states = ("Default" "[50-69]" "[33-50]" "[16-33]" "[0-16]");
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
values= table (0.6233583974324239 0.11598619102416571 0.6695095868759222 0.08663856140752933 0.3555169431559085 0.07720185205224288 0.0836665217710135 0.16143153049482162 0.10676851904934269 0.1985293886047167 0.14069187829231858 0.18582891479343952 0.09926355260096816 0.287825086306099 0.06614163117808544 0.23232955597636812 0.163773881594465 0.23174098456836098 0.0844501413373624 0.2920506329113924 0.09025276577632582 0.2310587913290406 0.16559006211180125 0.22166843328048683 0.10926138685823207 0.14270655926352127 0.06732749712032385 0.2514437026823452 0.17442723484550673 0.2835598153054699 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8044069073259501 0.7974441111441538 0.07549632023992872 0.19160786492288276 0.1273776335489602 0.09674441637838589 0.039734006504073514 0.03076575382612931 0.1106291754938656 0.11957994975300544 0.10772260929989326 0.10231624549765395 0.0578938957315269 0.04899360192739514 0.2337029064952627 0.18997491540562894 0.25046832291017457 0.23311532062404028 0.058927689294438985 0.05358130443964607 0.29830751869805516 0.23962560620454681 0.24143692305488096 0.2860307744925843 0.03903750114401053 0.0692152286626757 0.2818640790728878 0.259211663713936 0.272994511186091 0.28179324300733555 );
}

}
