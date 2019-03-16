// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/100pct aux/no refinement/partition0_model.elv" {

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
states = ("Default" "[51-73]" "[35-51]" "[18-35]" "[1-18]");
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
states = ("Default" "[32-53]" "[18-32]" "[8-18]" "[0-8]");
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
values= table (0.24822685956552293 0.4048293364020876 0.3469438040323895 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8100743889131466 0.5653465519842972 0.12295895601572568 0.18992561108685338 0.4346534480157029 0.8770410439842744 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.14151138716356104 0.3164472872362305 0.1603907867494824 0.716335403726708 0.17651063304676895 0.4630402432712216 0.14215320910973084 0.5070420797170005 0.37656896997929606 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5995252548337344 0.11598619102416571 0.6411762069707424 0.08688712080029934 0.33357182168409466 0.09595497413462198 0.09524195354780965 0.16876409666283082 0.10591927038867095 0.20268413732729956 0.11784259768849752 0.18476746099918218 0.09094937187477939 0.24747525891829691 0.07492010523686524 0.19577258960655713 0.14640616400660428 0.22162526583378955 0.09571689375057583 0.27585270425776753 0.08354691113382089 0.2946161937774891 0.22720968629609245 0.2541792815732313 0.11856652599310072 0.19192174913693905 0.09443750626990044 0.22003995848835486 0.17496973032471103 0.24347301745917505 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7698614527804956 0.7517298254298681 0.07392348957557797 0.18807229093772343 0.12413979210991956 0.08529801681034194 0.04155218832225533 0.05267051573089122 0.11000420396041417 0.13018667170848341 0.12253162551130788 0.11833780846439076 0.06512268155665081 0.08147328528390967 0.2423352391038271 0.1785944146318501 0.2708700464923027 0.23945161138365673 0.06357199121228267 0.0466726112743749 0.26954303831344406 0.2580667511637805 0.2222919573331041 0.2738453825395864 0.05989168612831566 0.06745376228095615 0.30419402904673687 0.24507987155816258 0.2601665785533659 0.28306718080202425 );
}

}
