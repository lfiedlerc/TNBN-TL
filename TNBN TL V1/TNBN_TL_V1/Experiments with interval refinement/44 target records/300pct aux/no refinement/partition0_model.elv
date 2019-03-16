// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/300pct aux/no refinement/partition0_model.elv" {

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
states = ("Default" "[40-59]" "[20-40]" "[0-20]");
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

link Colision Pupilas_Dilatadas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2744609101917855 0.372017981456849 0.3535211083513656 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8976320144523862 0.6422698901726674 0.08614802179315498 0.10236798554761381 0.35773010982733255 0.913851978206845 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.15172244052721365 0.23983708208617505 0.11267569732569417 0.7947817563037335 0.2000095273633816 0.43205297548333615 0.053495803169052926 0.5601533905504434 0.45527132719096974 );
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
values= table (0.375 0.6666666666666666 0.09090909090909091 0.2 0.08333333333333333 0.07142857142857142 0.25 0.05555555555555555 0.18181818181818182 0.2 0.16666666666666666 0.2857142857142857 0.125 0.05555555555555555 0.18181818181818182 0.2 0.08333333333333333 0.14285714285714285 0.25 0.2222222222222222 0.5454545454545454 0.4 0.6666666666666666 0.5 );
}

}
