// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/500pct aux/refinement/partition0_model.elv" {

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
states = ("Default" "[44-54]" "[19-44]" "[4-19]");
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
states = ("Default" "[32-40]" "[13-32]" "[5-13]");
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
values= table (0.2675908872624527 0.4825499362560489 0.24985917648149836 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8262691434578031 0.4501602298633812 0.24746768486210907 0.1737308565421969 0.5498397701366189 0.7525323151378909 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.1647188957822344 0.24496633813121146 0.26753454645366875 0.6022579714326937 0.17527517241946228 0.38002144314133063 0.23302313278507192 0.5797584894493263 0.3524440104050006 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6373466166984665 0.08151716224302988 0.6936708130436713 0.07658595370357393 0.6468438899667482 0.0673087106464206 0.05773586201815459 0.2242389740617603 0.060907557640439626 0.1968518315748195 0.0630635910773664 0.20486860691003478 0.14433965504538648 0.3641640938762987 0.13793770406805445 0.379387166307834 0.15315443547360408 0.3719982599155895 0.09742926715563587 0.1811850910419023 0.05911615888630905 0.21474745262707584 0.08648721062038818 0.22463663038381007 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8553528392858476 0.8594085105407904 0.06568578296757005 0.1659649208873833 0.11052388841937492 0.056939046141128394 0.02746465076850995 0.026243744699052465 0.17787905285809721 0.14887077756203698 0.15960357647313636 0.2079754194821846 0.05126734810121857 0.06186025536205224 0.39528678412910495 0.35513751755763034 0.33534684045479213 0.3245133700540984 0.03295758092221194 0.037491063855789236 0.165301746090353 0.19012412556115565 0.20443604177457916 0.1936322871041029 );
}

}
