// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/500pct aux/no refinement/partition2_model.elv" {

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
states = ("Default" "[53-71]" "[37-53]" "[18-37]" "[0-18]");
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
states = ("Default" "[30-50]" "[16-30]" "[7-16]" "[0-7]");
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
values= table (0.645623933790121 0.10744771402999251 0.6738248449865243 0.0791969775972261 0.3258790436005626 0.07008506094895055 0.06340938913948206 0.12623942864449195 0.07240291728967306 0.16808015701003196 0.1411894715692184 0.13040991119955547 0.08317367958011242 0.20843900122381132 0.0813991634385012 0.17605228893960742 0.13686960016073943 0.19127250431103324 0.08518202649278377 0.2635285951741648 0.09624057607617874 0.22626357877580988 0.2333735181836448 0.2621684707588315 0.12261097099750085 0.29434526092753943 0.07613249820912281 0.35040699767732464 0.16268836648583487 0.34606405278162927 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8071652148393412 0.7846712125522038 0.0786547661734692 0.21464811223088498 0.11450509816442964 0.10234491940437977 0.03083136235761399 0.02943567478839844 0.10133737323768563 0.13386475850409207 0.10712698157855909 0.10968141999850028 0.06430822343216856 0.05580490096117319 0.29454719536209106 0.21990001160973893 0.25681285648728985 0.2670916088408594 0.03989324066813051 0.05556961409613949 0.27963832797069654 0.2244569313976136 0.23784780725382498 0.23636088747472828 0.05780195870274576 0.07451859760208501 0.2458223372560575 0.20713018625767038 0.28370725651589646 0.2845211642815324 );
}

}
