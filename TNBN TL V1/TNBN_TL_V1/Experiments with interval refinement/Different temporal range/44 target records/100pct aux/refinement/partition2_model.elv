// Bayesian Network 
//   Elvira format 

bnet "Network" {

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
states = ("Default" "[49-65]" "[22-49]" "[0-22]");
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
states = ("Default" "[34-48]" "[16-34]" "[0-16]");
}

// Links of the associated graph:

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Colision;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.45454545454545453 0.5833333333333334 0.08695652173913043 0.11111111111111112 0.07692307692307693 0.04 0.45454545454545453 0.08333333333333333 0.7391304347826086 0.22222222222222224 0.11538461538461539 0.28 0.09090909090909091 0.3333333333333333 0.17391304347826086 0.6666666666666667 0.8076923076923077 0.68 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4332447216338218 0.5667552783661782 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.256535680489659 0.3498248379935298 0.3936394815168111 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6199509260699405 0.09291851593644301 0.07941323932866914 0.18366525916989376 0.1720620185454498 0.4066873595904791 0.12668302464335315 0.3148547300055322 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8335251168737297 0.8223247204592825 0.07607321974298854 0.17495315485784357 0.12997863768223378 0.09476506956443508 0.014797767389001812 0.01496212880342884 0.05820011214217395 0.07814320339452142 0.07113382207629536 0.05793503554787616 0.07398883694500905 0.05610798301285815 0.34556316584415786 0.258054299581908 0.315542338953823 0.3295055146785456 0.07583855786863428 0.1047349016240019 0.5183447487662367 0.4870320583658545 0.4815212571318454 0.515983910348272 );
}

}
