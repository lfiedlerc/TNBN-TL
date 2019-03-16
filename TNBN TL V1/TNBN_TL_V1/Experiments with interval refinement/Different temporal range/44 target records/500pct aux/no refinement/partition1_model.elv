// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/500pct aux/no refinement/partition1_model.elv" {

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
num-states = 5;
states = ("Default" "[53-73]" "[37-53]" "[19-37]" "[0-19]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 5;
states = ("Default" "[33-52]" "[19-33]" "[9-19]" "[0-9]");
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
values= table (0.24298954368990916 0.38584406635298774 0.3711663899571031 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8146897735285313 0.6050290916668368 0.08545895601572567 0.18531022647146875 0.3949709083331632 0.9145410439842744 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.20576752440106477 0.323138422188235 0.10747396784800876 0.6988110026619343 0.16089798482542508 0.5111464422725612 0.09542147293700089 0.51596359298634 0.38137958987943005 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5881974571069267 0.11265285769083239 0.6607840501079973 0.08939888125645679 0.34690515501742797 0.06793334139020159 0.06905151556124048 0.1332420406597622 0.08291264129726578 0.20262054026323656 0.12788295725554943 0.1545370648036827 0.10978698065549017 0.2572742616033756 0.07235237152366361 0.18343546515869263 0.12362318840579709 0.1874668875274616 0.0996570703922228 0.3205462217107787 0.11033521508591944 0.2469066882226003 0.28707943496606125 0.2756686366653189 0.13330697628411994 0.17628461833525128 0.07361572198515381 0.27763842509901376 0.11450926435516418 0.3143940696133354 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8113999143189571 0.7863940536067545 0.06678063243272082 0.17963139384558235 0.12499668116800783 0.09021844023176469 0.02924449601456302 0.0296945992423165 0.09911588761673769 0.10305670143141579 0.10719930737419293 0.11119516282074576 0.05229809246750245 0.051963997103735414 0.2367775115639188 0.1801411775376394 0.21132147968942364 0.20163123574182867 0.060708923602909894 0.07375295768091958 0.3149846849816642 0.2326124846986531 0.257068117414811 0.26068318090969655 0.04634857359606756 0.05819439236627404 0.28234128340495857 0.3045582424867094 0.2994144143535646 0.33627198029596433 );
}

}
