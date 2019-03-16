// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/500pct aux/no refinement/partition4_model.elv" {

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
states = ("Default" "[51-72]" "[34-51]" "[17-34]" "[0-17]");
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
states = ("Default" "[32-52]" "[17-32]" "[8-17]" "[0-8]");
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
values= table (0.6171150846884511 0.10384021042248891 0.6840875707664914 0.0862238466494116 0.3372169120812882 0.08336591092334891 0.07206123760335088 0.14962847279302977 0.09418064992633829 0.19884284216038506 0.11481098768621371 0.16989718396866405 0.09054541750486808 0.2427552194640802 0.07037799871988519 0.20451438580661224 0.1741539653836218 0.18503642619994595 0.10690006205990832 0.2652276837086963 0.0727850606611507 0.21447728149599704 0.23959786446224057 0.2653246473661477 0.11337819814342155 0.23854841361170476 0.07856871992613447 0.29594164388759403 0.13422027038663567 0.2963758315418934 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8104477778645512 0.79211168874268 0.06931225522487557 0.16674020506976647 0.1406075578025154 0.09450225531171566 0.04067905143324424 0.03687615097887463 0.10719910490245863 0.1291197324928146 0.11103652674239413 0.1000311811937395 0.05597515860036577 0.049760918868264906 0.303915617240569 0.22163135719745616 0.24455383281162718 0.25439335244465155 0.03830817958522869 0.05744434741999099 0.23043810072565624 0.25480060283309386 0.20771818714376214 0.23750071614828444 0.05458983251661001 0.06380689399018939 0.2891349219064405 0.22770810240686884 0.29608389549970127 0.3135724949016088 );
}

}
