// Bayesian Network
//   Elvira format 

bnet  "Collision" { 

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
pos_x =297;
pos_y =221;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =543;
pos_y =213;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =200;
pos_y =323;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[30-60]" "[15-30]" "[0-15]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =466;
pos_y =330;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[10-45]" "[0-10]");
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
values= table (0.24 0.392 0.368 );
}

relation Herida_Cabeza Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.9 0.6 0.1 0.1 0.4 0.9 );
}

relation Heridas_Internas Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.35 0.2 0.1 0.6 0.15 0.4 0.05 0.65 0.5 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.9 0.8 0.05 0.2 0.1 0.05 0.05 0.05 0.25 0.2 0.2 0.15 0.05 0.15 0.7 0.6 0.7 0.8 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7 0.05 0.1 0.1 0.1 0.15 0.1 0.7 );
}

}
