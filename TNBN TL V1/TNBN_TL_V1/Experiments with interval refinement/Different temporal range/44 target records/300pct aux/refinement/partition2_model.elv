// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/300pct aux/refinement/partition2_model.elv" {

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
states = ("Default" "[44-62]" "[29-44]" "[14-29]" "[0-14]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[28-44]" "[0-28]");
}

// Links of the associated graph:

link Colision Pupilas_Dilatadas;

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Colision;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.37500000000000006 0.5 0.12500000000000003 0.25 0.11764705882352941 0.058823529411764705 0.5 0.125 0.625 0.25 0.11764705882352941 0.29411764705882354 0.125 0.37500000000000006 0.25000000000000006 0.5 0.7647058823529412 0.6470588235294118 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.42655239620295343 0.5734476037970466 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.26116276513958825 0.35524564748059034 0.3835915873798214 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6324686953114096 0.09863157659315967 0.6744730357439306 0.09574018846228209 0.5449797119543537 0.061572876038322094 0.11084277442989234 0.23824716037185206 0.10001129624734663 0.2294680812074209 0.12585667541688086 0.2247493532177128 0.07389518295326156 0.31567748749270397 0.07059620911577409 0.22557879169543074 0.11423913614763034 0.24840717987220887 0.08945206357500085 0.1985393003098767 0.06667419749823109 0.2780842001072982 0.11036662305788017 0.2622075787539983 0.09139667365271825 0.14691908222930875 0.08628425558594612 0.16918409377157304 0.10262159687837981 0.20109152656321672 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8494280967485999 0.8327313377460555 0.06974851788807133 0.17066459576075516 0.11394120150545707 0.08211046601790178 0.013868464773155276 0.017710799532770598 0.06025920531899133 0.10528311367847874 0.09346611798465643 0.06623945090592462 0.13472222922493696 0.14758999610642165 0.8681091766267188 0.7222052183909683 0.7907233581501935 0.8497575273360044 );
}

}
