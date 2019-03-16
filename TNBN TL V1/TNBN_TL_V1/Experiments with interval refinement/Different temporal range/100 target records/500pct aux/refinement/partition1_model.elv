// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/500pct aux/refinement/partition1_model.elv" {

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
states = ("Default" "[55-65]" "[36-55]" "[0-36]");
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
states = ("Default" "[43-49]" "[32-43]" "[18-32]" "[0-18]");
}

// Links of the associated graph:

link Colision Pupilas_Dilatadas;

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
values= table (0.5 0.7142857142857143 0.05 0.15384615384615385 0.1904761904761905 0.02941176470588235 0.4375 0.21428571428571427 0.8 0.3076923076923077 0.04761904761904762 0.2941176470588235 0.0625 0.07142857142857142 0.15 0.5384615384615384 0.761904761904762 0.676470588235294 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4310970749658142 0.5689029250341858 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.26637833714450626 0.33740500394637873 0.3962166589091151 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6324497860455274 0.10116380868771901 0.6801586043140866 0.09674253452376427 0.524778435818769 0.06004352085364061 0.043801320833952696 0.10508314553964038 0.058507572381569534 0.11384030040093052 0.047144996446550694 0.11490449945476539 0.09712466793615598 0.3114964671353625 0.07020908685788343 0.2426104762642782 0.17537938678116854 0.2505294824177672 0.22471981993071383 0.4803800938954988 0.18917448403374149 0.5449404543782249 0.25081138109564965 0.5726388169548964 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8452079645824695 0.826089898882707 0.07215008205867404 0.17891961035098408 0.12124258510599631 0.08393300105874968 0.005463248308854017 0.010757325842306783 0.043578078337753075 0.027188092372483975 0.027404077387546893 0.039907869260806944 0.014568662156944048 0.01434310112307571 0.03449931201738785 0.07068904016845834 0.05663509326759691 0.054419821719282196 0.04552706924045015 0.04302930336922713 0.25420545697022634 0.18487902813289106 0.2649060814129533 0.23400523339291346 0.08741197294166428 0.1039874831422989 0.5937513173518857 0.5365116894836838 0.5279852243334034 0.5859200805109384 );
}

}
