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
num-states = 5;
states = ("[4.0-10.0]" "[10.0-16.0]" "[16.0-23.0]" "[23.0-29.0]" "Default");
}

node Signos_Vitales(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
relevance = 7.0;
purpose = "";
num-states = 5;
states = ("[4.0-7.0]" "[7.0-9.0]" "[9.0-12.0]" "[12.0-15.0]" "Default");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Pupilas_Dilatadas;

link Herida_Cabeza Heridas_Internas;

link Herida_Cabeza Pupilas_Dilatadas;

link Heridas_Internas Signos_Vitales;

//Network Relationships: 

relation Colision { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.17142857142857143 0.5285714285714286 0.3 );
}

relation Herida_Cabeza Colision { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.5 0.8108108108108107 0.28571428571428575 0.5 0.1891891891891892 0.7142857142857143 );
}

relation Heridas_Internas Herida_Cabeza { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.3095238095238095 0.03571428571428571 0.0 0.5 0.6904761904761905 0.4642857142857143 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (1.0 0.8333333333333333 0.5666666666666667 0.0 1.0 1.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0 0.16666666666666666 0.4333333333333333 0.0 0.0 0.0 );
}

relation Signos_Vitales Heridas_Internas { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.5 0.5 0.6666666666666667 0.0 0.5 0.0 0.0 0.0 0.16666666666666669 0.0 0.0 0.16666666666666669 0.5 0.0 0.0 );
}

}
