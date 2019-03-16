// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/100pct aux/no refinement/partition0_model.elv" {

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
states = ("Default" "[48-73]" "[31-48]" "[14-31]" "[0-14]");
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
states = ("Default" "[33-51]" "[19-33]" "[9-19]" "[0-9]");
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
values= table (0.6147467633546125 0.10992787276015124 0.6678724640341434 0.07754329109385606 0.3576250753465943 0.08371782040463725 0.10264081627449885 0.19363985697846456 0.10134188919915427 0.20876007849997327 0.11936407474382156 0.18464680657518828 0.07528188356004031 0.2199936297879336 0.07957232373097015 0.21231494174653487 0.18601567209162148 0.223931769196334 0.10483830069810654 0.252699531481177 0.09773062950050766 0.20036614536740732 0.17204641350210967 0.23939004581911394 0.10249223611274175 0.22373910899227356 0.05348269353522467 0.3010155432922285 0.1649487643158529 0.26831355800472656 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8071652148393412 0.7849499651699768 0.07595168302342738 0.17694428670241955 0.1313067185763883 0.0887215611670142 0.03083136235761399 0.02656893045219896 0.09642607922030895 0.13286998859700225 0.11506308376457311 0.08867012990618087 0.04849834137275107 0.05465814968734493 0.22552162514403015 0.21432396417953717 0.17736715503447362 0.19757046889375338 0.051400572375237714 0.05243968387504312 0.26954938854311433 0.2205378143479923 0.27347828720247114 0.24529267194885948 0.06210450905505604 0.08138327081543612 0.3325512240691193 0.25532394617304877 0.302784755422094 0.37974516808419206 );
}

}
