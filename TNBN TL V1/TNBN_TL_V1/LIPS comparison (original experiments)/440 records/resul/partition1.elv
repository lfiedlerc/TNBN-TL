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
num-states = 3;
states = ("[3.0-26.0]" "[27.0-53.0]" "Default");
}

node Signos_Vitales(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("[0.0-11.0]" "[12.0-19.0]" "Default");
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
values= table (0.26136363636363635 0.4022727272727273 0.33636363636363636 );
}

relation Herida_Cabeza Colision { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.8695652173913043 0.5932203389830508 0.12162162162162161 0.13043478260869565 0.4067796610169491 0.8783783783783784 );
}

relation Heridas_Internas Colision { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.32173913043478264 0.14689265536723164 0.11486486486486486 0.6000000000000001 0.14689265536723164 0.4324324324324324 0.0782608695652174 0.7062146892655368 0.45270270270270274 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.20627802690582958 0.8202764976958525 0.08520179372197309 0.10599078341013825 0.7085201793721972 0.07373271889400922 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.11320754716981132 0.16455696202531647 0.6483516483516484 0.5185185185185185 0.7000000000000001 0.7818181818181819 0.03773584905660377 0.10126582278481013 0.2967032967032967 0.14814814814814814 0.1625 0.12727272727272726 0.8490566037735849 0.7341772151898734 0.054945054945054944 0.3333333333333333 0.1375 0.09090909090909091 );
}

}
