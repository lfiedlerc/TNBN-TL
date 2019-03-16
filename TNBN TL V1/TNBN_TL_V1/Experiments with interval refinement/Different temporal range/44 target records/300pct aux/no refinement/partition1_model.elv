// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/300pct aux/no refinement/partition1_model.elv" {

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
states = ("Default" "[52-73]" "[36-52]" "[18-36]" "[0-18]");
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
states = ("Default" "[33-53]" "[19-33]" "[9-19]" "[0-9]");
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
values= table (0.24298954368990916 0.38584406635298774 0.3711663899571031 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8146897735285313 0.6050290916668368 0.08545895601572567 0.18531022647146875 0.3949709083331632 0.9145410439842744 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.20576752440106477 0.323138422188235 0.10747396784800876 0.6988110026619343 0.16089798482542508 0.5111464422725612 0.09542147293700089 0.51596359298634 0.38137958987943005 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5881974571069266 0.11265285769083239 0.6607840501079973 0.08939888125645677 0.34690515501742797 0.06793334139020159 0.07662024438990866 0.1455458381281166 0.08291264129726578 0.17568668356312991 0.15463034305631992 0.1608048677147161 0.09671319703113763 0.2549129267357116 0.09208434455193602 0.2115193638646306 0.14852137222527975 0.20908672826595662 0.11540224862327764 0.31060375911008825 0.10400948540772476 0.2959327883164957 0.1916804256099798 0.2746079898986915 0.12306685284874941 0.17628461833525128 0.06020947863507612 0.22746228299928695 0.15826270409099247 0.2875670727304343 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8113999143189571 0.7828986565986993 0.06678063243272082 0.1690246718901044 0.12175883972896717 0.08752023903256416 0.02924449601456302 0.0296945992423165 0.11000420396041417 0.12780571932753101 0.11691283169131485 0.1057987604223447 0.048100890602079394 0.05950094387194373 0.2075444773760527 0.1714636507354817 0.2269307380333234 0.21960470797246281 0.0522816650629411 0.053517959426436175 0.29641306893137015 0.23652969620053094 0.2428465275070076 0.2823523711465084 0.058973034001459396 0.07438784086060435 0.31925761729944235 0.295176261846352 0.29155106303938694 0.30472392142612 );
}

}
