// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/300pct aux/refinement/partition4_model.elv" {

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
states = ("Default" "[29-47]" "[14-29]" "[0-14]");
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
states = ("Default" "[37-46]" "[24-37]" "[0-24]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

link Pupilas_Dilatadas Herida_Cabeza;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.24623371089018256 0.4062472491850261 0.34751903992479144 );
}

relation Herida_Cabeza Colision Pupilas_Dilatadas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8422200930007382 0.8172200930007383 0.8338867596674049 0.8172200930007383 0.6251507710918365 0.6001507710918365 0.6001507710918365 0.5701507710918364 0.11665877902740295 0.11665877902740295 0.09999211236073628 0.09999211236073628 0.15777990699926178 0.18277990699926178 0.1661132403325951 0.18277990699926178 0.37484922890816363 0.3998492289081636 0.3998492289081636 0.4298492289081636 0.883341220972597 0.883341220972597 0.9000078876392638 0.9000078876392638 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.195691237938982 0.27666131910366837 0.1427409546974764 0.7171422711824681 0.14240717545725953 0.45039851452894925 0.08716649087854995 0.5809315054390721 0.4068605307735742 );
}

relation Pupilas_Dilatadas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4225292773568287 0.4628576283432442 0.3772340898740221 0.3405085985240768 0.20340317750237444 0.23724415623846776 0.14138076312987985 0.16588220301164516 0.19177235962609476 0.09359008263527259 0.16588220301164516 0.19177235962609476 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8313966121855307 0.835399735577381 0.06270554514339584 0.1624020432841916 0.1040776522090982 0.06776380797584144 0.003746741951432651 0.011222745301542204 0.031428019196375286 0.03874351782165633 0.027651924314534004 0.03119688044175333 0.013113596830014278 0.024315948153341444 0.09613276460067734 0.09224647100394363 0.09217308104844668 0.09726086255370157 0.14986967805730603 0.1271911134174783 0.8078849640479999 0.7047630384701294 0.7742538808069521 0.8019433384144828 );
}

}
