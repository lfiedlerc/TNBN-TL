// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/100pct aux/no refinement/partition3_model.elv" {

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
states = ("Default" "[48-72]" "[30-48]" "[14-30]" "[0-14]");
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
states = ("Default" "[31-53]" "[17-31]" "[8-17]" "[0-8]");
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
values= table (0.22514993648859982 0.40482933640208757 0.3700207271093126 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7800743889131467 0.6209021075398526 0.11295895601572568 0.21992561108685338 0.3790978924601473 0.8870410439842744 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.1824016563146998 0.2919131257455473 0.11950051759834368 0.6754451345755693 0.15197647155608573 0.4630402432712215 0.14215320910973084 0.556110402698367 0.4174592391304347 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5881974571069266 0.11598619102416571 0.6623883281828636 0.09250590081917255 0.33023848835076136 0.08024018543092847 0.11941938351714228 0.21006674338319908 0.10826682002371038 0.24133785631417068 0.17129700972298662 0.19868847626574374 0.09257221555481901 0.2954062140391255 0.0899892923477672 0.22705446167820947 0.19712896716198863 0.24131719639872912 0.09825316934313381 0.2654131185270426 0.05860496843447337 0.2652472931536379 0.12421757475692534 0.2344509962462653 0.10155777447797823 0.1131277330264672 0.08075059101118537 0.17385448803480955 0.17711796000733812 0.24530314565833333 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7698614527804956 0.7574441111441538 0.067971108623197 0.17473895760439012 0.14080645877658624 0.10275833427065938 0.04155218832225533 0.04409908715946265 0.1290518230080332 0.13705557902697607 0.12900730838938917 0.12421061283819446 0.06510625415208947 0.0699526124565237 0.26041724031538305 0.2155972802199726 0.26393268716912743 0.27804078666170606 0.06410531539830007 0.0625043961159023 0.24634813156868254 0.2096122236045722 0.23277018475138442 0.20177163276430432 0.05937478934685962 0.06599979312395754 0.2962116964847042 0.26299595954408905 0.2334833609135129 0.29321863346513577 );
}

}
