// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/500pct aux/no refinement/partition0_model.elv" {

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
states = ("Default" "[52-73]" "[35-52]" "[18-35]" "[0-18]");
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
states = ("Default" "[32-53]" "[17-32]" "[9-17]" "[0-9]");
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
values= table (0.2475406393715161 0.41476650893592315 0.3376928516925607 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.82543159443743 0.5810644537333323 0.11423074070948508 0.17456840556257014 0.41893554626666774 0.8857692592905149 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.15476455232376504 0.2934776309324329 0.19429616547271777 0.7306436752394719 0.1541796328726393 0.41691637065994613 0.114591772436763 0.5523427361949277 0.3887874638673361 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.623102549864578 0.0858487682371892 0.6764046525013868 0.07318201873789171 0.6043209453139615 0.08022230443648923 0.08030070231921622 0.1941345825870865 0.08214796015642299 0.18681030870668047 0.07051194113612272 0.18788439935381424 0.10314059976066403 0.3554361978279985 0.08045776417545339 0.2124514263880855 0.10534482758620689 0.23361489345915631 0.08330338460116428 0.17254867745877972 0.07899071135672675 0.24906519420255996 0.1185910706491239 0.24421104683271616 0.11015276345437738 0.192031773888946 0.08199891181001001 0.27849105196478235 0.10123121531458502 0.2540673559178241 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7847615712950874 0.7653297533740638 0.06700252606010275 0.18370771294749216 0.11506590354386602 0.06823361482414914 0.031838030623543304 0.04907657537773502 0.10218067556969483 0.12021866518555216 0.1097137761001054 0.10873951912708041 0.056592081890278784 0.06965354123169037 0.3110589842209644 0.22343349827439446 0.2752009881293041 0.2621016788219597 0.053561475089828815 0.05341194784991543 0.23325028224942732 0.17793591313606624 0.21701430812329287 0.22368337517376233 0.07324684110126173 0.06252818216659546 0.2865075318998109 0.2947042104564949 0.2830050241034316 0.3372418120530484 );
}

}
