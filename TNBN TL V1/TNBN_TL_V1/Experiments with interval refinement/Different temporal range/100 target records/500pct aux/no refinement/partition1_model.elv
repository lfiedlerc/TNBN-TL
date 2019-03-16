// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/500pct aux/no refinement/partition1_model.elv" {

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
states = ("Default" "[49-73]" "[32-49]" "[16-32]" "[0-16]");
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
states = ("Default" "[31-53]" "[16-31]" "[7-16]" "[0-7]");
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
values= table (0.23488099962182768 0.3757343514223802 0.3893846489557921 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8043247488998055 0.6115388295018509 0.07798769963947944 0.19567525110019443 0.38846117049814916 0.9220123003605205 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2336271824717563 0.31886864884744054 0.12036581364829398 0.7005717220130092 0.1339124719030198 0.43838685203412076 0.06580109551523453 0.5472188792495396 0.4412473343175853 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6036269308062086 0.10744771402999252 0.6695731443062521 0.08739098016948631 0.3372169120812882 0.06065234421416106 0.0924646581708373 0.18877764991689042 0.09395546367580551 0.21198897923130366 0.16804873848273486 0.1875230698793236 0.07960385934590435 0.24874477140299925 0.07735887288050247 0.18477368850354886 0.1741539653836218 0.20647681601177195 0.09123576027406921 0.2412113905784792 0.07485685022157751 0.21459477350281292 0.19024799793335054 0.22120317359003774 0.13306879140298056 0.21381847407163865 0.0842556689158624 0.3012515785928483 0.13033238611900455 0.3241445963047056 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8034449767441031 0.7735104982664895 0.07878195219457253 0.20075381051194335 0.12914645162091234 0.07763090599532972 0.02959128299253462 0.04431662716935082 0.11982964605952046 0.13064596498493847 0.11806107569240891 0.11024891534551763 0.06532722002703123 0.06548813702890292 0.295506400817258 0.21371111835075685 0.26133928960202985 0.276241272052398 0.04201216991143373 0.054653652716694964 0.287449376803238 0.20753125265026054 0.23395626905244898 0.23751991217014537 0.0596243503248973 0.062031084818561705 0.21843262412541098 0.24735785350210082 0.25749691403220004 0.2983589944366094 );
}

}
