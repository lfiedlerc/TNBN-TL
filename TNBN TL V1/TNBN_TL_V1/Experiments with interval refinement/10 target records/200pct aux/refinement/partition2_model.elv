// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/200pct aux/refinement/partition2_model.elv" {

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
states = ("Default" "[38-59]" "[19-38]" "[0-19]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 5;
states = ("Default" "[37-41]" "[28-37]" "[18-28]" "[4-18]");
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
values= table (0.20288718638941095 0.3528150712680077 0.44429774234258135 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7743464177806403 0.5889177743346496 0.10326820215099847 0.22565358221935977 0.4110822256653504 0.8967317978490016 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2687786411635784 0.2966716875871687 0.09121505388277859 0.6432423457528059 0.12610320781032075 0.49184544354793963 0.0879790130836156 0.5772251046025104 0.4169395025692818 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5555555555555556 0.2 0.5454545454545454 0.1111111111111111 0.42857142857142855 0.07407407407407407 0.2222222222222222 0.4 0.09090909090909091 0.1111111111111111 0.2857142857142857 0.1111111111111111 0.1111111111111111 0.2 0.09090909090909091 0.1111111111111111 0.14285714285714285 0.07407407407407407 0.1111111111111111 0.2 0.2727272727272727 0.6666666666666666 0.14285714285714285 0.7407407407407407 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8184579340597782 0.8037039097558569 0.05053712599933822 0.16428148810891313 0.10933465755112096 0.06411022653834504 0.020099300157667414 0.021771659383071327 0.1034236344893578 0.06589895075843695 0.08778959468582141 0.08386109081197625 0.03630841318804436 0.054780304254179464 0.15598318644296585 0.16175197004343617 0.17079066602514348 0.18281717797010824 0.03209404380014636 0.03511557965011504 0.2153246160680072 0.17223589402773296 0.1931371083088071 0.17275384707267105 0.06613318116393795 0.0509175904926668 0.32892106706451496 0.319010829807888 0.3128501919712908 0.3421532505128631 );
}

}
