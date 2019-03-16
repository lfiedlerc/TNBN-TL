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
pos_x =181;
pos_y =40;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Leve" "Moderado" "Severo");
}

node Herida_Cabeza(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =147;
pos_y =104;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =344;
pos_y =70;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =136;
pos_y =177;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("[5.0-26.0]" "[27.0-37.0]" "[38.0-59.0]" "Default");
}

node Signos_Vitales(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =338;
pos_y =135;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("[8.0-23.0]" "[24.0-33.0]" "Default");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships: 

relation Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3181818181818182 0.3181818181818182 0.36363636363636365 );
}

relation Herida_Cabeza Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (1.0 0.7142857142857143 0.06250000000000001 0.0 0.28571428571428575 0.9375 );
}

relation Heridas_Internas Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.14285714285714288 0.14285714285714288 0.0625 0.8571428571428571 0.21428571428571427 0.4375 0.0 0.6428571428571429 0.5 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.16 0.631578947368421 0.08 0.052631578947368425 0.04 0.2105263157894737 0.72 0.10526315789473685 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.25 0.21428571428571427 0.8571428571428571 1.0 0.875 0.7000000000000001 0.25 0.0 0.14285714285714288 0.0 0.125 0.3 0.5 0.7857142857142857 0.0 0.0 0.0 0.0 );
}

}
