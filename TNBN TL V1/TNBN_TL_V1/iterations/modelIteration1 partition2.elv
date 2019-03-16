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
states = ("Default" "[36-62]" "[0-36]");
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
values= table (0.24182307996819608 0.38990655736984164 0.36827036266196234 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8247903615991135 0.5904829322948826 0.09250840227173283 0.17520963840088657 0.4095170677051174 0.9074915977282673 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.26970549747736394 0.3370334832698566 0.39326101925277945 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6160253032952171 0.07497385498368546 0.16369447596361797 0.35702763491857753 0.21825930128482396 0.565969943990245 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8076264392398488 0.8180278070396966 0.07766158954070716 0.18567195949226487 0.1365653291011769 0.10574712318704835 0.815300381756078 0.790368005681944 0.06915128147907233 0.1764585880848006 0.12426421221088532 0.08032155445979186 0.767210836514634 0.7378913301691552 0.09287834587912314 0.19136503653555287 0.12237871042814973 0.0851390425402898 0.03655097654442873 0.025713462048738527 0.10311858005134952 0.13318449260640527 0.1506664526400631 0.12557593589288257 0.021846191405195073 0.03793340849564823 0.10573535139385791 0.1464496275230262 0.12428564673862981 0.11206165933052957 0.05129252754762303 0.05281294093606574 0.10831303332786589 0.13981071798217076 0.11828808685533634 0.11292216838937845 0.15389884860812098 0.15428077229243117 0.8173102270736591 0.6792409122926669 0.7108365970710668 0.7667742752247224 0.16086740943825464 0.1697020906384263 0.8232252358521794 0.6751898411775884 0.7495380541775828 0.8056846886350143 0.1795238464166806 0.20733969404529512 0.7968744594835848 0.6669349114554903 0.7574253303478796 0.8000248540128847 );
}

}
