// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/100pct aux/refinement/partition2_model.elv" {

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
states = ("Default" "[43-55]" "[19-43]" "[5-19]");
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
states = ("Default" "[32-40]" "[13-32]" "[5-13]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.23916813549501842 0.41762597197278734 0.34320589253219436 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7890843857191816 0.5429668194662991 0.12635997599723994 0.21091561428081845 0.4570331805337009 0.8736400240027601 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.29649440235214297 0.38302978095003687 0.156804144251843 0.4253307701006446 0.1180777750430716 0.3584379358437936 0.27817482754721246 0.4988924440068914 0.48475791990436345 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6661157110062991 0.08872484466801997 0.08719271241236776 0.24518614044806636 0.17013212178022977 0.4311189636211834 0.07443280327885053 0.23292683342566306 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8219864400435553 0.831872301177193 0.06652587381754049 0.1899086823748501 0.10517427312640078 0.09591392256228251 0.8207959638530791 0.831872301177193 0.06741873096039763 0.1899086823748501 0.10517427312640078 0.09400065725616007 0.8193078686149838 0.831872301177193 0.06741873096039763 0.1899086823748501 0.10428141598354364 0.09442582732418728 0.05364792217865458 0.05018737278292745 0.2129353421476117 0.16156315604321808 0.20784460648653283 0.22371517732514953 0.04318169545708937 0.03122371549566415 0.20460789967381576 0.1717041379748959 0.17940812840782555 0.2068286340755168 0.033053438667990764 0.03969681777760721 0.22236730989265455 0.1232747657255663 0.1863274247452779 0.1895906519148869 0.08291042518519345 0.0752810591743912 0.4581336149236494 0.40277012140351554 0.45725813427037215 0.40822254006754083 0.08204522136846983 0.10568026783147867 0.4738288202972575 0.4006429886080904 0.4961409970784312 0.45637187736228163 0.10577100373757045 0.07705852862711987 0.5082681368974962 0.431461680039482 0.4871451948159675 0.4773223471739505 0.03901667067538515 0.04014989822634196 0.2602543070693032 0.24348250276935685 0.22753514815367804 0.26984201801074736 0.05181803454850725 0.028821891226766906 0.25199078170354156 0.2355428559399213 0.21706168622181365 0.24055069397913365 0.039664126401588916 0.04903724548998537 0.19967676806687348 0.25315353675785934 0.22000105572334017 0.23643069532915303 );
}

}
