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
states = ("Default" "[31-56]" "[0-31]");
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
states = ("Default" "[32-46]" "[16-32]" "[0-16]");
}

// Links of the associated graph:

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Colision;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.34615384615384615 0.7321428571428571 0.01282051282051282 0.22222222222222224 0.22499999999999998 0.056179775280898875 0.6153846153846153 0.19642857142857145 0.8717948717948718 0.25396825396825395 0.275 0.5168539325842697 0.03846153846153846 0.07142857142857142 0.11538461538461539 0.523809523809524 0.5 0.4269662921348314 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.44153835202595126 0.5584616479740487 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2730661091313664 0.3287910393182911 0.3981428515503425 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.62941456160392 0.0880996945651806 0.18175209399043415 0.4047599266943062 0.18647292760057532 0.5047594379952524 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8296369867623388 0.8019650443763828 0.07058621711769612 0.17908576238162113 0.12238420933441557 0.08856555451789327 0.027626434579080195 0.013978938044020032 0.058358539855400474 0.07930503078819849 0.06951412203291757 0.0671127501423879 0.07136828932929051 0.0745543362347735 0.3371826747200916 0.28721281420590805 0.33670902859694446 0.3074196942006156 0.0690660864477005 0.10717185833748694 0.5317111409047599 0.45225301341378055 0.4692203237221936 0.5347370737151552 );
}

}
