// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/300pct aux/refinement/partition3_model.elv" {

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
states = ("Default" "[33-54]" "[5-33]");
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
states = ("Default" "[20-34]" "[6-20]");
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
values= table (0.23190771870242377 0.4315924495419554 0.3364998317556209 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8862683780887498 0.6107481510422327 0.11670357734871055 0.11373162191125019 0.3892518489577674 0.8832964226512895 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.1452411869379118 0.28844648400593875 0.12086254396481226 0.7850598759197808 0.127095424483736 0.4648003620398085 0.06969893714230752 0.5844580915103252 0.41433709399537927 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6472112833006687 0.08457288381513768 0.699713436246808 0.07354166573463912 0.6186719115288127 0.06674158363283289 0.11844073612706454 0.3937320929827365 0.12108329183596449 0.30771651816670914 0.1512989363593041 0.32279368164670835 0.17354418020757054 0.3855293410455961 0.13346069500141863 0.4748098963109974 0.1738910852274355 0.46161168981601813 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8430486568738448 0.8373141797064626 0.0524410869089019 0.1610627116955569 0.10509611344537814 0.06420925235428347 0.04669161820598883 0.050619868544571886 0.27509774896193173 0.24550588508729665 0.22332430921201515 0.25872850114441714 0.05119201514150583 0.06320168558166202 0.32773991080032605 0.3283452941658323 0.34703633661723216 0.33433098524505855 );
}

}
