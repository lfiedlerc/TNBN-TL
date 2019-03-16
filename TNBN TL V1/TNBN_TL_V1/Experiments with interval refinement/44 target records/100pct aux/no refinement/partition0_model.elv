// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/100pct aux/no refinement/partition0_model.elv" {

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
states = ("Default" "[26-44]" "[12-26]" "[0-12]");
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
values= table (0.27452001765541123 0.36067016182548783 0.36480982051910105 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8640843857191816 0.6465382480377276 0.0908044204416844 0.13591561428081844 0.35346175196227236 0.9091955795583156 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.1487218205160612 0.2517843957666749 0.11621102966621576 0.7986509768444298 0.19099187792271716 0.4164280995375467 0.05262720263950881 0.5572237263106078 0.46736087079623745 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6551724137931034 0.17391304347826086 0.06896551724137931 0.17391304347826086 0.10344827586206896 0.13043478260869565 0.1724137931034483 0.5217391304347826 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3333333333333333 0.625 0.25 0.25 0.25 0.25 0.3333333333333333 0.5 0.1 0.25 0.2 0.14285714285714285 0.25 0.25 0.2 0.2 0.09090909090909091 0.09090909090909091 0.3333333333333333 0.0625 0.25 0.25 0.25 0.25 0.16666666666666666 0.16666666666666666 0.2 0.25 0.2 0.2857142857142857 0.25 0.25 0.2 0.2 0.18181818181818182 0.2727272727272727 0.16666666666666666 0.0625 0.25 0.25 0.25 0.25 0.16666666666666666 0.16666666666666666 0.2 0.25 0.2 0.14285714285714285 0.25 0.25 0.2 0.2 0.09090909090909091 0.18181818181818182 0.16666666666666666 0.25 0.25 0.25 0.25 0.25 0.3333333333333333 0.16666666666666666 0.5 0.25 0.4 0.42857142857142855 0.25 0.25 0.4 0.4 0.6363636363636364 0.45454545454545453 );
}

}
