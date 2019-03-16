// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Target from target/refinement/partition1_model.elv" {

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
num-states = 3;
states = ("Default" "[18-60]" "[0-18]");
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
states = ("Default" "[29-45]" "[12-29]" "[0-12]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.24875170222423967 0.39945528824330456 0.35179300953245574 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8743169398907104 0.6027241770715096 0.1211340206185567 0.12568306010928962 0.39727582292849034 0.8788659793814433 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.34 0.20181405895691606 0.10167310167310167 0.6145454545454545 0.15079365079365079 0.3963963963963964 0.045454545454545456 0.6473922902494331 0.5019305019305019 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6907775768535265 0.05263157894736842 0.19088363657575566 0.22844022808699604 0.11788538125818639 0.7184740374425999 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8855218855218854 0.7853658536585364 0.0594059405940594 0.2666666666666666 0.1102150537634409 0.052991452991453 0.02109988776655446 0.03434146341463418 0.1348245345770098 0.12607709750566895 0.09442615755979812 0.07714013080567943 0.04309764309764315 0.0741052631578948 0.35771627355785773 0.2657596371882086 0.31142473118279573 0.3593822564594007 0.049831649831649893 0.10573555840821576 0.44759929660919756 0.3410430839002268 0.48348008558262023 0.5100323942681394 );
}

}
