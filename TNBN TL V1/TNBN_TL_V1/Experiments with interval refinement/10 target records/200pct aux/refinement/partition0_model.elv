// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/200pct aux/refinement/partition0_model.elv" {

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
states = ("Default" "[30-49]" "[9-30]");
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
states = ("Default" "[31-40]" "[12-31]" "[4-12]");
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
values= table (0.27097229277238966 0.3698363478637524 0.35919135936385793 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8493464177806402 0.6353463457632211 0.09056978945258576 0.15065358221935976 0.364653654236779 0.9094302105474141 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.16507858373474912 0.2370441545655919 0.11521098368709028 0.7815090889912449 0.1935082451390598 0.4282562295665136 0.05341232727400582 0.5694476002953482 0.45653278674639614 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6482209783426821 0.10436440678511656 0.7264728933110784 0.08397187796562144 0.6588930478135573 0.07758330151875054 0.11431239303406561 0.3543881843656013 0.08205813200667646 0.3223366461736772 0.12592837302940357 0.28483962682006264 0.12946983741427318 0.25129343982288094 0.09524604607917804 0.31904749672292537 0.09841974785307755 0.3527374448411241 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8042714261232704 0.8211642272161744 0.040219665681877896 0.16428148810891313 0.09842195913842255 0.06535739207122486 0.042519133642880215 0.051507261928794124 0.19436411788162689 0.16204236855338847 0.18580909444279822 0.21348850936502597 0.07414493552601426 0.061424809256698576 0.4093686730604177 0.3660957215465443 0.36192380134945046 0.3546935076852007 0.042519133642880215 0.03007256286525868 0.17544371702589331 0.17104472236191004 0.1955034819789442 0.19499737863262218 );
}

}
