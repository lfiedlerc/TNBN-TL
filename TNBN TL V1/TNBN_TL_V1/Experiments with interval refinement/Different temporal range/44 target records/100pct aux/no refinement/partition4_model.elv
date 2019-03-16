// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/100pct aux/no refinement/partition4_model.elv" {

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
states = ("Default" "[49-72]" "[31-49]" "[15-31]" "[0-15]");
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
states = ("Default" "[32-53]" "[18-32]" "[9-18]" "[0-9]");
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
values= table (0.2344789053920368 0.3900993855019239 0.3754217091060393 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8078521666909244 0.5996460688925097 0.07851451157128123 0.19214783330907562 0.4003539311074903 0.9214854884287188 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.27236024844720497 0.31849180069378746 0.10443568159529257 0.6427329192546584 0.15811001192875654 0.49747415413533835 0.08490683229813666 0.523398187377456 0.398090164269369 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6318338207432903 0.11265285769083239 0.6666664030491738 0.07987507173264725 0.3469455145844799 0.0671396905965508 0.09727152724892696 0.125909474491753 0.10154169883748376 0.23526417280785533 0.13121629058888276 0.18409238040567444 0.08106903748236051 0.39750441120061375 0.08105859989794678 0.2023386607955995 0.17738029719317555 0.23879683612172195 0.08627904632481291 0.23250095895665518 0.0597661018980579 0.22973866624173372 0.19015960374243257 0.2441241195186223 0.10354656820060935 0.13143229766014577 0.09096719631733775 0.25278342842216417 0.15429829389102917 0.2658469733574306 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8037076066266494 0.7803012540012967 0.06733008298217137 0.17973895760439013 0.12175883972896717 0.07945006359396765 0.02924449601456302 0.03838480144517693 0.11110310505931527 0.13852000504181677 0.11948349886557963 0.11775301314275331 0.061726289761260635 0.05357467486289845 0.22327084501624314 0.19042991407903984 0.2322149571560588 0.2418193931318515 0.04706709703916731 0.06636145677676045 0.28625345300306504 0.19967324475919493 0.22036619150980757 0.2256301859366483 0.058254510558359646 0.06137781291386753 0.3120425139392053 0.2916378785155585 0.30617651273958685 0.3353473441947793 );
}

}
