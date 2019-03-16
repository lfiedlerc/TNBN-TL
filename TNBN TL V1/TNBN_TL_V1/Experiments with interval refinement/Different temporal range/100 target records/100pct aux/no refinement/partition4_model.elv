// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/100pct aux/no refinement/partition4_model.elv" {

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
states = ("Default" "[52-71]" "[35-52]" "[18-35]" "[0-18]");
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
values= table (0.6199224987933336 0.10384021042248891 0.6896652146834764 0.09189539029563881 0.33721691208128823 0.08336591092334891 0.08064402264936736 0.12716915995397007 0.07717793867931394 0.16796250482279837 0.12701713596831138 0.1459799051948461 0.08513928305138822 0.2494476409666283 0.08565638507594918 0.24347870253360665 0.19356324808404377 0.20520567453144714 0.1051770927770461 0.28768699654775604 0.06720741674416568 0.1854932578315354 0.19246103504693018 0.24263751924359553 0.10911710272886471 0.23185599210915664 0.08029304481709483 0.31117014451642083 0.14974166881942655 0.32281099010676234 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8104477778645512 0.79211168874268 0.07925000426870729 0.17319403059823194 0.14947307602846 0.09696489926336693 0.04067905143324424 0.03687615097887463 0.09974579311958484 0.12589281972858188 0.10217100851644949 0.1000311811937395 0.06795426117943681 0.05857765563266203 0.28424945261110823 0.2295417353481609 0.27069548455517256 0.25672001201648104 0.04259573667147108 0.059058188350785426 0.32082192916797725 0.24454018343975026 0.16322989092049964 0.25312493009028647 0.03832317285129658 0.053376316294997846 0.21593282083262239 0.22683123088527504 0.3144305399794183 0.29315897743612596 );
}

}
