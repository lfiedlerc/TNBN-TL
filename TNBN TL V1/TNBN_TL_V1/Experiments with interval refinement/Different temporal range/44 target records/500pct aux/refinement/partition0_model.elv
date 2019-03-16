// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/500pct aux/refinement/partition0_model.elv" {

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
states = ("Default" "[49-64]" "[23-49]" "[0-23]");
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
states = ("Default" "[35-49]" "[22-35]" "[0-22]");
}

// Links of the associated graph:

link Colision Pupilas_Dilatadas;

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
values= table (0.42857142857142855 0.7647058823529412 0.10000000000000002 0.25 0.0909090909090909 0.07692307692307693 0.42857142857142855 0.17647058823529413 0.6999999999999998 0.25 0.1818181818181818 0.3076923076923077 0.14285714285714285 0.058823529411764705 0.20000000000000004 0.5 0.7272727272727272 0.6153846153846154 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.448291526637736 0.551708473362264 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.25903510556512016 0.3616286262039946 0.37933626823088523 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6315439414436177 0.09902443373601681 0.6746482600021193 0.0943330959387145 0.5458537755038241 0.060951121229358765 0.06424362046624102 0.20042888656296237 0.08676046399943485 0.1929796567725524 0.07664915181370059 0.1991921864058936 0.1662776059126238 0.47912048121241485 0.1281688672718924 0.3802272445320587 0.21461762507836163 0.38510489371806095 0.13604531392851038 0.21951735194991118 0.10845057999929356 0.3305493130856591 0.16096321880877124 0.3528547302047258 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.848009445954949 0.8344773694920873 0.0687167718563253 0.17066459576075516 0.11284993166418722 0.08223518257118978 0.013467517447029837 0.01331791279948723 0.06378652247559416 0.07588689973430998 0.08015318892561757 0.07495688747924546 0.026935034894059674 0.036148620455751054 0.14944270979996344 0.12467133527779498 0.13844641723515763 0.13345982404841264 0.10966407064010011 0.11415353828131912 0.7162315237973859 0.626970338281085 0.6667287987903644 0.7075198891333657 );
}

}
