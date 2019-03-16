// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/44 records/aux100pct/partition3_model.elv" {

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
states = ("Default" "[35-59]" "[15-35]" "[0-15]");
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
states = ("Default" "[17-43]" "[0-17]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Pupilas_Dilatadas;

link Colision Signos_Vitales;

link Heridas_Internas Colision;

link Heridas_Internas Signos_Vitales;

link Pupilas_Dilatadas Herida_Cabeza;

link Pupilas_Dilatadas Signos_Vitales;

link Signos_Vitales Herida_Cabeza;

//Network Relationships:

relation Colision Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2 0.45 0.043478260869565216 0.6 0.15 0.6521739130434783 0.2 0.4 0.30434782608695654 );
}

relation Herida_Cabeza Colision Pupilas_Dilatadas Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8333333333333334 0.5 0.6666666666666666 0.6666666666666666 0.5 0.6666666666666666 0.5 0.5 0.5 0.75 0.5 0.5 0.8 0.75 0.8333333333333334 0.5 0.5 0.3333333333333333 0.5 0.6666666666666666 0.6 0.5 0.3333333333333333 0.16666666666666666 0.6666666666666666 0.5 0.5 0.3333333333333333 0.5 0.3333333333333333 0.5 0.5 0.5 0.5 0.5 0.09090909090909091 0.16666666666666666 0.5 0.3333333333333333 0.3333333333333333 0.5 0.3333333333333333 0.5 0.5 0.5 0.25 0.5 0.5 0.2 0.25 0.16666666666666666 0.5 0.5 0.6666666666666666 0.5 0.3333333333333333 0.4 0.5 0.6666666666666666 0.8333333333333334 0.3333333333333333 0.5 0.5 0.6666666666666666 0.5 0.6666666666666666 0.5 0.5 0.5 0.5 0.5 0.9090909090909091 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.1702127659574468 0.3829787234042553 0.44680851063829785 );
}

relation Pupilas_Dilatadas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.46153846153846156 0.4 0.1111111111111111 0.23076923076923078 0.08 0.16666666666666666 0.07692307692307693 0.2 0.05555555555555555 0.23076923076923078 0.32 0.6666666666666666 );
}

relation Signos_Vitales Colision Heridas_Internas Pupilas_Dilatadas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3333333333333333 0.3333333333333333 0.3333333333333333 0.5 0.625 0.4 0.3333333333333333 0.5 0.3333333333333333 0.3333333333333333 0.3333333333333333 0.3333333333333333 0.6 0.3333333333333333 0.25 0.6 0.5 0.3333333333333333 0.3333333333333333 0.25 0.1111111111111111 0.25 0.16666666666666666 0.14285714285714285 0.5 0.3333333333333333 0.3333333333333333 0.3333333333333333 0.3333333333333333 0.25 0.3333333333333333 0.3333333333333333 0.3333333333333333 0.5 0.3333333333333333 0.125 0.3333333333333333 0.3333333333333333 0.3333333333333333 0.25 0.125 0.2 0.3333333333333333 0.25 0.3333333333333333 0.3333333333333333 0.3333333333333333 0.3333333333333333 0.2 0.3333333333333333 0.5 0.2 0.25 0.3333333333333333 0.3333333333333333 0.25 0.3333333333333333 0.25 0.16666666666666666 0.2857142857142857 0.25 0.3333333333333333 0.3333333333333333 0.3333333333333333 0.3333333333333333 0.25 0.3333333333333333 0.1111111111111111 0.3333333333333333 0.25 0.3333333333333333 0.125 0.3333333333333333 0.3333333333333333 0.3333333333333333 0.25 0.25 0.4 0.3333333333333333 0.25 0.3333333333333333 0.3333333333333333 0.3333333333333333 0.3333333333333333 0.2 0.3333333333333333 0.25 0.2 0.25 0.3333333333333333 0.3333333333333333 0.5 0.5555555555555556 0.5 0.6666666666666666 0.5714285714285714 0.25 0.3333333333333333 0.3333333333333333 0.3333333333333333 0.3333333333333333 0.5 0.3333333333333333 0.5555555555555556 0.3333333333333333 0.25 0.3333333333333333 0.75 );
}

}
