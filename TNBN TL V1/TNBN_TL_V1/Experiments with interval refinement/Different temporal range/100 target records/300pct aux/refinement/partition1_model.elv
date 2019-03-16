// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/300pct aux/refinement/partition1_model.elv" {

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
states = ("Default" "[53-62]" "[36-53]" "[0-36]");
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
states = ("Default" "[27-47]" "[0-27]");
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
values= table (0.5 0.7142857142857143 0.05 0.15384615384615385 0.1904761904761905 0.02941176470588235 0.4375 0.21428571428571427 0.8 0.3076923076923077 0.04761904761904762 0.2941176470588235 0.0625 0.07142857142857142 0.15 0.5384615384615384 0.761904761904762 0.676470588235294 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4310970749658142 0.5689029250341858 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.26637833714450626 0.33740500394637873 0.3962166589091151 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6334625616966394 0.10116380868771901 0.6801586043140866 0.09623097947549851 0.524778435818769 0.0597503489546345 0.04138325916328264 0.10349073418094493 0.04095530066709866 0.10702527874632253 0.0432019603801119 0.11655987409653293 0.108384726380026 0.29130725176858574 0.10141312546138719 0.2160325070990585 0.16298921416133128 0.2389477418978925 0.21479882137132425 0.5021217102853254 0.17552271714470855 0.5787292850727072 0.26706666416796454 0.5827993704826646 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8452079645824695 0.826089898882707 0.06991202872251136 0.17833667552854174 0.11910929171322848 0.08304570203697897 0.01741410398447218 0.032849685766599794 0.09505909125280947 0.12499576300684376 0.12347212856739266 0.10352709815711525 0.1354430309903392 0.1391280808938344 0.8331649762746242 0.6948293884792197 0.7555757121288208 0.8115785016245286 );
}

}
