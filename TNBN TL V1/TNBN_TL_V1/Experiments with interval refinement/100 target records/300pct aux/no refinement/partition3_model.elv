// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/300pct aux/no refinement/partition3_model.elv" {

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
states = ("Default" "[27-44]" "[13-27]" "[0-13]");
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
values= table (0.23223822892758383 0.40358170795963766 0.3641800631127785 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.9052407101045601 0.5577460806488579 0.09048406515358859 0.0947592898954399 0.4422539193511421 0.9095159348464115 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.22787717020151013 0.24616760884781866 0.12178843733471252 0.7024238926561823 0.1520783961680797 0.43702356094280065 0.06969893714230752 0.6017539949841016 0.44118800172248684 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.64 0.25 0.5217391304347826 0.16 0.25 0.05128205128205128 0.16 0.25 0.08695652173913043 0.04 0.25 0.10256410256410256 0.08 0.25 0.21739130434782608 0.12 0.375 0.1794871794871795 0.12 0.25 0.17391304347826086 0.68 0.125 0.6666666666666666 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5882352941176471 0.7727272727272727 0.17647058823529413 0.5 0.08695652173913043 0.05405405405405406 0.17647058823529413 0.045454545454545456 0.17647058823529413 0.125 0.17391304347826086 0.08108108108108109 0.058823529411764705 0.09090909090909091 0.11764705882352941 0.125 0.08695652173913043 0.08108108108108109 0.17647058823529413 0.09090909090909091 0.5294117647058824 0.25 0.6521739130434783 0.7837837837837838 );
}

}
