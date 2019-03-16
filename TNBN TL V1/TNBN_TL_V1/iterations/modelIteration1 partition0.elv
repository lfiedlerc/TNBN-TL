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
states = ("Default" "[44-72]" "[22-44]" "[0-22]");
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
values= table (0.24901473764529064 0.3755232420156525 0.3754620203390569 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8152936854357706 0.6418676503462674 0.09454340430673487 0.1847063145642294 0.3581323496537327 0.9054565956932652 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2346847581460582 0.2548391314568303 0.14244186046511628 0.7043830522848104 0.17499940967935543 0.42324949443882715 0.060932189569131406 0.5701614588638143 0.4343086450960566 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6208014580257236 0.07318695519472908 0.1295282148327974 0.2878878195286914 0.1295282148327974 0.3398933611209711 0.11826489180385848 0.29717452338445566 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8169959277760039 0.8216588891021511 0.07997640435552199 0.1949312187515241 0.1471473396831875 0.10574712318704835 0.815300381756078 0.79808405506466 0.06872732272178024 0.18655959818581072 0.12580742208742854 0.08302217174374248 0.767210836514634 0.7378913301691552 0.08543786968864696 0.19136503653555287 0.12451546256490185 0.08486830396545764 0.03431326354199927 0.026049825187326243 0.10476459163653475 0.13703298404229378 0.1353734381455258 0.13156385607695875 0.028859315350612817 0.032306551189654406 0.09178868277074856 0.1349398797402043 0.1276054525493296 0.13344791679404994 0.0538685667569442 0.05824637107352106 0.10441089859791346 0.12938159415431152 0.11955956238100457 0.11511090516157765 0.14678451626299685 0.15028745300380525 0.8133541932509153 0.666132561316706 0.7155453159120649 0.7607822981841529 0.1539163485366017 0.16759023429633224 0.8375717302830806 0.6765999603875033 0.7446825663699682 0.781623512650864 0.17699671934424524 0.20192075305487303 0.8082176965542189 0.6773506988078664 0.7539965950156902 0.7981022757869384 );
}

}
