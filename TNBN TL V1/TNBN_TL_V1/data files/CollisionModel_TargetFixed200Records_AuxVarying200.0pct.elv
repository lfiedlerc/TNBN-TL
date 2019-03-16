// Bayesian Network
//   Elvira format 

bnet  "data files/CollisionModel_TargetFixed200Records_AuxVarying200.0pct.elv" { 

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
pos_y =174;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =553;
pos_y =175;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =285;
pos_y =271;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[43.0-119.0]" "[17.0-43.0]" "[0.0-17.0]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =529;
pos_y =275;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[24.0-76.0]" "[0.0-24.0]");
}

// Links of the associated graph:

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Signos_Vitales Heridas_Internas;

//Network Relationships: 

relation Colision Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.15845222223867633 0.043467063427945034 0.4614126737483735 0.3558908543652578 0.3801351040129502 0.6006420822067972 );
}

relation Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4821381930569873 0.5178618069430128 );
}

relation Heridas_Internas Colision Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.46194556373817125 0.2782096417196575 0.3590576532787564 0.24736153733849825 0.3062022823816569 0.3684458866476196 0.1585768856813663 0.25301948749301817 0.3090749651496136 0.4142515630238748 0.43982911318093604 0.3493043125935279 0.23589799811734835 0.18356018102018204 0.32596505697871847 0.504237519025296 0.4132855511345952 0.3901386239848917 0.12380287323795398 0.2819612450994065 0.29163803412771566 0.5167404645441535 0.510237536598161 0.3055890563736619 0.3371855952933377 0.3336949613723866 0.3007864108654948 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5484119097925357 0.4650815305229527 0.16911143640625748 0.15901968922599383 0.13348052360967924 0.14502990834874832 0.14899613019152758 0.2308688719023053 );
}

relation Signos_Vitales Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4487494859270614 0.6002848704767761 0.5587643414423558 0.268752991433688 0.18312592220647 0.20894559649047664 0.28249752263925065 0.21658920731675382 0.2322900620671676 );
}

}
