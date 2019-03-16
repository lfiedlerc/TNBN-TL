// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/500pct aux/refinement/partition3_model.elv" {

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
states = ("Default" "[54-63]" "[37-54]" "[0-37]");
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
states = ("Default" "[42-49]" "[30-42]" "[20-30]" "[0-20]");
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
values= table (0.6312417436414199 0.09902443373601681 0.6734967426863322 0.09375910097002177 0.5442314126346257 0.05991892245711168 0.04160349558917314 0.10543331094578526 0.05007718670455029 0.12044973974449076 0.045576858736537426 0.11436037850521732 0.109681942916911 0.291379332068352 0.08212658619546247 0.24663518138157633 0.13862961199030133 0.24035062601096524 0.2155817498711699 0.5022459539599224 0.19229639694547307 0.5372440772730461 0.2696630808578464 0.5834317615266172 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8497773030978062 0.8342902946621552 0.0686572480468015 0.1722360243321837 0.11362374118799676 0.08265610093853672 0.0038031062506884506 0.005649194500153799 0.0439140000920958 0.03085962189989666 0.03987786849460955 0.03465116119715268 0.013310871877409577 0.015064518667076799 0.034765250072909176 0.07624141881150939 0.06344206351415156 0.052888614458812 0.03612950938154028 0.0357782318343074 0.16284775034152194 0.14159120636423173 0.18851356015633605 0.211554457835248 0.09507765626721128 0.1073346955029222 0.6879860014428342 0.577256456715714 0.5927301362607874 0.6164259202440847 );
}

}
