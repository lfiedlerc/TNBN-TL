// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/200pct aux/refinement/partition0_model.elv" {

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
states = ("Default" "[32-54]" "[3-32]");
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
values= table (0.24040009694508127 0.3858660937840168 0.37373380927090194 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8128079562421787 0.6340305562895369 0.10326820215099847 0.1871920437578213 0.3659694437104632 0.8967317978490016 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.21980916959996458 0.25598935736508954 0.1071193329391247 0.7166965530982268 0.10576204269928118 0.3958896265746514 0.06349427730180868 0.6382485999356292 0.4969910404862239 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6525572916372637 0.10770938123086897 0.7357044047938579 0.07081151006333489 0.6475869791106811 0.08984847169523323 0.11511655999970179 0.3544144981092343 0.0945447657647988 0.3291743977802536 0.14474106215097027 0.2818129732136319 0.18000043927226098 0.39194073908550614 0.1375196592942528 0.4875114498770844 0.15942493802135857 0.4947383307528205 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8087338349162124 0.7887375534775989 0.0365211631640769 0.1905934072276106 0.11514177049238025 0.06423093345119374 0.06232268300482966 0.08109063603890143 0.3267449968400087 0.27259807528603786 0.29355486286982646 0.2679607170430586 0.09240949548991985 0.10029631299548336 0.4419435534182169 0.3900249384861773 0.42146091026310795 0.46893125482535264 );
}

}
