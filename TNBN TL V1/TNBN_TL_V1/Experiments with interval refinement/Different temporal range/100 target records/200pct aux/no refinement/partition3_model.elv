// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/200pct aux/no refinement/partition3_model.elv" {

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
states = ("Default" "[46-70]" "[27-46]" "[12-27]" "[0-12]");
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
states = ("Default" "[32-51]" "[17-32]" "[8-17]" "[0-8]");
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
values= table (0.23661470281184155 0.38440286737244955 0.37898242981570884 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8371451893289417 0.5807427272771772 0.08836652683200669 0.16285481067105834 0.4192572727228228 0.9116334731679933 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.19489009186351708 0.2888893217529235 0.10995207630296212 0.7238139763779528 0.16650904183912174 0.47541347370641174 0.08129593175853018 0.5446016364079548 0.41463444999062615 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6272297234325094 0.12332072990300838 0.6552182280585895 0.10236241975001002 0.33808519188266023 0.07075733005601031 0.11306727841480833 0.20249547920433997 0.09731441697769727 0.23503468070331468 0.15505324492666264 0.2047191614135303 0.09650817141532271 0.3675373993095512 0.09621039001368767 0.21170480331193228 0.20896122161944952 0.2635395054263304 0.10784609245429644 0.1477083675817853 0.09169709278547444 0.250060425324462 0.18710066305003012 0.23652734604828812 0.05534873428306323 0.15893802400131515 0.059559872164551164 0.20083767091028099 0.11079967852119753 0.22445665705584092 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7836037069028333 0.797287672179533 0.09661539391061758 0.22382199311744594 0.12479219434867282 0.08449669917025016 0.031820372420340894 0.037523148908481255 0.09229675986751024 0.12022388548821908 0.10416834475940771 0.10457544897917985 0.07300377225379201 0.06209139789846814 0.2852967582318312 0.2156053935138332 0.2720002663354998 0.24117673354848573 0.060096121196861155 0.05986715452122532 0.2381073205711804 0.18252266714921092 0.22108494285939428 0.22227786093542257 0.051476027226172706 0.04323062649229222 0.2876837674188604 0.25782606073129094 0.27795425169702537 0.3474732573666618 );
}

}
