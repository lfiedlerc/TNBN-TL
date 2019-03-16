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
pos_x =214;
pos_y =54;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Leve" "Moderado" "Severo");
}

node Herida_Cabeza(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =106;
pos_y =155;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =414;
pos_y =140;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =150;
pos_y =255;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("[3.0-17.0]" "[18.0-35.0]" "Default");
}

node Signos_Vitales(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =416;
pos_y =245;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("[3.0-14.0]" "[15.0-27.0]" "[28.0-37.0]" "Default");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Herida_Cabeza Pupilas_Dilatadas;

link Heridas_Internas Signos_Vitales;

//Network Relationships: 

relation Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.1590909090909091 0.4772727272727273 0.36363636363636365 );
}

relation Herida_Cabeza Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8571428571428571 0.5714285714285714 0.0 0.14285714285714288 0.4285714285714286 1.0 );
}

relation Heridas_Internas Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8571428571428571 0.1904761904761905 0.0625 0.14285714285714288 0.09523809523809525 0.5 0.0 0.7142857142857143 0.4375 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.16666666666666666 0.8076923076923077 0.0 0.1923076923076923 0.8333333333333334 0.0 );
}

relation Signos_Vitales Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2727272727272727 0.6363636363636364 0.8181818181818182 0.0 0.09090909090909091 0.09090909090909091 0.09090909090909091 0.0 0.09090909090909091 0.6363636363636364 0.2727272727272727 0.0 );
}

}
