// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/100pct aux/no refinement/partition2_model.elv" {

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
states = ("Default" "[27-44]" "[12-27]" "[0-12]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.23618083153684066 0.42330184949332506 0.34051731896983434 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8057510523858482 0.6035382480377276 0.10885997599723993 0.1942489476141518 0.3964617519622724 0.89114002400276 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.21716385841908858 0.27770941012388217 0.1868535927113333 0.7426529458328621 0.1261793420296989 0.3384049702041334 0.04018319574804931 0.5961112478464189 0.47474143708453337 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7037037037037037 0.037037037037037035 0.05555555555555555 0.05555555555555555 0.07407407407407407 0.12962962962962962 0.16666666666666666 0.7777777777777778 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.625 0.7222222222222222 0.25 0.3333333333333333 0.16666666666666666 0.25 0.6363636363636364 0.14285714285714285 0.09090909090909091 0.2857142857142857 0.14285714285714285 0.16666666666666666 0.25 0.5 0.16666666666666666 0.4 0.09090909090909091 0.11764705882352941 0.125 0.05555555555555555 0.25 0.16666666666666666 0.16666666666666666 0.25 0.09090909090909091 0.14285714285714285 0.09090909090909091 0.2857142857142857 0.14285714285714285 0.16666666666666666 0.25 0.16666666666666666 0.3333333333333333 0.2 0.09090909090909091 0.058823529411764705 0.125 0.05555555555555555 0.25 0.16666666666666666 0.3333333333333333 0.25 0.09090909090909091 0.14285714285714285 0.2727272727272727 0.14285714285714285 0.14285714285714285 0.05555555555555555 0.25 0.16666666666666666 0.16666666666666666 0.2 0.2727272727272727 0.11764705882352941 0.125 0.16666666666666666 0.25 0.3333333333333333 0.3333333333333333 0.25 0.18181818181818182 0.5714285714285714 0.5454545454545454 0.2857142857142857 0.5714285714285714 0.6111111111111112 0.25 0.16666666666666666 0.3333333333333333 0.2 0.5454545454545454 0.7058823529411765 );
}

}
