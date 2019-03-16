// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/300pct aux/refinement/partition3_model.elv" {

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
num-states = 3;
states = ("Default" "[28-47]" "[0-28]");
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
values= table (0.4375 0.7142857142857143 0.125 0.14285714285714285 0.045454545454545456 0.027777777777777776 0.375 0.19047619047619044 0.75 0.42857142857142855 0.18181818181818182 0.47222222222222227 0.1875 0.09523809523809522 0.125 0.42857142857142855 0.7727272727272727 0.5 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4363491758061503 0.5636508241938497 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.255976118004423 0.3512746294664897 0.3927492525290873 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6323555901261351 0.10380892478871533 0.6709392546808347 0.09610053723995268 0.5215205391486506 0.06101724568200299 0.048374264457087486 0.1250051928942779 0.045049982990123826 0.09740295934914302 0.06835420869304991 0.10390382937125378 0.08900864660104099 0.2711651107398952 0.09989344054331804 0.23571516162492614 0.12531604927059148 0.25398713846306475 0.22832652823745297 0.4980976147633535 0.18215862687310938 0.5688332825989952 0.2829104748684566 0.579167641495322 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8426630276887931 0.8315953821554076 0.07184909253136279 0.18120777645749994 0.11285564636915177 0.08147144921288066 0.020851887896665977 0.026791643748003333 0.09207846304252354 0.10327109125761261 0.11043290709097696 0.08703798767539236 0.13458945824211677 0.13969928525744596 0.8342308751652632 0.7136770056552871 0.774870898088355 0.8296386910335273 );
}

}
