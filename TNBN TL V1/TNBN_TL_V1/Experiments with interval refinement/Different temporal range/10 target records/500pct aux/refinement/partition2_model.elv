// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/500pct aux/refinement/partition2_model.elv" {

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
states = ("Default" "[49-65]" "[22-49]" "[0-22]");
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
states = ("Default" "[28-41]" "[10-28]" "[0-10]");
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
values= table (0.2398483316792084 0.39938189355130777 0.3607697747694838 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8204315944374299 0.6016993743682528 0.08423074070948508 0.17956840556257012 0.3983006256317471 0.9157692592905149 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.21201092913535927 0.3364124135411286 0.15340589632157908 0.6570411907674223 0.1357790117546269 0.41691637065994613 0.1309478800972185 0.5278085747042446 0.42967773301847484 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6519694710668796 0.07206859125619824 0.6981518830972294 0.07349033123378869 0.6567216664333857 0.06644216264112397 0.07858753879134976 0.22411117855888227 0.07783504901266411 0.22023590487065678 0.08110422166683745 0.22076117196061598 0.14033489069883884 0.45377883261922447 0.1290922764112478 0.3835142481368333 0.14900543050418974 0.3835257648468328 0.12723696756694725 0.24818923906520848 0.0930223756492815 0.3208609303719051 0.11128253670566068 0.3274000431619305 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8509501380096158 0.8387567919451211 0.059261264871630685 0.14860364418422087 0.0945093533994483 0.06103217812620802 0.007452493099519209 0.009831902930175542 0.043187606602699595 0.0762167043415872 0.049252629313000715 0.03999660093174367 0.055893698246394063 0.09045350695761499 0.557683441782686 0.3624940816246221 0.44137933192035256 0.4894822114027678 0.08384054736959111 0.05899141758105326 0.3379899647167794 0.41082662584123836 0.41296435347054444 0.4075844094949117 );
}

}
