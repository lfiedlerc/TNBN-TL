// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/500pct aux/no refinement/partition4_model.elv" {

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
states = ("Default" "[52-72]" "[35-52]" "[18-35]" "[0-18]");
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
states = ("Default" "[31-53]" "[16-31]" "[8-16]" "[0-8]");
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
values= table (0.2475406393715161 0.39938189355130777 0.35307746707717613 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.82543159443743 0.6016993743682528 0.0892307407094851 0.17456840556257014 0.3983006256317471 0.9107692592905149 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.19565482147490376 0.2750770098144205 0.16158395015180682 0.7306436752394719 0.1357790117546269 0.4332724783204016 0.07370150328562428 0.5891439784309527 0.40514357152779157 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6361998215863429 0.09006239750717361 0.6867609246414584 0.07971707445093444 0.6043209453139615 0.07595382336008301 0.07917737841292709 0.21475529660557532 0.0860748401127327 0.17679047889407154 0.08656513063540562 0.18243344951673096 0.0886841267163848 0.2747899782035949 0.07213843125692104 0.21626692956473403 0.09509166302924486 0.2218712844422443 0.09687241115537969 0.24616026653898396 0.07036919262749702 0.25037715740211736 0.10710419654548857 0.23699459357323288 0.09906626212896563 0.1742320611446723 0.08465661136139073 0.27684835968814264 0.10691806447589948 0.2827468491077089 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7980949046284207 0.7939011819454924 0.06700252606010274 0.17037437961415886 0.11506590354386605 0.07934472593526024 0.028504697290209963 0.0361519006349803 0.10391850007087482 0.12882936262908656 0.11114778512905116 0.12250689048610912 0.05326625141314639 0.056058088383869616 0.34581672801540136 0.24288895591680026 0.28686851242332456 0.29224409100860593 0.060874994531385423 0.05304093439401902 0.20192185244815938 0.19555900097419116 0.21843227107313265 0.20671908350792886 0.059259152136837495 0.060847894641638776 0.2813403934054617 0.26234830086576316 0.2684855278306257 0.29918520906209567 );
}

}
