// Bayesian Network
//   Elvira format 

bnet  "" { 

// Network Properties

kindofgraph = "directed";
visualprecision = "0.00";
version = 1.0;
default node states = ("present" , "absent");

// Variables 

node Colision(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Leve" "Moderado" "Severo");
}

node Herida_Cabeza(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("[3.0-26.0]" "[27.0-51.0]" "Default");
}

node Signos_Vitales(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
relevance = 7.0;
purpose = "";
num-states = 5;
states = ("[1.0-8.0]" "[9.0-17.0]" "[18.0-32.0]" "[33.0-44.0]" "Default");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships: 

relation Colision { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.2545454545454545 0.4090909090909091 0.33636363636363636 );
}

relation Herida_Cabeza Colision { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.875 0.5722222222222223 0.11486486486486486 0.125 0.42777777777777776 0.8851351351351351 );
}

relation Heridas_Internas Colision { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.3303571428571428 0.23333333333333336 0.11486486486486489 0.5982142857142857 0.15555555555555556 0.3513513513513514 0.07142857142857141 0.6111111111111112 0.5337837837837839 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.16972477064220182 0.8153153153153154 0.11926605504587155 0.13963963963963963 0.7110091743119266 0.04504504504504505 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.09375 0.15 0.6486486486486486 0.46875 0.6567164179104478 0.7479674796747967 0.015625 0.012499999999999999 0.06756756756756757 0.09375 0.07462686567164178 0.10569105691056911 0.0 0.0375 0.12162162162162161 0.09375 0.029850746268656712 0.024390243902439025 0.0 0.024999999999999998 0.1081081081081081 0.09375 0.11940298507462685 0.056910569105691054 0.890625 0.7749999999999999 0.05405405405405405 0.25 0.11940298507462685 0.06504065040650406 );
}

}
