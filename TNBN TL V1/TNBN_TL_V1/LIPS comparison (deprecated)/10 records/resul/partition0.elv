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
pos_x =235;
pos_y =45;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Leve" "Moderado" "Severo");
}

node Herida_Cabeza(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =164;
pos_y =143;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =378;
pos_y =122;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =362;
pos_y =245;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("[1.0-17.0]" "[17.0-32.0]" "[32.0-47.0]" "Default");
}

node Signos_Vitales(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =145;
pos_y =234;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("[0.0-14.0]" "[14.0-28.0]" "[28.0-42.0]" "Default");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships: 

relation Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5 0.3 0.2 );
}

relation Herida_Cabeza Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (1.0 0.6666666666666666 0.0 0.0 0.3333333333333333 1.0 );
}

relation Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.1 0.8 0.1 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.14285714285714288 0.6666666666666666 0.0 0.3333333333333333 0.14285714285714288 0.0 0.7142857142857143 0.0 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (1.0 0.16666666666666669 0.0 0.0 1.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 0.0 0.8333333333333334 0.0 0.0 0.0 0.0 );
}

}
