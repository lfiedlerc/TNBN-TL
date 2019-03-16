// Bayesian Network
//   Elvira format 

bnet  "data files/aux200pct/CollisionModel_TargetFixed200Records_AuxVarying200.0pct_Partition3.elv" { 

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
pos_x =261;
pos_y =177;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =545;
pos_y =181;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =262;
pos_y =288;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[40.0-88.0]" "[16.0-40.0]" "[0.0-16.0]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =533;
pos_y =289;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[23.0-108.0]" "[0.0-23.0]");
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
values= table (0.2288677191887195 0.40093220025280885 0.3702000805584717 );
}

relation Herida_Cabeza Colision Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5932350462594305 0.5005563397927826 0.5234854010303959 0.5792814584953683 0.5269556364792152 0.4966045117535897 0.46824434304323864 0.41027289455663785 0.3670277961960107 0.4067649537405695 0.4994436602072175 0.4765145989696041 0.42071854150463184 0.4730443635207847 0.5033954882464102 0.5317556569567614 0.589727105443362 0.6329722038039892 );
}

relation Heridas_Internas Colision Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3624881289533574 0.3398400964815168 0.29168287058099446 0.39341802742784543 0.3669977629698265 0.2907128853203678 0.251252232889961 0.27571385219117417 0.22653164066515533 0.4528519478953581 0.38063541032183257 0.4967520021342999 0.3467607169387094 0.29180327710417775 0.24145235900997336 0.46749886990998013 0.40798699373516323 0.3753995675164379 0.18465992315128438 0.27952449319665057 0.2115651272847056 0.25982125563344516 0.34119895992599575 0.46783475566965876 0.2812488972000588 0.31629915407366266 0.39806879181840676 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.47386136948118335 0.16992684678648545 0.16801390588169812 0.1592816416379643 0.1717963999296295 0.2425599975177727 0.18632832470748892 0.42823151405777754 );
}

relation Signos_Vitales Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3943519603228607 0.3508601627325665 0.3362683264652 0.24499726553494802 0.22416714238340135 0.2530589757486486 0.3606507741421914 0.42497269488403216 0.4106726977861514 );
}

}
