// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/300pct aux/no refinement/partition3_model.elv" {

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
states = ("Default" "[53-73]" "[36-53]" "[18-36]" "[0-18]");
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
states = ("Default" "[31-52]" "[18-31]" "[9-18]" "[0-9]");
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
values= table (0.238734224540973 0.39009938550192397 0.3711663899571031 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8209834798222376 0.6039938949794662 0.09170895601572568 0.17901652017776246 0.3960061050205338 0.9082910439842744 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.14151138716356104 0.32871436798157216 0.10747396784800876 0.7776708074534161 0.15811001192875654 0.49671458257215934 0.08081780538302277 0.5131756200896713 0.3958114495798319 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6110545999640695 0.11598619102416571 0.6633984291929647 0.0804245222820978 0.3421432502555232 0.0682601387758225 0.07001228439364418 0.17787802071346376 0.08025320685931352 0.1925377332925675 0.12550200487459703 0.15985820803530734 0.09725263534310956 0.2433325661680092 0.09324970236958634 0.19078825965523177 0.1789637550121865 0.19947599635123175 0.09154792522016819 0.29051783659378594 0.08018007630107532 0.2552436148149435 0.17533139397751396 0.27377213713659143 0.13013255507900862 0.17228538550057537 0.08291858527706013 0.2810058699551594 0.17805959588017928 0.29863351970104707 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8044069073259501 0.7974441111441538 0.07549632023992872 0.18807229093772343 0.12413979210991954 0.08595161158158374 0.039734006504073514 0.03076575382612931 0.1106291754938656 0.13372224569364272 0.12067397505605582 0.11580725149365662 0.062607994378406 0.046413049568361765 0.24798592179849338 0.17936819345015098 0.2274268065017587 0.2241285845087232 0.044785393353801696 0.06636808635350806 0.2677106368211143 0.19201895194012686 0.20472653213270003 0.24182306269973308 0.04846569843776871 0.05900899910784708 0.29817794564659794 0.30681831797835596 0.3230328941995659 0.3322894897163032 );
}

}
