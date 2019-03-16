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
num-states = 4;
states = ("Default" "[38-59]" "[20-38]" "[0-20]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[26-48]" "[0-26]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Pupilas_Dilatadas;

link Herida_Cabeza Pupilas_Dilatadas;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2407134427497805 0.39212808416595163 0.3671584730842679 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8209834798222376 0.602215238852984 0.10372818678495645 0.17901652017776246 0.397784761147016 0.8962718132150436 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.16195652173913047 0.33138112466534203 0.1487078527062999 0.7367805383022774 0.18077744374080082 0.521454913487134 0.10126293995859213 0.4878414315938571 0.3298372338065661 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6518617638016531 0.1436604810562851 0.7115579457631576 0.12294541513580018 0.5127297697187227 0.08643366197597861 0.11909992290996078 0.34661361481055125 0.0994627773230491 0.26379276716995215 0.15711049481031836 0.27863773309732653 0.10077685784688989 0.3058355424798982 0.0895164995907442 0.29084843559763957 0.17077227696773736 0.2832055647874466 0.12597107230861238 0.20162491319045137 0.09697620788997287 0.3201587430609676 0.15711049481031836 0.34943912429418816 );
}

relation Signos_Vitales Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4690794766853206 0.43031406008574696 0.08257884055495734 0.09064496739518917 0.09314256812286267 0.13106016563500608 0.438117342410081 0.47437726555597504 0.7842124665045446 );
}

}
