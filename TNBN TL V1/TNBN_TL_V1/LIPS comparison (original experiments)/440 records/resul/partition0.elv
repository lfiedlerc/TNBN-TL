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
states = ("[3.0-15.0]" "[16.0-32.0]" "[33.0-38.0]" "[39.0-56.0]" "Default");
}

node Signos_Vitales(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("[2.0-10.0]" "[11.0-19.0]" "[20.0-40.0]" "Default");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships: 

relation Colision { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.2636363636363636 0.4 0.33636363636363636 );
}

relation Herida_Cabeza Colision { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.8879310344827586 0.6363636363636364 0.1081081081081081 0.11206896551724137 0.36363636363636365 0.8918918918918919 );
}

relation Heridas_Internas Colision { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.353448275862069 0.1818181818181818 0.10135135135135134 0.6379310344827587 0.13068181818181818 0.3581081081081081 0.008620689655172414 0.6875 0.5405405405405406 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.12554112554112556 0.7177033492822967 0.11688311688311691 0.1626794258373206 0.012987012987012988 0.019138755980861247 0.09523809523809526 0.07177033492822966 0.6493506493506495 0.02870813397129187 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.03225806451612903 0.1379310344827586 0.7073170731707318 0.5 0.6825396825396826 0.8666666666666667 0.016129032258064516 0.0 0.06097560975609757 0.038461538461538464 0.015873015873015872 0.04166666666666667 0.03225806451612903 0.0689655172413793 0.17073170731707318 0.15384615384615385 0.1746031746031746 0.05 0.9193548387096775 0.793103448275862 0.06097560975609757 0.3076923076923077 0.12698412698412698 0.04166666666666667 );
}

}
