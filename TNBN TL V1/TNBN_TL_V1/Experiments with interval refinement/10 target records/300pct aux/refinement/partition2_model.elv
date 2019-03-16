// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/300pct aux/refinement/partition2_model.elv" {

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
states = ("Default" "[41-55]" "[17-41]" "[5-17]");
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
states = ("Default" "[23-40]" "[4-23]");
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
values= table (0.23910902803139267 0.4289737916041485 0.33191718036445883 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8226320144523862 0.5386984616012389 0.12170357734871054 0.17736798554761382 0.46130153839876115 0.8782964226512895 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.29949502236329534 0.3710824672695371 0.15326881191132144 0.42146154955994797 0.12709542448373598 0.3740628117895829 0.27904342807675664 0.5018221082467269 0.4726683762990957 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6559082108413191 0.07355291173155855 0.7010942112184023 0.07638268808956306 0.6348088186830098 0.06834829329716334 0.08571462131372158 0.27014467869008224 0.07981534503307895 0.2358522778628437 0.1058335802743335 0.23374774003296978 0.13689673332119562 0.35301114454593563 0.11624114008173243 0.38264145779146674 0.15025755224133766 0.37733563748179405 0.07276493032387875 0.16739026102882393 0.057852733312567295 0.17482756261161841 0.06598266424510915 0.18699819202637583 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8544975755831018 0.8416367338200211 0.05240110781602363 0.14230640330310712 0.10014443277310923 0.05985874264971885 0.05348197221810313 0.058284505506096346 0.3630190000632859 0.3048892857199008 0.26171741811625904 0.3122551752420144 0.06449296649830083 0.07818653177647071 0.42607863857193184 0.40959873738128094 0.45073555342244614 0.45741163508424815 );
}

}
