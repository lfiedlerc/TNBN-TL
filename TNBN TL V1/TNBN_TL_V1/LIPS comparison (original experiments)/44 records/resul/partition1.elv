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
pos_y =26;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Leve" "Moderado" "Severo");
}

node Herida_Cabeza(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =77;
pos_y =85;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =335;
pos_y =81;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =117;
pos_y =180;
relevance = 7.0;
purpose = "";
num-states = 5;
states = ("[0.0-18.0]" "[19.0-33.0]" "[34.0-49.0]" "[50.0-52.0]" "Default");
}

node Signos_Vitales(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =362;
pos_y =162;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("[0.0-10.0]" "[11.0-18.0]" "[19.0-40.0]" "Default");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Pupilas_Dilatadas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

//Network Relationships: 

relation Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.25 0.4318181818181818 0.3181818181818182 );
}

relation Herida_Cabeza Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.9090909090909091 0.6315789473684211 0.07142857142857144 0.09090909090909091 0.368421052631579 0.9285714285714286 );
}

relation Heridas_Internas Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.45454545454545453 0.2105263157894737 0.07142857142857144 0.45454545454545453 0.10526315789473685 0.5714285714285715 0.09090909090909091 0.6842105263157895 0.35714285714285715 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.29999999999999993 0.0 0.0 0.7142857142857143 0.0 0.8461538461538463 0.29999999999999993 1.0 0.16666666666666669 0.0 0.0 0.0 0.0 0.0 0.08333333333333334 0.0 0.0 0.07692307692307694 0.19999999999999998 0.0 0.08333333333333334 0.14285714285714288 0.0 0.07692307692307694 0.19999999999999998 0.0 0.6666666666666667 0.14285714285714288 1.0 0.0 );
}

relation Signos_Vitales Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.43478260869565216 0.8095238095238094 0.04347826086956522 0.0 0.04347826086956522 0.09523809523809523 0.4782608695652174 0.09523809523809523 );
}

}
