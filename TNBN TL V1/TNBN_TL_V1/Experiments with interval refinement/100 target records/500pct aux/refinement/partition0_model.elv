// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/500pct aux/refinement/partition0_model.elv" {

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
states = ("Default" "[33-54]" "[4-33]");
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
values= table (0.24160134282630638 0.38008541049055233 0.37831324668314137 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8447306819193415 0.6349555515008081 0.10461054200496622 0.15526931808065841 0.36504444849919193 0.8953894579950338 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.22593073523675167 0.2483565323163847 0.10866847010194486 0.7124392824508248 0.1108614829011702 0.40564500384322155 0.061629982312423524 0.6407819847824451 0.48568652605483364 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6335510963244645 0.09186406957159225 0.7111676307836738 0.07526518968519805 0.6233527833810534 0.07819640869041727 0.11900144810081824 0.3517165796126416 0.08723125244788374 0.2932997277160079 0.15330866606097826 0.30851438654377517 0.19266901121084856 0.4224320823919028 0.1453854207464729 0.5212141658137974 0.17223566187097558 0.49175323430916895 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8329856489636009 0.8157418304184351 0.05735516341268413 0.1843000756012452 0.12653324664069007 0.06180921951183936 0.05030552742060213 0.04704463904210168 0.32479247834889696 0.27002480255958783 0.2749456375670633 0.2728602668352021 0.08250106496978749 0.10193005125788698 0.45732274250275723 0.4125378927993703 0.43018705197567725 0.4690953902440803 );
}

}
