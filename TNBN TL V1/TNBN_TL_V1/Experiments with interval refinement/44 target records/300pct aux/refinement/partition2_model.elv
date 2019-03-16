// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/300pct aux/refinement/partition2_model.elv" {

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
states = ("Default" "[39-59]" "[19-39]" "[0-19]");
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
states = ("Default" "[21-34]" "[6-21]");
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
values= table (0.20637580380880674 0.3549967048611043 0.438627491330089 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8226320144523862 0.595841318744096 0.09884643449156767 0.17736798554761382 0.40415868125590404 0.9011535655084323 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2554224979560429 0.29946461510775185 0.0886797675213825 0.6565150130652945 0.13260449003464256 0.4956421894647621 0.0880624889786627 0.5679308948576056 0.41567804301385547 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5555555555555556 0.2 0.5454545454545454 0.1111111111111111 0.42857142857142855 0.07407407407407407 0.2222222222222222 0.2 0.09090909090909091 0.1111111111111111 0.2857142857142857 0.1111111111111111 0.1111111111111111 0.4 0.09090909090909091 0.1111111111111111 0.14285714285714285 0.07407407407407407 0.1111111111111111 0.2 0.2727272727272727 0.6666666666666666 0.14285714285714285 0.7407407407407407 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8395565933817813 0.8217246105454649 0.06335378532160031 0.14534842598127118 0.10827071661998133 0.05875290314793427 0.03881695321408516 0.04809587844996451 0.24046752010594463 0.20792954215840273 0.18537741374925118 0.22981975793874496 0.05951932826159724 0.0702199825369482 0.3581788935843791 0.3409432933920868 0.35477401596839453 0.36838755316651767 );
}

}
