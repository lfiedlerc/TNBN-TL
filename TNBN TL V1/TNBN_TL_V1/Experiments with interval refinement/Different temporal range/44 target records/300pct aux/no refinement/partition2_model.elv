// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/300pct aux/no refinement/partition2_model.elv" {

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
states = ("Default" "[52-72]" "[38-52]" "[20-38]" "[0-20]");
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
states = ("Default" "[32-51]" "[17-32]" "[8-17]" "[0-8]");
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
values= table (0.6181974571069266 0.11265285769083239 0.659879926198395 0.08894625371522163 0.35107182168409473 0.07667401359863947 0.07446215633790851 0.11418565400843882 0.08521582944374989 0.19173840603754402 0.12553247110621907 0.14224330268364624 0.08299256946829221 0.23678097429996167 0.07343848083363388 0.21843081745465842 0.20912768299394605 0.1823717386835799 0.11564166769369938 0.392036056770234 0.07432523430767034 0.23614527663840393 0.11215877820583378 0.248239340559099 0.10870614939317325 0.1443444572305332 0.10714052921655093 0.264739246154172 0.20210924600990648 0.35047160447503534 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7998614527804955 0.780939508152209 0.08508193346170193 0.1714056242710568 0.12852575702220026 0.09024286839076981 0.03155218832225533 0.030603690151407403 0.1048301733310234 0.12311552373816477 0.11112811673937804 0.09630064805281328 0.06403398206895294 0.05645721544846847 0.2877009602964875 0.22608342650579538 0.2672867550665148 0.2591133183937981 0.04517758748143656 0.052415665688315384 0.23693185181588386 0.21118341864740817 0.20055379854290686 0.24927987402337837 0.059374789346859615 0.07958392055959969 0.2854550810949034 0.26821200683757496 0.292505572629 0.3050632911392405 );
}

}
