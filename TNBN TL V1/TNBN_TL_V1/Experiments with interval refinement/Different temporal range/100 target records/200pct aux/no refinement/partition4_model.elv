// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/200pct aux/no refinement/partition4_model.elv" {

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
states = ("Default" "[49-72]" "[33-49]" "[18-33]" "[0-18]");
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
states = ("Default" "[38-52]" "[23-38]" "[11-23]" "[0-11]");
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
values= table (0.25221803152196637 0.37920175780240795 0.36858021067562563 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8058466644842212 0.6101775781405995 0.08189564579666574 0.19415333551577885 0.38982242185940047 0.9181043542033342 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.22287043664996423 0.25543619961412106 0.07446823053368329 0.6928883321403007 0.17125576862908692 0.44918628335520566 0.08424123120973516 0.5733080317567919 0.47634548611111116 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6171150846884511 0.10384021042248891 0.6859467854054864 0.0862238466494116 0.3372169120812882 0.08173369342051026 0.08793366911707856 0.1942446161433503 0.0960398645653333 0.2202764058786424 0.139223284250409 0.17972463322590151 0.09518819259906594 0.24252835771823114 0.07264188260298414 0.20545384395660077 0.15805993283389305 0.1900995503026157 0.09065839405852649 0.21630116718724313 0.05977055818818566 0.17435313989247359 0.23848273486609833 0.24403583641892457 0.10910465953687787 0.24308564852868647 0.08560090923801056 0.3136927636228716 0.12701713596831135 0.30440628663204794 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8104477778645512 0.79211168874268 0.07428112974679144 0.16674020506976647 0.14060755780251538 0.08218903555345929 0.022483304259743313 0.02305518818639285 0.08485200514623488 0.08394295379355662 0.07557445383861566 0.07550377475427443 0.05312992488427913 0.04477692636382723 0.14192290643237299 0.18235748328933574 0.15656255817751225 0.1302964651232473 0.059349160474816254 0.058995144262175975 0.3258453680195833 0.22320318945402848 0.264908158806279 0.285728992574429 0.05458983251661001 0.08106105244492387 0.3730985906550175 0.34375616839331263 0.3623472713750777 0.42628173199459013 );
}

}
