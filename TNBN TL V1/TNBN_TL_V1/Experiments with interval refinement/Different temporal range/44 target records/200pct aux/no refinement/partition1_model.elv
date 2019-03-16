// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/200pct aux/no refinement/partition1_model.elv" {

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
states = ("Default" "[52-71]" "[37-52]" "[20-37]" "[0-20]");
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
states = ("Default" "[31-51]" "[16-31]" "[7-16]" "[0-7]");
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
values= table (0.5881974571069267 0.1249566551591868 0.6607840501079973 0.09871993994460408 0.34690515501742797 0.0732983693560538 0.08135531302959491 0.14554583812811658 0.0788385361752941 0.1892648038198244 0.09324344157035405 0.1538703602848867 0.08643395023099262 0.24178059071729957 0.09068425455375533 0.20381217627858927 0.15826270409099247 0.19311560942732264 0.10130255625446959 0.2818534714230917 0.10655828447407403 0.21813657660710548 0.20868647954503758 0.24840482846971348 0.14271072337801627 0.20586344457230532 0.06313487468887918 0.2900665033498768 0.19290221977618785 0.33131083246202325 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8113999143189571 0.7828986565986993 0.07494686969047819 0.17256024587526372 0.12823452260704846 0.08752023903256416 0.02924449601456302 0.03318999625037174 0.10183796670265682 0.12780571932753101 0.12015067313035549 0.11659156521914685 0.07485121954354716 0.05849736879533495 0.31114402382454376 0.22241891161448507 0.2929234396730904 0.2831478004562615 0.029728537986896376 0.06123236704981835 0.2939019790922345 0.24959066917112468 0.20684632733323713 0.2635634829305716 0.054775832136036345 0.06418161130577574 0.21816916069008685 0.2276244540115955 0.25184503725626844 0.24917691236145603 );
}

}
