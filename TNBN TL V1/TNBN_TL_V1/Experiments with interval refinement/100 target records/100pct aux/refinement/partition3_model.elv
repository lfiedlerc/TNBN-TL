// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/100pct aux/refinement/partition3_model.elv" {

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
states = ("Default" "[38-59]" "[18-38]" "[0-18]");
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
states = ("Default" "[23-40]" "[4-23]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.23229733639120959 0.3922338883282765 0.375468775280514 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8716930813713555 0.5620144385139181 0.09514046380211799 0.12830691862864455 0.4379855614860819 0.904859536197882 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.22487655019035774 0.25811492252831847 0.1253237696752341 0.7062931131968788 0.14306074672741528 0.4213986849970114 0.06883033661276339 0.5988243307442662 0.4532775453277546 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5833333333333334 0.08333333333333333 0.125 0.06666666666666667 0.1875 0.15 0.10416666666666667 0.7 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7528312698088627 0.8406409710971458 0.08834425605258939 0.199614469572628 0.12879056522673546 0.12107859442385957 0.7806090475866406 0.7683620595325199 0.08834425605258939 0.24425732671548514 0.10965791216551096 0.08536430870957384 0.7706884126660056 0.7275457330019076 0.08834425605258939 0.21449542195358037 0.10200485094102116 0.09344254000209085 0.0817837710191263 0.05811917524692331 0.32186662360273477 0.2350908172331519 0.30474404097007196 0.2959633304491085 0.09324115477567774 0.07353585411666035 0.3297094884236683 0.2236565429290688 0.269256679788656 0.2815643206521508 0.08321791475830441 0.08718536543938957 0.32546289872678763 0.21619392056323478 0.27961525599441256 0.2734062180946075 0.11631469656053518 0.07124285998009955 0.4603232158787715 0.42172780190679915 0.428434269363807 0.4143486626287519 0.08227160715500977 0.11949576293957308 0.427000812876554 0.4202578588909116 0.4487611329810932 0.46269805559398025 0.10356007169922327 0.1344107717190589 0.4369474275724276 0.425181377107695 0.4516861827602049 0.4622723555941719 );
}

}
