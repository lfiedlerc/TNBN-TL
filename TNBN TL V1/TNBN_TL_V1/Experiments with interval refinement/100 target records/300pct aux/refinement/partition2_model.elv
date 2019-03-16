// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/300pct aux/refinement/partition2_model.elv" {

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
states = ("Default" "[18-41]" "[3-18]");
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
states = ("Default" "[27-44]" "[12-27]" "[0-12]");
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
values= table (0.2361217240732149 0.4346496691246862 0.32922860680209887 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8392986811190528 0.5992698901726674 0.10420357734871052 0.16070131888094716 0.4007301098273326 0.8957964226512894 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.22016447843024098 0.26576209644338233 0.18331826037081175 0.7387837252921656 0.13519699147036326 0.35402984614992267 0.04105179627759342 0.5990409120862543 0.4626518934792656 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6821639624182559 0.07938124017977846 0.7247365634887339 0.06637168342418134 0.5721064333586037 0.0649412875110268 0.10405346468449954 0.3267916490234052 0.1018097641890984 0.28008849497274557 0.15013809355838467 0.3228845454303241 0.10405346468449954 0.2539637958124749 0.07352927413657108 0.3454424771330529 0.11635702250774813 0.33408285336432375 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7333333333333333 0.6521739130434783 0.08333333333333333 0.4 0.0625 0.12903225806451613 0.06666666666666667 0.043478260869565216 0.125 0.2 0.0625 0.0967741935483871 0.06666666666666667 0.043478260869565216 0.25 0.13333333333333333 0.25 0.06451612903225806 0.13333333333333333 0.2608695652173913 0.5416666666666666 0.26666666666666666 0.625 0.7096774193548387 );
}

}
