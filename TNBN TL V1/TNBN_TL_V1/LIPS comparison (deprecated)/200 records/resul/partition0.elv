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
pos_x =146;
pos_y =27;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Leve" "Moderado" "Severo");
}

node Herida_Cabeza(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =84;
pos_y =83;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =298;
pos_y =60;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =53;
pos_y =138;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("[2.0-27.0]" "[28.0-57.0]" "Default");
}

node Signos_Vitales(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =297;
pos_y =119;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("[11.0-17.0]" "[18.0-30.0]" "[31.0-42.0]" "Default");
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
values= table (0.24 0.405 0.355 );
}

relation Herida_Cabeza Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7708333333333334 0.6296296296296297 0.09859154929577466 0.22916666666666669 0.37037037037037035 0.9014084507042254 );
}

relation Heridas_Internas Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.33333333333333337 0.24691358024691357 0.09859154929577466 0.6458333333333334 0.17283950617283952 0.3943661971830986 0.020833333333333336 0.5802469135802468 0.5070422535211268 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2105263157894737 0.8666666666666667 0.06315789473684211 0.0857142857142857 0.7263157894736841 0.047619047619047616 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.06896551724137931 0.12121212121212122 0.6363636363636365 0.5 0.775 0.8627450980392157 0.0 0.06060606060606061 0.24242424242424246 0.14285714285714285 0.0 0.058823529411764705 0.0 0.0 0.12121212121212123 0.0 0.12500000000000003 0.0784313725490196 0.9310344827586207 0.8181818181818182 0.0 0.35714285714285715 0.1 0.0 );
}

}
