// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/200pct aux/refinement/partition2_model.elv" {

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
states = ("Default" "[36-54]" "[6-36]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[28-44]" "[13-28]" "[0-13]");
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
values= table (0.23263310665381914 0.43246803553158963 0.3348988578145913 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7910130844473069 0.592346345763221 0.10862534500814133 0.2089869155526931 0.407653654236779 0.8913746549918588 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.23352062163777645 0.26296916892279926 0.18585354673220783 0.7255110579796771 0.1286957092460415 0.3502331002331003 0.04096832038254632 0.6083351218311592 0.46391335303469194 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6874057764857485 0.10398914313563087 0.7424393185869613 0.06560317673000154 0.6070777198514219 0.07168607853284006 0.07392430961485677 0.3153791127890903 0.07875822489489612 0.2794847641030799 0.1218689425059761 0.23936345508682377 0.15840923488897882 0.3968346452313056 0.1468734464256171 0.4755412404141956 0.1912081684145487 0.5037039663566204 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7333333333333333 0.6521739130434783 0.08333333333333333 0.4 0.0625 0.12903225806451613 0.06666666666666667 0.043478260869565216 0.125 0.2 0.0625 0.0967741935483871 0.06666666666666667 0.043478260869565216 0.25 0.13333333333333333 0.25 0.06451612903225806 0.13333333333333333 0.2608695652173913 0.5416666666666666 0.26666666666666666 0.625 0.7096774193548387 );
}

}
