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
pos_x =249;
pos_y =31;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Leve" "Moderado" "Severo");
}

node Herida_Cabeza(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =130;
pos_y =110;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =486;
pos_y =92;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =184;
pos_y =203;
relevance = 7.0;
purpose = "";
num-states = 5;
states = ("[4.0-14.0]" "[15.0-32.0]" "[33.0-39.0]" "[40.0-56.0]" "Default");
}

node Signos_Vitales(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =495;
pos_y =182;
relevance = 7.0;
purpose = "";
num-states = 5;
states = ("[3.0-10.0]" "[11.0-17.0]" "[18.0-28.0]" "[29.0-41.0]" "Default");
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
values= table (0.255 0.39 0.355 );
}

relation Herida_Cabeza Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.9411764705882353 0.5641025641025641 0.08450704225352113 0.058823529411764705 0.4358974358974359 0.915492957746479 );
}

relation Heridas_Internas Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3529411764705882 0.1794871794871795 0.14084507042253522 0.6078431372549019 0.12820512820512822 0.4366197183098592 0.0392156862745098 0.6923076923076923 0.4225352112676056 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.17346938775510204 0.7352941176470588 0.11224489795918366 0.09803921568627451 0.05102040816326531 0.0392156862745098 0.09183673469387754 0.058823529411764705 0.5714285714285714 0.06862745098039216 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.07142857142857142 0.10810810810810811 0.6666666666666667 0.4285714285714285 0.5714285714285714 0.8490566037735849 0.0 0.0 0.060606060606060615 0.07142857142857142 0.02857142857142857 0.03773584905660377 0.0 0.13513513513513514 0.030303030303030307 0.0 0.1714285714285714 0.0 0.0 0.0 0.12121212121212123 0.14285714285714285 0.0857142857142857 0.0 0.9285714285714285 0.7567567567567568 0.12121212121212123 0.35714285714285715 0.14285714285714285 0.11320754716981131 );
}

}
