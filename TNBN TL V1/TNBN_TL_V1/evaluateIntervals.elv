// Bayesian Network 
//   Elvira format 

bnet "Network" {

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
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[16-41]" "[0-16]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[23-31]" "[17-23]" "[0-17]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Herida_Cabeza Heridas_Internas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2912621359223301 0.4077669902912621 0.30097087378640774 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8709677419354839 0.627906976744186 0.1875 0.12903225806451613 0.37209302325581395 0.8125 );
}

relation Heridas_Internas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3448275862068966 0.6666666666666666 0.27586206896551724 0.2222222222222222 0.25 0.10714285714285714 0.5862068965517241 0.16666666666666666 0.1724137931034483 0.16666666666666666 0.625 0.35714285714285715 0.06896551724137931 0.16666666666666666 0.5517241379310345 0.6111111111111112 0.125 0.5357142857142857 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.75 0.08695652173913043 0.11666666666666667 0.13043478260869565 0.13333333333333333 0.782608695652174 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8571428571428571 0.7857142857142857 0.1 0.3333333333333333 0.13333333333333333 0.10714285714285714 0.047619047619047616 0.07142857142857142 0.2 0.16666666666666666 0.06666666666666667 0.07142857142857142 0.047619047619047616 0.03571428571428571 0.15 0.08333333333333333 0.13333333333333333 0.03571428571428571 0.047619047619047616 0.10714285714285714 0.55 0.4166666666666667 0.6666666666666666 0.7857142857142857 );
}

}
