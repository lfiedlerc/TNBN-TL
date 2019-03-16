// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/500pct aux/refinement/partition0_model.elv" {

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
states = ("Default" "[36-54]" "[7-36]");
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
values= table (0.2721735386536148 0.36405566457028793 0.36377079677609736 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8812691434578032 0.6362713409744923 0.09191212930655351 0.11873085654219688 0.3637286590255077 0.9080878706934465 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.17120014937153621 0.22941132951688703 0.11676012084991043 0.777251818343843 0.19860768534094883 0.4380116068350838 0.05154803228462067 0.5719809851421642 0.44522827231500584 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.633568202531794 0.09207437859901248 0.7015184848344962 0.08995328234131829 0.6352542615707942 0.0714587755013216 0.12433682176210221 0.34393591762227715 0.09397629100023018 0.3033489058862272 0.1309679491666807 0.30618563675225235 0.16972962970699665 0.40424695530959587 0.1447021298923999 0.42566701309841565 0.16240025696668406 0.47092682174395334 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8291644855186097 0.8572677740091179 0.06607282779108292 0.1650621770147146 0.10714279695723232 0.05705915112925876 0.03072581195708459 0.022253949213632152 0.20921307621167498 0.155059881411553 0.1913265435091645 0.18621812096190582 0.06698227006644442 0.062157582286351876 0.37156242335193473 0.3488847331759943 0.3236607361030033 0.37920780995879005 0.045781459816056046 0.03785729291514436 0.22260271308922217 0.22513502012638945 0.25510205801221936 0.21161150109307478 );
}

}
