// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/300pct aux/no refinement/partition3_model.elv" {

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
states = ("Default" "[54-71]" "[39-54]" "[21-39]" "[1-21]");
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
states = ("Default" "[34-53]" "[20-34]" "[10-20]" "[0-10]");
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
values= table (0.22315678781325948 0.42163186456964147 0.3552113476170991 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8172200930007383 0.6279285488696142 0.10665877902740295 0.18277990699926178 0.3720714511303858 0.893341220972597 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.195691237938982 0.27052777873099754 0.13456290086724867 0.6762520020313294 0.1362736350845887 0.43404240686849377 0.12805676002968866 0.5931985861844137 0.4313946922642574 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6190014482347105 0.11296621650226495 0.708045006232605 0.08895742556444702 0.5641483175548702 0.08816857089401736 0.0734718845648967 0.16757593878328603 0.06404457666404534 0.15878111818257845 0.09523277665496577 0.15000564455258336 0.07695695877647588 0.2905038948393379 0.06679270452147644 0.21576398420391243 0.1360644257703081 0.2179201133349261 0.11100073417068408 0.2584803776300749 0.08056685006331654 0.24544529322793157 0.07990727936744317 0.23624746686839135 0.11956897425323289 0.17047357224503618 0.08055086251855673 0.29105217882113044 0.12464720065241286 0.3076582043500818 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.763142863224955 0.7579837753871076 0.06042623732692886 0.18099190297622414 0.1375634485380409 0.09105710856848082 0.028383245700440655 0.038425489975509465 0.09141778056592409 0.11339412797666741 0.09554833893647936 0.0911302142034406 0.05901621514923396 0.054849841524949955 0.22404667741908124 0.15134681577171633 0.17420611455334556 0.19493817335703487 0.062164613083200614 0.07607748765425668 0.28669790771583614 0.2375496465016662 0.24154196159178798 0.2791731630136691 0.08729306284216985 0.0726634054581763 0.33741139697222966 0.31671750677372595 0.35114013638034614 0.34370134085737475 );
}

}
