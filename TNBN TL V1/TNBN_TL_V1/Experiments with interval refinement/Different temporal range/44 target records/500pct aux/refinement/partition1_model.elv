// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/500pct aux/refinement/partition1_model.elv" {

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
states = ("Default" "[48-60]" "[21-48]" "[0-21]");
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
states = ("Default" "[31-48]" "[21-31]" "[0-21]");
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
values= table (0.5454545454545454 0.5555555555555556 0.16666666666666669 0.2 0.16666666666666666 0.07692307692307693 0.36363636363636365 0.3333333333333333 0.6666666666666667 0.4 0.08333333333333333 0.5384615384615384 0.09090909090909091 0.1111111111111111 0.16666666666666669 0.4 0.7500000000000001 0.38461538461538464 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.44394370055077953 0.5560562994492205 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.26967340343746055 0.346735009182718 0.3835915873798214 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.629299043484434 0.09863157659315967 0.6737779002759503 0.0945329104938313 0.5447552221584353 0.05989003590248984 0.05591578673698481 0.17701817796025984 0.061717694542387784 0.14129266671414942 0.08709030532621238 0.16878801025550286 0.16774736021095443 0.49646477496900454 0.14327321947340022 0.40596766210826035 0.21178778795238012 0.43963388717712376 0.14496685450329397 0.22585077877688323 0.11902698233174785 0.3562167231244049 0.15438735944192195 0.3297254153828428 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8503011126216157 0.8331678456825634 0.0686068817464352 0.17040269099885036 0.11340396096821653 0.0827964070609857 0.013608989761671303 0.015340887753327502 0.06783768774681476 0.09176961382756081 0.08774558736809404 0.08570292021497748 0.02916212091786708 0.03259938647582094 0.16867749385694483 0.12847745935858515 0.16635100938534494 0.13675997906645343 0.10498363530432148 0.11697426911912219 0.6930444856296211 0.6075148435384526 0.6306714092081759 0.6929172272700307 );
}

}
