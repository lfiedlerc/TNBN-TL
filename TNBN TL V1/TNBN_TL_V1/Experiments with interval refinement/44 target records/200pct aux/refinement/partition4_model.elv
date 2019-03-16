// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/200pct aux/refinement/partition4_model.elv" {

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
states = ("Default" "[19-42]" "[3-19]");
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
values= table (0.2113978246872833 0.42941081594885877 0.35919135936385793 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7854575288917514 0.5864333022849602 0.06834756723036355 0.21454247110824864 0.41356669771503984 0.9316524327696365 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5111775254034668 0.2581082287308229 0.11521098368709028 0.40818888224745975 0.12059414225941424 0.46305032778276556 0.08063359234907355 0.6212976290097628 0.4217386885301442 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6639352640569678 0.10043583535654513 0.7194575871886293 0.07037297686672034 0.647107333527843 0.06910585790972798 0.12286237658132361 0.36702217917452956 0.10019371886120383 0.3492818295009432 0.129634040744874 0.3288680077268722 0.1102147789920697 0.1853102179165517 0.0983720148819092 0.23285455300062882 0.09902600334677875 0.2785494054517223 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8206404737423179 0.8080689891209363 0.0396244275866398 0.17101618198646415 0.10396225217871559 0.06411022653834504 0.042528547463161745 0.0719741290796489 0.2625745947047764 0.22837515160025823 0.25985094686817245 0.257865583053982 0.06656642211625317 0.0442917717413224 0.35069894498240684 0.30929548090743636 0.3100290607461644 0.3065534903438947 );
}

}
