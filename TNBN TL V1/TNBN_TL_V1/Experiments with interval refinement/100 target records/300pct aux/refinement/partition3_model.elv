// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/300pct aux/refinement/partition3_model.elv" {

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
states = ("Default" "[29-49]" "[5-29]");
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
values= table (0.6589288763729021 0.10252621425380491 0.67574071828167 0.0882948035249736 0.5728239816692813 0.06427805159873892 0.10770667061908354 0.3493161441527107 0.12790227223334125 0.25971955498797417 0.15140415839569776 0.2581301926624169 0.14181378298179334 0.3421506847854756 0.13510803404930416 0.4406276588071837 0.17663818479498072 0.42125413385880534 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5882352941176471 0.7727272727272727 0.17647058823529413 0.5 0.08695652173913043 0.05405405405405406 0.17647058823529413 0.045454545454545456 0.17647058823529413 0.125 0.17391304347826086 0.08108108108108109 0.058823529411764705 0.09090909090909091 0.11764705882352941 0.125 0.08695652173913043 0.08108108108108109 0.17647058823529413 0.09090909090909091 0.5294117647058824 0.25 0.6521739130434783 0.7837837837837838 );
}

}
