// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/100pct aux/refinement/partition1_model.elv" {

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
states = ("Default" "[43-55]" "[19-43]" "[5-19]");
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
states = ("Default" "[20-34]" "[6-20]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.24898810276179417 0.40322335331484954 0.34778854392335634 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.82754592418072 0.6191572956567752 0.09635997599723994 0.17245407581928 0.38084270434322476 0.90364002400276 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.31538262709810827 0.2853690734566934 0.12439787630533385 0.5764365680683673 0.12559013715794418 0.48806300762983024 0.1081808048335245 0.5890407893853623 0.387539116064836 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6534148774585572 0.08620503104025094 0.08123088809565066 0.19927552368277437 0.1606566453447313 0.36264554760288664 0.06498471047652052 0.22081882354037158 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8081782854355843 0.8155193539483655 0.0747656124739458 0.19352647007764662 0.11013186577016364 0.10540555965324841 0.8094254509684641 0.8024241158531273 0.06619418390251723 0.18959789864907517 0.11406043719873507 0.10147698822467699 0.7841703489276478 0.7958764968055083 0.0747656124739458 0.18959789864907517 0.10751281815111602 0.09558413108181985 0.04937984731361195 0.04018390310035603 0.2421511873603345 0.18954810237642894 0.24937836826199042 0.24511887665500998 0.05978809381381519 0.045735158367331635 0.2662875930297253 0.18508074598480104 0.22862956459387482 0.23673660190487555 0.06825382127929086 0.055998483177249925 0.247572482599745 0.24258156027134112 0.2503972053283442 0.23687082281190433 0.06457364648703101 0.0639289367505664 0.339734501669723 0.3612143083022514 0.3390828172770949 0.3220539985248306 0.06165647174549692 0.07317625338773061 0.37424202263637074 0.3450048857192407 0.32865499910369506 0.32461609806653385 0.06456442553446433 0.07044970464234668 0.36684097786677544 0.3396141843798776 0.33088202132674055 0.32300566747077863 );
}

}
