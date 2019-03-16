// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/200pct aux/no refinement/partition1_model.elv" {

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
values= table (0.24544037787877265 0.4123895393531141 0.3421700827681133 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8128079562421787 0.6079653933822686 0.0961253450081413 0.1871920437578213 0.3920346066177314 0.9038746549918586 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.33173939031679617 0.2706288322556105 0.12339783032620835 0.5592946802151822 0.1281065043742868 0.499891137658797 0.10896592946802151 0.6012646633701028 0.3767110320149946 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.21428571428571427 0.2 0.5625 0.18181818181818182 0.4 0.058823529411764705 0.21428571428571427 0.2 0.125 0.18181818181818182 0.2 0.17647058823529413 0.2857142857142857 0.4 0.25 0.09090909090909091 0.2 0.058823529411764705 0.2857142857142857 0.2 0.0625 0.5454545454545454 0.2 0.7058823529411765 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6666666666666666 0.5 0.07692307692307693 0.16666666666666666 0.15384615384615385 0.14285714285714285 0.08333333333333333 0.1 0.15384615384615385 0.16666666666666666 0.23076923076923078 0.07142857142857142 0.08333333333333333 0.1 0.15384615384615385 0.16666666666666666 0.07692307692307693 0.07142857142857142 0.16666666666666666 0.3 0.6153846153846154 0.5 0.5384615384615384 0.7142857142857143 );
}

}
