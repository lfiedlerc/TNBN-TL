// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/440 records/aux200pct/partition4_model.elv" {

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
states = ("Default" "[31-57]" "[12-31]" "[0-12]");
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
states = ("Default" "[22-44]" "[0-22]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Signos_Vitales Heridas_Internas;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.24604966139954854 0.3860045146726862 0.36794582392776526 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8636363636363636 0.5813953488372093 0.12195121951219512 0.13636363636363635 0.4186046511627907 0.8780487804878049 );
}

relation Heridas_Internas Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3373493975903614 0.2222222222222222 0.28 0.5 0.2 0.09174311926605505 0.3333333333333333 0.14285714285714285 0.05426356589147287 0.6506024096385542 0.5555555555555556 0.6 0.36 0.1 0.11926605504587157 0.5714285714285714 0.47619047619047616 0.4108527131782946 0.012048192771084338 0.2222222222222222 0.12 0.14 0.7 0.7889908256880734 0.09523809523809523 0.38095238095238093 0.5348837209302325 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.75 0.07758620689655173 0.046296296296296294 0.07758620689655173 0.13425925925925927 0.22844827586206898 0.06944444444444445 0.6163793103448276 );
}

relation Signos_Vitales Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5953488372093023 0.08225108225108226 0.06046511627906977 0.12987012987012986 0.34418604651162793 0.7878787878787878 );
}

}
