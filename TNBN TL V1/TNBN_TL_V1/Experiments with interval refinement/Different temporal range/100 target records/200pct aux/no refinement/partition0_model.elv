// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/200pct aux/no refinement/partition0_model.elv" {

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
states = ("Default" "[47-71]" "[28-47]" "[12-28]" "[0-12]");
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
states = ("Default" "[31-52]" "[16-31]" "[7-16]" "[0-7]");
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
values= table (0.6203615915643775 0.10992787276015124 0.6734501079511284 0.08037906291696965 0.3576250753465943 0.08861447291315318 0.08806152333907645 0.21394398323195793 0.10228756864301415 0.23218274188147797 0.10715792646172392 0.20779963511352398 0.09335891255073754 0.28491389939174744 0.07954239152226215 0.21599738572951468 0.21763110307414105 0.21443850361958422 0.1254141015229349 0.23269788755548249 0.08751880907038076 0.24185308120085242 0.18270042194092828 0.27628442034183154 0.0728038710228737 0.15851635706066086 0.05720112281321468 0.22958772827118523 0.1348854731766124 0.21286296801190718 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8071652148393412 0.781759721868974 0.06352949671863772 0.17694428670241955 0.12244120035044365 0.08133362931206035 0.03083136235761399 0.029759173753201754 0.1113327027860565 0.14255072688970039 0.12688377473249923 0.10344599361608854 0.055703122727547995 0.06658414563232821 0.3149008025893719 0.2442941801140122 0.25299006080850445 0.27148131855098045 0.04802657050078723 0.0703480682387372 0.2672378126683184 0.22034096563906302 0.269918830540846 0.24136741180482854 0.0582737295747096 0.05154889050675877 0.24299918523761535 0.21586984065480486 0.2277661335677067 0.3023716467160421 );
}

}
