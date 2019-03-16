// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/500pct aux/refinement/partition1_model.elv" {

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
states = ("Default" "[45-73]" "[22-45]" "[0-22]");
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
states = ("Default" "[30-49]" "[0-30]");
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
values= table (0.2475406393715161 0.4070742012436155 0.3453851593848684 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.82543159443743 0.6338422315111101 0.09756407404281843 0.17456840556257014 0.36615776848889 0.9024359259571816 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.23654509062604248 0.2989296668192515 0.17385103089714843 0.6897534060883332 0.13237148932536533 0.3964712360843768 0.07370150328562428 0.5686988438553833 0.42967773301847484 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6564671477166351 0.09170091187233786 0.6999658875708608 0.08446120776025955 0.6180428595134194 0.08028828682689879 0.10657928656076883 0.33381651568780374 0.1056706800463212 0.2664570026100834 0.11461869838839242 0.2736208431813091 0.11091656873527019 0.3591457195992561 0.10603176495208098 0.3186387098386043 0.15111272320332816 0.32125681984303894 0.12603699698732598 0.2153368528406023 0.088331667430737 0.3304430797910527 0.11622571889485994 0.3248340501487532 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8511885953027747 0.8390002909206747 0.05911697258939656 0.14856315696018935 0.094598639113734 0.06110287530555134 0.009418443335267425 0.018720896404572706 0.07223670076089087 0.08876681980627814 0.06598066597551737 0.06941262789569852 0.1375092726949044 0.14040672303429527 0.8668404091306904 0.7608584554823841 0.8375878986336508 0.8676578486962316 );
}

}
