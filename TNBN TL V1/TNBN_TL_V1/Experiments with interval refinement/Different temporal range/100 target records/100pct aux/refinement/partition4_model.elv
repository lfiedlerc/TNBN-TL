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
states = ("Default" "[44-72]" "[21-44]" "[0-21]");
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
states = ("Default" "[30-43]" "[14-30]" "[0-14]");
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
values= table (0.7096774193548387 0.6666666666666666 0.125 0.368421052631579 0.26315789473684204 0.052631578947368425 0.22580645161290322 0.15151515151515152 0.825 0.368421052631579 0.18421052631578944 0.31578947368421056 0.06451612903225806 0.18181818181818182 0.05 0.26315789473684215 0.5526315789473684 0.6315789473684211 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4495668213453849 0.5504331786546152 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.255076133244255 0.3394671659613631 0.4054567007943818 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6176097725247721 0.08276329328130724 0.11471706824256836 0.2800174681959218 0.13110522084864956 0.3446368839334423 0.1347470325388898 0.29078737081884193 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8394883687874481 0.824869583194533 0.06894857776011282 0.16396749243474204 0.13236782362615285 0.09210027597981649 0.020530557480675237 0.01883122761349108 0.04334854799902309 0.08731895079014916 0.05281239334449504 0.05395305737005189 0.0690573297077258 0.07344178769261521 0.4184077241644837 0.3102609528075512 0.38666216555791005 0.4223222076897165 0.0690573297077258 0.08097427873801165 0.46741043059816195 0.4365947539507458 0.4262714605662814 0.4297640087062754 );
}

}
