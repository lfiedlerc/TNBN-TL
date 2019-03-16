// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/500pct aux/refinement/partition3_model.elv" {

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
states = ("Default" "[35-59]" "[0-35]");
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
states = ("Default" "[34-50]" "[22-34]" "[0-22]");
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
values= table (0.6318492023005791 0.10380892478871533 0.6699366067862338 0.09507742714342117 0.5215205391486506 0.06043090188399077 0.14559636067208737 0.38937957060904094 0.13841368102512777 0.3332862154494096 0.20335377086182352 0.34444073228114 0.22047448901773234 0.5047512952339419 0.18952027094209803 0.5696164409499002 0.27313202556931193 0.593090254992969 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8426630276887931 0.8315953821554076 0.07319192453306039 0.1817907112799423 0.11285564636915177 0.08280239774553669 0.01851023203661258 0.02058278662545018 0.06423422305216413 0.09071056415965162 0.07468771765680651 0.08338160020495121 0.02776534805491887 0.029938598727927535 0.15232687180941779 0.09071056415965162 0.14026717706278297 0.12144711334199416 0.1092103690160142 0.11601207007071919 0.7084117170895815 0.6349739491175614 0.6703678072610927 0.7105562452248017 );
}

}
