// Bayesian Network
//   Elvira format 

bnet  "auxVarying Baseline Experiments/aux500pct/partition4_model.elv" { 

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
pos_x =263;
pos_y =138;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =555;
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
pos_x =263;
pos_y =206;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[34-74]" "[12-34]" "[0-12]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =549;
pos_y =212;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[19-57]" "[0-19]");
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
values= table (0.2311107814163852 0.3951443167544353 0.3737449018291796 );
}

relation Herida_Cabeza Colision Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.9217981269549629 0.838611249391987 0.7970178106104989 0.728746626879259 0.5124607452155214 0.5531298853574208 0.2397653407262556 0.16351070296019427 0.09350644533889207 0.07820187304503705 0.16138875060801305 0.20298218938950105 0.27125337312074105 0.4875392547844785 0.4468701146425792 0.7602346592737443 0.8364892970398057 0.9064935546611079 );
}

relation Heridas_Internas Colision Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3774086874216815 0.30605733607033014 0.28759579760879167 0.3623000144321927 0.19502728715946543 0.1513909235231018 0.19830202734206803 0.1449686940087347 0.10367837142808953 0.5765947928100358 0.49875695497219796 0.5849108011260441 0.16688987550475448 0.15961714823202722 0.1305262391411181 0.40954861029207545 0.3917708325142977 0.3737063163852654 0.04599651976828272 0.19518570895747195 0.12749340126516423 0.47081011006305284 0.6453555646085074 0.7180828373357802 0.3921493623658566 0.46326047347696775 0.5226153121866451 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6806063296312679 0.13349235842034912 0.09353089761069255 0.08960144977511651 0.1168005485343077 0.20462432858937302 0.10906222422373196 0.5722818632151614 );
}

relation Signos_Vitales Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5257754888888106 0.34829649729217205 0.2773945365078583 0.13049148188732768 0.1483546271454309 0.148668352635627 0.3437330292238618 0.5033488755623972 0.5739371108565148 );
}

}
