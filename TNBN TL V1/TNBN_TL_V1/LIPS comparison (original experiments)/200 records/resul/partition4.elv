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
pos_x =371;
pos_y =72;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Leve" "Moderado" "Severo");
}

node Herida_Cabeza(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =188;
pos_y =147;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =580;
pos_y =163;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =286;
pos_y =283;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("[2.0-25.0]" "[26.0-50.0]" "Default");
}

node Signos_Vitales(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =592;
pos_y =270;
relevance = 7.0;
purpose = "";
num-states = 5;
states = ("[10.0-16.0]" "[17.0-16.0]" "[17.0-29.0]" "[30.0-40.0]" "Default");
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
values= table (0.225 0.39 0.385 );
}

relation Herida_Cabeza Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8222222222222222 0.5384615384615384 0.14285714285714285 0.17777777777777778 0.4615384615384615 0.8571428571428572 );
}

relation Heridas_Internas Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.33333333333333337 0.25641025641025644 0.07792207792207792 0.6444444444444445 0.15384615384615383 0.41558441558441556 0.022222222222222227 0.5897435897435898 0.5064935064935066 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.15555555555555556 0.7999999999999999 0.14444444444444446 0.1272727272727273 0.7 0.07272727272727272 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.07407407407407407 0.25 0.7741935483870966 0.5 0.6829268292682927 0.7999999999999999 0.0 0.0 0.0 0.0 0.0 0.0 0.07407407407407407 0.0625 0.09677419354838708 0.07142857142857142 0.07317073170731707 0.14545454545454545 0.07407407407407407 0.0 0.06451612903225805 0.14285714285714285 0.12195121951219512 0.03636363636363636 0.7777777777777777 0.6875 0.06451612903225805 0.2857142857142857 0.12195121951219512 0.01818181818181818 );
}

}
