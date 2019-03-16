// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/500pct aux/no refinement/partition0_model.elv" {

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
states = ("Default" "[49-72]" "[32-49]" "[15-32]" "[0-15]");
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
states = ("Default" "[32-53]" "[18-32]" "[9-18]" "[0-9]");
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
values= table (0.6147467633546125 0.10992787276015124 0.6697316786731383 0.08321483474008325 0.3576250753465943 0.08698225541031453 0.07947873829305996 0.17787296564195298 0.10320110383814927 0.20025276303063247 0.1332278481012658 0.17803554823171158 0.0814870852057313 0.25553530330429064 0.07186568567892083 0.1963499523211121 0.2109704641350211 0.21771749291470166 0.12779168492326037 0.20377301495972383 0.08296110909547487 0.2408034396875936 0.1853676913803496 0.24212218685850584 0.09649572822333582 0.2528908433338813 0.07224042271431677 0.27937901022057854 0.11280892103676912 0.27514251658476635 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8071652148393412 0.781759721868974 0.061045059457679796 0.17694428670241955 0.12244120035044365 0.07887098536040908 0.03083136235761399 0.02656893045219896 0.1113327027860565 0.13932381412546765 0.12688377473249923 0.10590863756773983 0.05280089172506136 0.05826588161786167 0.24020417563827345 0.1877046501311528 0.22032894087924068 0.24156639080439882 0.047098022022927434 0.04370393123106263 0.24432255972067396 0.21489758754182203 0.21699275528365813 0.1957313405420917 0.06210450905505604 0.08970153482990267 0.3430955023973163 0.28112966149913793 0.31335332875415833 0.3779226457253606 );
}

}
