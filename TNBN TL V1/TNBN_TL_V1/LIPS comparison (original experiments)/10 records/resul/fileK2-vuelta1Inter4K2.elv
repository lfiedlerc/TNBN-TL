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
pos_x =157;
pos_y =72;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Leve" "Moderado" "Severo");
}

node Herida_Cabeza(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =72;
pos_y =134;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =360;
pos_y =101;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =146;
pos_y =223;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("[6.0-14.0]" "[14.0-21.0]" "[21.0-29.0]" "Default");
}

node Signos_Vitales(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =371;
pos_y =171;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("[4.0-7.0]" "[7.0-11.0]" "[11.0-15.0]" "Default");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Pupilas_Dilatadas;

link Herida_Cabeza Pupilas_Dilatadas;

//Network Relationships: 

relation Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.0 0.7 0.3 );
}

relation Herida_Cabeza Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.0 0.8571428571428572 0.0 0.0 0.14285714285714288 1.0 );
}

relation Heridas_Internas Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.0 0.28571428571428575 0.0 0.0 0.0 0.6666666666666666 0.0 0.7142857142857143 0.3333333333333333 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.0 0.0 0.3333333333333333 0.0 0.0 1.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0 0.0 0.6666666666666666 0.0 0.0 0.0 );
}

relation Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6 0.2 0.1 0.1 );
}

}
