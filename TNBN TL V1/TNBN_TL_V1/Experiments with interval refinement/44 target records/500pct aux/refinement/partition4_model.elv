// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/500pct aux/refinement/partition4_model.elv" {

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
states = ("Default" "[32-49]" "[13-32]");
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
states = ("Default" "[32-41]" "[13-32]" "[5-13]");
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
values= table (0.2125990705685084 0.4236301326553943 0.36377079677609736 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8173802545689142 0.5873582974962315 0.0696899070843313 0.18261974543108578 0.4126417025037686 0.9303100929156687 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5172990910402538 0.250475403682118 0.11676012084991043 0.40393161160005775 0.12569358246130327 0.4728057050513358 0.07876929735968836 0.6238310138565789 0.4104341740987538 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6492824882460798 0.08814580717044106 0.6945031787120471 0.0763543812424172 0.6234685472850799 0.06298133189229904 0.10389297924487761 0.3131950000416374 0.09252502293488178 0.2648446218659735 0.12032782510458846 0.2502074938137051 0.10955986902187094 0.2544709375338304 0.1001898177342211 0.28801852627924623 0.10951184082552431 0.2989055966365068 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8455335331376573 0.8441725359138799 0.06547758969584483 0.1717968708922656 0.11268308999752537 0.05581198559637894 0.025837016939204798 0.024059536645253735 0.18690448206083105 0.1513919698368977 0.17112540407190582 0.17090141479348697 0.056396929447941654 0.06966075144963 0.3637962240112604 0.3413740496322203 0.35968024744743166 0.36887632103940754 0.037505347169813415 0.03497025675182229 0.21694270239203603 0.1929505497921245 0.21390675508988227 0.21489583840369156 );
}

}
