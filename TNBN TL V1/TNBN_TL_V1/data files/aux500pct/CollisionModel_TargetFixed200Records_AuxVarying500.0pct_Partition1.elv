// Bayesian Network
//   Elvira format 

bnet  "data files/aux500pct/CollisionModel_TargetFixed200Records_AuxVarying500.0pct_Partition1.elv" { 

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
pos_x =281;
pos_y =188;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =569;
pos_y =183;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =281;
pos_y =311;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[41.0-89.0]" "[16.0-41.0]" "[0.0-16.0]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =534;
pos_y =315;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[19.0-79.0]" "[0.0-19.0]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Signos_Vitales Herida_Cabeza;

link Signos_Vitales Heridas_Internas;

//Network Relationships: 

relation Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.256954809398681 0.369248309497504 0.37379688110381504 );
}

relation Herida_Cabeza Colision Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5696537544255527 0.4755609924039158 0.4801616901331409 0.546672700242932 0.4895570612455107 0.47924527675503703 0.4727165384136349 0.4183954341884662 0.3216924499013242 0.43034624557444723 0.5244390075960843 0.5198383098668591 0.4533272997570681 0.5104429387544893 0.520754723244963 0.5272834615863651 0.5816045658115339 0.6783075500986759 );
}

relation Heridas_Internas Colision Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.36292739197556884 0.3732690203675602 0.32858538782548596 0.4665623245714203 0.33612137712220325 0.2654149622561077 0.29537715471262205 0.2534042798581437 0.22085555716234703 0.47368651995185673 0.36236962959120916 0.3985847846776654 0.27694953628896013 0.28230473091410757 0.2020019416473068 0.44395932852314346 0.4171463792867066 0.3665391396165861 0.16338608807257443 0.26436135004123057 0.2728298274968486 0.2564881391396196 0.3815738919636892 0.5325830960965855 0.26066351676423444 0.32944934085514965 0.412605303221067 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4743547990784994 0.17123401363862847 0.17252169821966912 0.16557260909198354 0.16340243723082584 0.2443108592921567 0.18972106547100573 0.41888251797723114 );
}

relation Signos_Vitales Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.40016556887880783 0.31959783229748506 0.3298205057825162 0.23047959985033006 0.22130857155659694 0.24330114989664592 0.3693548312708621 0.45909359614591794 0.42687834432083777 );
}

}
