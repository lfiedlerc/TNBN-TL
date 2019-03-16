// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/300pct aux/refinement/partition1_model.elv" {

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
states = ("Default" "[56-64]" "[42-56]" "[29-42]" "[0-29]");
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
states = ("Default" "[33-48]" "[23-33]" "[0-23]");
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
values= table (0.629299043484434 0.09863157659315967 0.6732945368039793 0.0945329104938313 0.5447552221584353 0.05989003590248984 0.03387115338720908 0.09843638028640014 0.03776941771052261 0.09620587826003044 0.05455412627027015 0.09025055655336098 0.09408653718669187 0.2181041367130042 0.0793157771920975 0.19052536675025636 0.0902964848611368 0.18238133303491696 0.06962403751815198 0.2663572643043768 0.08309271896314976 0.19241175652006087 0.1203953131481824 0.20306375224506218 0.1712374976797792 0.3165405169994043 0.12463907844472465 0.42443769820601657 0.18811767679403502 0.46253410233597503 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8503011126216157 0.8331678456825634 0.06903845627498079 0.1715267920964575 0.11417528565753207 0.08343803998838092 0.015353732038808651 0.011505665814995627 0.05037266869854813 0.07749638024932914 0.08052951948567891 0.06135201760726863 0.02303059805821298 0.02684655356832313 0.10634230058582383 0.08487698789212239 0.11896406287657113 0.10039421063007593 0.10939534077651164 0.1265623239649519 0.7723809200444046 0.6642546878513926 0.6845009156282706 0.7529565797255694 );
}

}
