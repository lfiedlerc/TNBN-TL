// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/100pct aux/no refinement/partition2_model.elv" {

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
states = ("Default" "[53-73]" "[36-53]" "[17-36]" "[0-17]");
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
states = ("Default" "[32-52]" "[18-32]" "[8-18]" "[0-8]");
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
values= table (0.6428165196852385 0.10744771402999254 0.6738248449865243 0.0735254339509989 0.3258790436005626 0.06845284344611191 0.06340938913948206 0.17516594516594516 0.06973436416247017 0.17763711399263157 0.1411894715692184 0.1402531552384133 0.08857981403359229 0.2132030978866422 0.09471413844864293 0.16723182075360377 0.12855133614627287 0.2220225368340361 0.08706553850701511 0.29298281184357133 0.0911717981102249 0.24432785122775025 0.20341571227647182 0.2469238678245384 0.1181287386346721 0.21120043107384884 0.07055485429213779 0.33727778007501547 0.2009644364074744 0.32234759665690027 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8071652148393412 0.7846712125522038 0.07617032891251124 0.2114211994666523 0.11746027090641117 0.09988227545272851 0.03083136235761399 0.02943567478839844 0.1013373732376856 0.11947713145414511 0.10417180883657755 0.09983084419189518 0.04419579102044079 0.05580490096117319 0.23124243253400778 0.16724362109035512 0.24778266770377533 0.22051695875188548 0.06385144582627261 0.051319381206666084 0.3219409157108981 0.2565995134413434 0.2007826122604809 0.25904036107962664 0.05395618595633144 0.07876883049155842 0.2693089496048971 0.2452585345475042 0.329802640292755 0.32072956052386437 );
}

}
