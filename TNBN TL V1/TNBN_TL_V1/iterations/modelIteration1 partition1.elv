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
num-states = 3;
states = ("Default" "[37-63]" "[0-37]");
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

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.23463142229110148 0.3970982150469362 0.36827036266196234 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8124878492966011 0.6013168955097983 0.09250840227173283 0.18751215070339888 0.39868310449020183 0.9074915977282673 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2553221821231748 0.34242722652767754 0.40225059134914765 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6131400424303416 0.07342572881863725 0.14351256490487327 0.34062248918702176 0.24126750041978692 0.5839242671777516 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8083980441781203 0.8225825408854288 0.08700875316002268 0.19988199230989262 0.1365653291011769 0.10976142229628416 0.8127283652951727 0.7949976353115736 0.07544259047319161 0.1796210140320367 0.12977567605568252 0.08439226804638375 0.767210836514634 0.7448357746135997 0.09606941367989559 0.19768856923039357 0.1258010318958744 0.09228088361321383 0.034836719240341756 0.025914909758308145 0.11671228310119297 0.14341737873690602 0.14006829105692017 0.12608529212112715 0.026753090672118188 0.03582565596496771 0.09742237166501494 0.15037109023542716 0.11551650317844923 0.11733628497724916 0.047346948505498185 0.05022917822566934 0.09464230497795964 0.1349860464091044 0.11886038601415742 0.1057723546637145 0.15482986329040782 0.14950909475947008 0.7943965075597329 0.6548135581803473 0.7214476361287944 0.7622429023686322 0.1586076089847007 0.16718639450318268 0.8252247952801266 0.6681044642105688 0.7527825457128942 0.7963479013210024 0.18346942545880546 0.20292588003170414 0.8073568057303496 0.665424172439247 0.7534214790897399 0.8000236280019133 );
}

}
