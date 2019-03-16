// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/500pct aux/no refinement/partition2_model.elv" {

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
states = ("Default" "[29-44]" "[14-29]" "[0-14]");
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
values= table (0.23682165649322198 0.4210114747175874 0.34216686878919067 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8062691434578031 0.5326999124030638 0.12746768486210908 0.19373085654219688 0.4673000875969363 0.872532315137891 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.31897273120761793 0.3606567147002491 0.15735323543553767 0.4039316116000577 0.12569358246130324 0.38002144314133063 0.2770956571923244 0.5136497028384477 0.46262532142313173 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3333333333333333 0.25 0.3333333333333333 0.2857142857142857 0.25 0.14285714285714285 0.16666666666666666 0.25 0.16666666666666666 0.14285714285714285 0.25 0.14285714285714285 0.3333333333333333 0.25 0.16666666666666666 0.14285714285714285 0.25 0.14285714285714285 0.16666666666666666 0.25 0.3333333333333333 0.42857142857142855 0.25 0.5714285714285714 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.42857142857142855 0.25 0.2 0.25 0.2 0.1111111111111111 0.14285714285714285 0.25 0.2 0.25 0.2 0.1111111111111111 0.14285714285714285 0.25 0.4 0.25 0.2 0.1111111111111111 0.2857142857142857 0.25 0.2 0.25 0.4 0.6666666666666666 );
}

}
