// Bayesian Network
//   Elvira format 

bnet  "badNet" { 

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
pos_x =390;
pos_y =107;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Leve" "Moderado" "Severo");
}

node Herida_Cabeza(finite-states) {
title = "Herida Cabeza";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =259;
pos_y =190;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =539;
pos_y =190;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =136;
pos_y =292;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[30-60]" "[15-30]" "[0-15]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =414;
pos_y =297;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[10-45]" "[0-10]");
}

// Links of the associated graph:

//Network Relationships: 

relation Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (1.0 0.0 0.0 );
}

relation Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.0 0.0 1.0 );
}

relation Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.0 1.0 0.0 );
}

relation Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.0 1.0 );
}

relation Pupilas_Dilatadas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (1.0 0.0 0.0 0.0 );
}

}
