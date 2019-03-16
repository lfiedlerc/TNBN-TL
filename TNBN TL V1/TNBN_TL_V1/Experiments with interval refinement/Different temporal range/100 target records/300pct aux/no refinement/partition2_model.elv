// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/300pct aux/no refinement/partition2_model.elv" {

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
states = ("Default" "[50-72]" "[33-50]" "[15-33]" "[0-15]");
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
states = ("Default" "[31-53]" "[16-31]" "[7-16]" "[0-7]");
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
values= table (0.23834840600185545 0.3982724928925605 0.363379101105584 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8077067835318402 0.5992801422431636 0.09449130906197184 0.19229321646815983 0.40071985775683644 0.9055086909380281 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.1903543307086614 0.3004126547631098 0.1461371838463374 0.7451968503937008 0.15658124724573044 0.42660565422930086 0.06444881889763779 0.5430060979911598 0.4272571619243617 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6428165196852385 0.10744771402999251 0.6775432742645142 0.07636120577411251 0.3258790436005626 0.06845284344611192 0.08489664886297466 0.16847352366339707 0.08342331537560845 0.20012031922414775 0.15505324492666264 0.17516568997710721 0.059273128623365215 0.3089009443439823 0.08258312362073543 0.19023114805517538 0.1701426562186056 0.19475504486259979 0.11200238326086655 0.20851462180576102 0.10202580769043068 0.24390285105125517 0.198442837050432 0.2718091972186909 0.1010113195675551 0.20666319615686704 0.054424479048711234 0.28938447589530913 0.15048221820373722 0.2898172244954903 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8071652148393412 0.7846712125522038 0.06871701712963747 0.20819428670241952 0.10859475268046657 0.09003169964612338 0.03083136235761399 0.02943567478839844 0.10879068502055941 0.12915786974684323 0.11303732706252216 0.11706935185345413 0.06094921482378597 0.05580490096117319 0.3359327991779107 0.22496480711049546 0.27536343260090995 0.24054646289198256 0.05477457424968819 0.06211206893897833 0.24942788501303875 0.22792479209452918 0.2527634855880845 0.2928640556367905 0.04627963372957067 0.06797614275924616 0.23713161365885366 0.20975824434571255 0.2502410020680168 0.2594884299716495 );
}

}
