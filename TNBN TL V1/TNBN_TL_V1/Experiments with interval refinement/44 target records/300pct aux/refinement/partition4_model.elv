// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/300pct aux/refinement/partition4_model.elv" {

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
states = ("Default" "[32-41]" "[13-32]" "[4-13]");
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
values= table (0.21488644210667907 0.4315924495419554 0.3535211083513656 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8337431255634973 0.5933568466944066 0.06392579957093275 0.16625687443650272 0.4066431533055934 0.9360742004290672 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4978213821959313 0.260901156251406 0.1126756973256942 0.4214615495599481 0.127095424483736 0.46684707369958806 0.08071706824412063 0.612003419264858 0.4204772289747179 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7 0.2 0.625 0.07692307692307693 0.25 0.05 0.1 0.2 0.0625 0.07692307692307693 0.25 0.05 0.1 0.2 0.0625 0.23076923076923078 0.25 0.2 0.1 0.4 0.25 0.6153846153846154 0.25 0.7 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.841739133064321 0.8260896899105442 0.0524410869089019 0.15208311985882217 0.10289831124757595 0.05875290314793427 0.028981343675833493 0.033096037467652266 0.1915458983529411 0.15195643013282756 0.13937115521689444 0.18049003470102337 0.07103270508782719 0.07930559921494033 0.38817708604268597 0.3662149966201145 0.35083083899425155 0.37784829694419847 0.03352743680145443 0.03902834607034466 0.2474840810577823 0.21121943788463032 0.24830493170826023 0.22434742631061783 );
}

}
