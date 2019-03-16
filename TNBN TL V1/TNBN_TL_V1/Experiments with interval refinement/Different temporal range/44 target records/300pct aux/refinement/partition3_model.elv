// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/300pct aux/refinement/partition3_model.elv" {

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
states = ("Default" "[53-64]" "[36-53]" "[0-36]");
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
states = ("Default" "[33-49]" "[22-33]" "[0-22]");
}

// Links of the associated graph:

link Colision Pupilas_Dilatadas;

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Colision;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2222222222222222 0.6923076923076923 0.0909090909090909 0.25 0.10000000000000002 0.06666666666666667 0.5555555555555556 0.15384615384615385 0.8181818181818181 0.5 0.20000000000000004 0.4666666666666667 0.2222222222222222 0.15384615384615385 0.0909090909090909 0.25 0.6999999999999998 0.4666666666666667 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4461176135942578 0.5538823864057423 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.26329042471405634 0.35099032833165417 0.3857192469542895 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6312417436414199 0.09902443373601681 0.6734967426863322 0.09375910097002177 0.5442314126346257 0.05991892245711168 0.057920144977787434 0.12708497460986712 0.059006612767530324 0.1436957028060219 0.054616896833040725 0.15508465841338892 0.09846424646223866 0.3091768785284827 0.0885099191512955 0.2318290671937153 0.12806720636712998 0.18380403960105354 0.21044319341929438 0.4628169224598146 0.177019838302591 0.5288001863261607 0.2712011428950988 0.5992777541159349 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8497773030978062 0.8342902946621552 0.0686572480468015 0.1722360243321837 0.11362374118799676 0.08265610093853672 0.013481524080966114 0.016947583500461397 0.0607397446925999 0.08222820950342546 0.07493077651812813 0.08206853967746691 0.021185252127232466 0.030129037334153595 0.154610259217527 0.09684655785959 0.14255123337595105 0.12948591815778113 0.11362998868242866 0.11675001966984519 0.7141521497190534 0.6468619147602803 0.6670666690028478 0.7039656959000495 );
}

}
