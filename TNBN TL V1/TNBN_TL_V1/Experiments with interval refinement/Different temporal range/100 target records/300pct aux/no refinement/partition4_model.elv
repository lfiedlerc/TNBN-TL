// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/300pct aux/no refinement/partition4_model.elv" {

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
states = ("Default" "[50-71]" "[35-50]" "[18-35]" "[0-18]");
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
states = ("Default" "[30-53]" "[16-30]" "[7-16]" "[0-7]");
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
values= table (0.6199224987933336 0.10384021042248891 0.6840875707664914 0.0862238466494116 0.34942306036338583 0.0866303459290262 0.08550793469183711 0.19878185106033205 0.10347672312131333 0.2098727767361766 0.08319555670369413 0.15332614901400168 0.07818316523840207 0.17783494986026632 0.06625344899017388 0.15724572296366968 0.20188151209851027 0.1900628759496466 0.10112469111877431 0.2652276837086963 0.05926314344477185 0.24294518309040325 0.19300353052613448 0.2635276531990648 0.11526171015765291 0.2543153049482163 0.08691911367724961 0.30371247056033884 0.1724963403082752 0.30645297590826087 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8104477778645512 0.79211168874268 0.06931225522487557 0.16674020506976647 0.14060755780251538 0.08218903555345929 0.04067905143324424 0.03687615097887463 0.11216797942437448 0.13880047078551272 0.1110365267423941 0.11480704490364718 0.06749748357354086 0.04934343023875096 0.3001863983586302 0.2342347875224055 0.28242338945421064 0.2764593055898853 0.03969350566898444 0.048546626535177245 0.2815117093290081 0.2336342536697231 0.2087063628270934 0.23503403253569813 0.04168218145967917 0.0731221035045171 0.2368216576631116 0.22659028295259215 0.25722616317378644 0.2915105814173103 );
}

}
