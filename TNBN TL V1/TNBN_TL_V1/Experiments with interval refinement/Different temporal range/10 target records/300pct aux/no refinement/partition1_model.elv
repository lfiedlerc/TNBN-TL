// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/300pct aux/no refinement/partition1_model.elv" {

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
states = ("Default" "[53-71]" "[36-53]" "[19-36]" "[0-19]");
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
states = ("Default" "[31-51]" "[16-31]" "[8-16]" "[0-8]");
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
values= table (0.24623371089018256 0.4139395568773338 0.3398267322324837 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8472200930007383 0.6251507710918365 0.09999211236073628 0.1527799069992618 0.37484922890816363 0.9000078876392638 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2365815070901207 0.3005139761084993 0.15500803544281808 0.6762520020313294 0.13899965302799797 0.4135972722929245 0.08716649087854995 0.5604863708635027 0.43139469226425753 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6483313955076355 0.09539466999703655 0.6980827790863113 0.07669518822915015 0.5608360812679503 0.083236819814691 0.05976281730167769 0.19101800304813513 0.06428295067681691 0.1746682116743771 0.10521167960855227 0.1685670774992968 0.0910460751183741 0.3029293319503832 0.07836063575036883 0.224982027282876 0.11608552281672162 0.23123868191665353 0.0956789417938726 0.25227647009017407 0.08376382966779793 0.2428094883148667 0.10457344963301776 0.22798134740913104 0.10518077027844012 0.15838152491427124 0.075509804818705 0.28084508449873014 0.11329326667375812 0.2889760733602274 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.793142863224955 0.7713171087204409 0.0702751630750253 0.18646025740660388 0.13043162602545072 0.08345824073295915 0.02088324570044065 0.04124405537635334 0.09596334533628155 0.12296374822983196 0.10756378741885313 0.11043106332679933 0.0664613808905463 0.06692972508521644 0.3236092054065681 0.23149058636931302 0.2629128139120219 0.3071359936369677 0.050078835737190346 0.060931457986763304 0.22596130968498082 0.20352336253810904 0.21075316870258354 0.22717502532525458 0.06943367444686777 0.05957765283122596 0.28419097649714437 0.25556204545614214 0.2883386039410907 0.2717996769780192 );
}

}
