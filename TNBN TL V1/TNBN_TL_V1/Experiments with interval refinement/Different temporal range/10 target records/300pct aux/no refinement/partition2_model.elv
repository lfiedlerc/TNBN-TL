// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/300pct aux/no refinement/partition2_model.elv" {

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
states = ("Default" "[52-69]" "[36-52]" "[20-36]" "[1-20]");
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
states = ("Default" "[31-53]" "[16-31]" "[8-16]" "[0-8]");
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
values= table (0.23854140319787487 0.4062472491850261 0.3552113476170991 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8422200930007382 0.5930079139489792 0.08665877902740295 0.15777990699926178 0.4069920860510208 0.9133412209725971 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.21204734559943747 0.33799672283037646 0.13456290086724867 0.6435397867104182 0.14240717545725953 0.43404240686849377 0.14441286769014414 0.519596101712364 0.4313946922642574 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6337486508700955 0.10418044324965074 0.6793608927104834 0.09287366270486912 0.582847037549197 0.10544847580680436 0.06771522166684966 0.17526628847212228 0.06991180000284604 0.16963715030573495 0.07591692373151793 0.16486275366515055 0.09546962312862704 0.30200060327674527 0.0824046682811727 0.19377142713791465 0.1359424529305393 0.21800909840506535 0.09176934285080753 0.22244618136404049 0.07003893340500501 0.2536213289982252 0.09339644718646951 0.22670321982255898 0.11129716148362032 0.19610648363744126 0.09828370560049296 0.29009643085325615 0.11189713860227635 0.2849764523004208 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.780642863224955 0.7579837753871076 0.06875957066026221 0.18099190297622414 0.12089678187137425 0.07248567999705224 0.02088324570044065 0.04457738870968668 0.10859004886215573 0.1284321026602117 0.11043196490626296 0.09854648120556339 0.06628982426331283 0.06681876999544722 0.3492140559112508 0.2357913796120133 0.26985225553400183 0.3046335684530685 0.055395349489781115 0.061037147487375695 0.20941644499598416 0.18810532587651962 0.19788969634238587 0.22274541154819227 0.07678871732151048 0.06958291842038279 0.2640198795703471 0.2666792888750313 0.3009293013459752 0.30158885879612357 );
}

}
