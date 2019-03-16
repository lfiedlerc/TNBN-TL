// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/300pct aux/refinement/partition3_model.elv" {

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
states = ("Default" "[44-54]" "[19-44]" "[6-19]");
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
values= table (0.17757056649293113 0.49051225314261004 0.33191718036445883 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7226320144523861 0.6783810012837785 0.20170357734871056 0.2773679855476138 0.32161899871622146 0.7982964226512894 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2554224979560429 0.18928330408962074 0.15326881191132144 0.509606598374453 0.11056822783101633 0.3740628117895829 0.23497090366950418 0.7001484680793629 0.4726683762990957 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6544201156032239 0.07355291173155855 0.7058561159803071 0.0748520758446651 0.6339159615401526 0.06877346336519055 0.06120287755864192 0.20053684737116534 0.05630303325600563 0.18370558064622927 0.08317115006153956 0.16296464391109164 0.14589776872565144 0.3994163654252136 0.12470858767919003 0.36741116129245854 0.1486602445981849 0.4024228961886141 0.08284025851371735 0.16076094376035568 0.0652483749882682 0.21349567480507728 0.07662224060787504 0.22449211151017728 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8513088000728978 0.8416367338200211 0.050453055867971684 0.14230640330310712 0.10371586134453781 0.06382699661797281 0.055725710963670745 0.05913744948911239 0.34606468520431194 0.28025176768192905 0.25263305164974426 0.31991523496867835 0.06617428176935901 0.07648064381043862 0.43641654882908304 0.44039563492874567 0.46664703807914554 0.4411462713778618 );
}

}
