// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/500pct aux/no refinement/partition0_model.elv" {

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
num-states = 4;
states = ("Default" "[39-59]" "[19-39]" "[0-19]");
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
states = ("Default" "[29-44]" "[15-29]" "[0-15]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Pupilas_Dilatadas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2721735386536148 0.36405566457028793 0.36377079677609736 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8812691434578032 0.6362713409744923 0.09191212930655351 0.11873085654219688 0.3637286590255077 0.9080878706934465 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.17120014937153621 0.22941132951688703 0.11676012084991043 0.777251818343843 0.19860768534094883 0.4380116068350838 0.05154803228462067 0.5719809851421642 0.44522827231500584 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5 0.25 0.7142857142857143 0.25 0.4 0.15789473684210525 0.1111111111111111 0.25 0.07142857142857142 0.125 0.2 0.21052631578947367 0.16666666666666666 0.25 0.07142857142857142 0.125 0.2 0.15789473684210525 0.2222222222222222 0.25 0.14285714285714285 0.5 0.2 0.47368421052631576 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.375 0.6666666666666666 0.09090909090909091 0.2 0.08333333333333333 0.07142857142857142 0.25 0.05555555555555555 0.18181818181818182 0.2 0.08333333333333333 0.2857142857142857 0.125 0.05555555555555555 0.18181818181818182 0.2 0.16666666666666666 0.14285714285714285 0.25 0.2222222222222222 0.5454545454545454 0.4 0.6666666666666666 0.5 );
}

}
