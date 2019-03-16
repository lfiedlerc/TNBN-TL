// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/300pct aux/no refinement/partition3_model.elv" {

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
num-states = 5;
states = ("Default" "[47-73]" "[28-47]" "[12-28]" "[0-12]");
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
states = ("Default" "[33-51]" "[19-33]" "[9-19]" "[0-9]");
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
values= table (0.23661470281184155 0.38440286737244955 0.37898242981570884 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8371451893289417 0.5807427272771772 0.08836652683200669 0.16285481067105834 0.4192572727228228 0.9116334731679933 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.19489009186351708 0.2888893217529235 0.10995207630296212 0.7238139763779528 0.16650904183912174 0.47541347370641174 0.08129593175853018 0.5446016364079548 0.41463444999062615 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6216148952227445 0.1233207299030084 0.6440629402246195 0.09385510428066925 0.3258790436005626 0.06586067754749439 0.09551171253815674 0.22279960545783334 0.10073092251089322 0.23534783341997756 0.15962427164958812 0.20445111684581502 0.09879412240615952 0.3226187736314319 0.093063663976561 0.1950033250899136 0.22880249146071935 0.2526317225833051 0.12408776045567828 0.15893802400131518 0.09899906159341981 0.24123995713845833 0.18875828812537676 0.23451141115246193 0.05999150937726106 0.17232286700641136 0.06314341169450653 0.2345537800709813 0.09693590516375328 0.24254507187092356 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7836037069028333 0.797287672179533 0.09164651938870173 0.23027581864591135 0.12774736709065435 0.08449669917025014 0.031820372420340894 0.037523148908481255 0.09975007165038403 0.11377005995975364 0.10121317201742618 0.09718751712422599 0.06439867154917145 0.043622947110645995 0.22258891105581552 0.14974671799330952 0.23258440532732402 0.20794181945081344 0.07251700811576027 0.05473913380776156 0.2714353271454079 0.23172781407048487 0.20123082665831585 0.2389983156971831 0.04766024101189415 0.06682709799357811 0.3145791707596908 0.2744795893305406 0.33722422890627957 0.3713756485575273 );
}

}
