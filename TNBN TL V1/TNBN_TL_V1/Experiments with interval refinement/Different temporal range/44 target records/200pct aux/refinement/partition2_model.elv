// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/200pct aux/refinement/partition2_model.elv" {

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
states = ("Default" "[37-63]" "[8-37]");
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
states = ("Default" "[28-45]" "[4-28]");
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
values= table (0.23235124581756872 0.3709504493317111 0.39669830485072016 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8050743889131466 0.6002671869049321 0.08724467030143997 0.19492561108685338 0.399732813095068 0.9127553296985601 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.18240165631469982 0.332803394896686 0.09553035982008994 0.7299654934437543 0.16015452538631347 0.5081605402655814 0.0876328502415459 0.5070420797170005 0.39630909991432844 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6322245723457676 0.09863157659315967 0.6733217293898743 0.09496381100352282 0.5449797119543537 0.06029253030760995 0.1524922504907793 0.4700916657959119 0.16333913530506283 0.40297231772835845 0.22647128491769614 0.3968138271090835 0.21304064406800047 0.4291203738228737 0.16107053620360362 0.49986183674501294 0.22647128491769614 0.5407133468299599 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8494280967485999 0.8327313377460555 0.06974851788807133 0.17094562103515692 0.11394120150545707 0.08232434366036687 0.020226076556158226 0.020586912277408557 0.0904411163164375 0.1090861024953741 0.10941646179956827 0.09523049263901852 0.12809848485566877 0.1441083859418599 0.8376570058831949 0.7177865544195615 0.7744969158753753 0.820280834322455 );
}

}
