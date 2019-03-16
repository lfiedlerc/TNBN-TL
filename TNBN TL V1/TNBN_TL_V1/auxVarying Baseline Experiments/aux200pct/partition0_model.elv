// Bayesian Network
//   Elvira format 

bnet  "auxVarying Baseline Experiments/aux200pct/partition0_model.elv" { 

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
pos_x =253;
pos_y =135;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =556;
pos_y =138;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =254;
pos_y =208;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[33-100]" "[11-33]" "[0-11]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =558;
pos_y =211;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[19-80]" "[0-19]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Signos_Vitales Heridas_Internas;

//Network Relationships: 

relation Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.24803007676319386 0.3737502945905665 0.3782196286462397 );
}

relation Herida_Cabeza Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8480702413990145 0.6524014833747686 0.1494447994887362 0.15192975860098545 0.3475985166252315 0.8505552005112638 );
}

relation Heridas_Internas Colision Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.421151693474843 0.3493908961326503 0.34036833974167285 0.3055089826555422 0.24068684826819042 0.1576828956990205 0.20733217109171295 0.09066550442504626 0.09733217109171294 0.5355017042511522 0.5594219700318831 0.6045347519867703 0.22289271574021105 0.1564895536848751 0.11854488965325452 0.45182393822346045 0.3601572715567938 0.3548239382234605 0.0433466022740048 0.09118713383546659 0.05509690827155682 0.47159830160424676 0.6028235980469345 0.723772214647725 0.3408438906848266 0.5491772240181599 0.5478438906848266 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6468975005690313 0.13010901140177814 0.10656023306183005 0.09815093300357261 0.13279994625270602 0.24877504910914172 0.11374232011643276 0.5229650064855076 );
}

relation Signos_Vitales Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5201111278821392 0.24142567905087622 0.1258251050584743 0.16863581998002844 0.35406376705938647 0.5899385009690954 );
}

}
