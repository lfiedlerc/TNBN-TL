// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/200pct aux/refinement/partition0_model.elv" {

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
states = ("Default" "[45-63]" "[30-45]" "[14-30]" "[0-14]");
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
states = ("Default" "[33-48]" "[19-33]" "[9-19]" "[0-9]");
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
values= table (0.24181581238188318 0.3774680546123941 0.3807161330057227 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8174366370116937 0.6178891647995546 0.0920997274293188 0.18256336298830633 0.3821108352004454 0.9079002725706812 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.18229075532225136 0.2963078935369961 0.0998343366599524 0.74001312335958 0.14309417464564256 0.4534558259705183 0.07769612131816858 0.5605979318173614 0.44670983736952935 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6353758270027619 0.10382208266638823 0.6804605103231074 0.09488241547614522 0.5283215197189957 0.06485721025437835 0.09891400437691036 0.26011943787013725 0.09801824836714496 0.23986552964607336 0.11555175621341872 0.20177354799490596 0.08921655296740934 0.2734102120678816 0.07841459869371596 0.23049578239427357 0.12312892055528224 0.24445641391690529 0.07370063071220771 0.21265238716390786 0.07253350379168727 0.20800838898995422 0.12312892055528224 0.2987800614539953 0.10085349465881055 0.14809719820343584 0.06861277385700147 0.22487393404319375 0.10797459187155521 0.18819263611063342 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8460833147225255 0.8272494536136903 0.0665830872558148 0.1734514245415383 0.11786691164431781 0.08283716961440361 0.01668976105418398 0.016539945930604122 0.05185649515245473 0.0811788779468132 0.07397342460005721 0.08387572603923944 0.03523394000327729 0.03859320717140962 0.25372642271022494 0.21770699085736264 0.23301628749018025 0.22427639788753154 0.05748695474218927 0.05329538133194661 0.2981748471266147 0.2232419143537363 0.2626056573302031 0.2698610316045095 0.042651611582914625 0.06248424018228224 0.32780713007087453 0.3025758178017583 0.31068838332024024 0.33732628950563687 );
}

}
