// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/500pct aux/no refinement/partition3_model.elv" {

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
states = ("Default" "[50-73]" "[32-50]" "[16-32]" "[0-16]");
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
states = ("Default" "[31-51]" "[16-31]" "[7-16]" "[0-7]");
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
values= table (0.6216148952227444 0.12332072990300838 0.6440629402246195 0.09385510428066925 0.3258790436005626 0.06586067754749439 0.08919411918601261 0.18725793194147625 0.09315917420687854 0.19553684453311698 0.12635121559172194 0.18333047242265518 0.08308223362380092 0.21470820318921585 0.08521851854198088 0.20308730447932127 0.19718706047819973 0.19683368424114106 0.11006313312325282 0.3090826894624363 0.09767940594656341 0.2231214172951379 0.21371308016877635 0.23765630447111702 0.09604561884418922 0.16563044550386324 0.07987996107995775 0.2843993294117547 0.13686960016073943 0.3163188613175923 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7836037069028332 0.8004779154805358 0.09413095664965968 0.22704890588167864 0.11888184886470975 0.0894219870735527 0.03951191791316954 0.03433290560747846 0.0972656343894261 0.12022388548821906 0.11894420846931539 0.10211280502752855 0.07730632260610228 0.058901154597465345 0.3117683686752525 0.18915672428779984 0.28318444769539197 0.2668097891448991 0.04763025447975837 0.051050417756828184 0.26417199087189297 0.25612856017636876 0.19226866241757926 0.25076341601991176 0.051947798098136544 0.055237606557692144 0.23266304941376872 0.2074419241659337 0.28672083255300357 0.29089200273410803 );
}

}
