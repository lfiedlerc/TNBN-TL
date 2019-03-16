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
states = ("[3.0-14.0]" "[15.0-29.0]" "[30.0-45.0]" "[46.0-53.0]" "Default");
}

node Signos_Vitales(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("[0.0-10.0]" "[11.0-18.0]" "Default");
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
values= table (0.21818181818181817 0.4 0.38181818181818183 );
}

relation Herida_Cabeza Colision { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.875 0.6306818181818181 0.13690476190476192 0.12499999999999999 0.3693181818181818 0.8630952380952381 );
}

relation Heridas_Internas Colision { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.3854166666666667 0.23295454545454544 0.08928571428571427 0.5833333333333333 0.14204545454545453 0.39285714285714285 0.03125 0.625 0.5178571428571428 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.1146788990825688 0.7432432432432433 0.1055045871559633 0.12612612612612611 0.09174311926605504 0.06306306306306306 0.04587155963302752 0.03153153153153153 0.6422018348623852 0.036036036036036036 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.06557377049180327 0.14084507042253522 0.7093023255813954 0.53125 0.763157894736842 0.7456140350877193 0.04918032786885246 0.014084507042253521 0.23255813953488375 0.28125 0.15789473684210525 0.21052631578947367 0.8852459016393442 0.8450704225352113 0.058139534883720936 0.1875 0.07894736842105263 0.043859649122807015 );
}

}
