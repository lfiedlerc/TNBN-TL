// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/200pct aux/refinement/partition1_model.elv" {

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
states = ("Default" "[22-48]" "[3-22]");
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
states = ("Default" "[26-44]" "[10-26]" "[0-10]");
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
values= table (0.224866116362557 0.38198259863838574 0.39315128499905727 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7834373268715493 0.6198058052226805 0.07165725990175834 0.21656267312845068 0.3801941947773195 0.9283427400982416 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3071025754307544 0.29435208103941857 0.14203143439545113 0.6496296681306686 0.09014930632019379 0.3702660658727604 0.04326775643857688 0.6154986126403876 0.4877024997317885 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6400572916372637 0.10398914313563087 0.7380990408091834 0.08296428784111265 0.6591610531847552 0.06222981375742635 0.11091257873968038 0.3896605354270628 0.09874954198998001 0.34388839205958277 0.15030785853343095 0.34043772908137976 0.1464883115429741 0.2854732264893455 0.10518972951106567 0.356393424498113 0.11008462878504803 0.3905635296823191 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7058823529411765 0.6 0.14285714285714285 0.35714285714285715 0.18181818181818182 0.05714285714285714 0.11764705882352941 0.13333333333333333 0.19047619047619047 0.14285714285714285 0.09090909090909091 0.08571428571428572 0.058823529411764705 0.13333333333333333 0.09523809523809523 0.07142857142857142 0.09090909090909091 0.05714285714285714 0.11764705882352941 0.13333333333333333 0.5714285714285714 0.42857142857142855 0.6363636363636364 0.8 );
}

}
