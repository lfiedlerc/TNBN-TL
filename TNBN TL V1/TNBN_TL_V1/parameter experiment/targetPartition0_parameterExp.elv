// Bayesian Network
//   Elvira format 

bnet  "parameter experiment/targetPartition0_parameterExp.elv" { 

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
pos_x =308;
pos_y =163;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =512;
pos_y =160;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =265;
pos_y =279;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[30-60]" "[15-30]" "[0-15]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =531;
pos_y =288;
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
values= table (0.23404176146400982 0.41699937715035934 0.3489588613856308 );
}

relation Herida_Cabeza Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8675892411722024 0.6261796701202798 0.11802413280627612 0.13241075882779763 0.37382032987972025 0.8819758671937239 );
}

relation Heridas_Internas Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.35813785810200255 0.2278599473796603 0.12829871303840368 0.5849732794496849 0.138953660730178 0.4305804200977344 0.056888862448312635 0.6331863918901617 0.441120866863862 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.699040382273323 0.06606590408267897 0.08905309788069532 0.10124981409168056 0.1048416916042458 0.15144592782878424 0.10706482824173585 0.6812383539968563 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8484802305699025 0.8015457327297116 0.04935875268662271 0.23325528619286046 0.09698480413390563 0.0669676841664239 0.07035034990921751 0.06079043706684552 0.2493725910449911 0.2543964554590973 0.16037751204336925 0.14772424752891983 0.08116941952087998 0.1376638302034429 0.7012686562683861 0.5123482583480422 0.7426376838227251 0.7853080683046564 );
}

}
