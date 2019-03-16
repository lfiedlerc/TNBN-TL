// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/100pct aux/refinement/partition0_model.elv" {

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
num-states = 4;
states = ("Default" "[44-54]" "[20-44]" "[7-20]");
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
states = ("Default" "[31-40]" "[12-31]" "[5-12]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.26993736626424913 0.47916443351124877 0.250898200224502 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8090843857191816 0.4604271369266165 0.24635997599723994 0.19091561428081846 0.5395728630733835 0.7536400240027601 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.14224056692675938 0.26733940438099923 0.2669854552699741 0.6236571299332806 0.1676593650012306 0.3584379358437936 0.23410230313996003 0.5650012306177701 0.3745766088862323 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6661157110062991 0.08693913038230569 0.0995019404285864 0.2356286115142437 0.1680477216127237 0.45653043480884714 0.06412347272064456 0.21879799640608344 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8193078686149838 0.8303842059390978 0.06652587381754049 0.1899086823748501 0.10517427312640078 0.09591392256228251 0.8193078686149838 0.831872301177193 0.06652587381754049 0.1925872538034215 0.10428141598354364 0.09368177970513966 0.8193078686149838 0.831872301177193 0.06741873096039763 0.1899086823748501 0.10517427312640078 0.09591392256228251 0.04279550480171436 0.055794669098980995 0.24225876131878119 0.1651425826563666 0.19174837004434267 0.21244842550755766 0.04646369092757559 0.04259235036844443 0.23620756477609678 0.13493747265203093 0.22733974213615646 0.24383180546003855 0.0559891111333853 0.04316792267072071 0.22510582356128336 0.17830814328162264 0.20529667549219732 0.22034258671220755 0.09985617787066683 0.07141717644669568 0.4934077524107286 0.41731976968568324 0.48708493999769803 0.4248968510151153 0.09292738185515118 0.07397618748203506 0.4837712624741213 0.4490542122682341 0.4751400610645669 0.46926121050799874 0.08907358589402205 0.07951985755132762 0.5145275967115048 0.41164966411930165 0.4686119766669722 0.4634009040133024 0.035662920668095295 0.04017216175126632 0.1955850550096582 0.22539730876071662 0.21378841257817516 0.2643802628538495 0.03871974243964632 0.049317458321356714 0.21122407234785578 0.22120897156070643 0.19096538339437139 0.1909249042753132 0.033084474760636765 0.04316792267072071 0.19080398378051636 0.21793217512198323 0.2186855891112537 0.2180710136533188 );
}

}
