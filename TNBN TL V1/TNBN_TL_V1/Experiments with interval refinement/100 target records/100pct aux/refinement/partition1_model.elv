// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/100pct aux/refinement/partition1_model.elv" {

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
states = ("Default" "[38-59]" "[19-38]" "[0-19]");
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
states = ("Default" "[23-40]" "[4-23]");
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
values= table (0.22841384124557854 0.37281641260012116 0.3987697461543004 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7981752948100906 0.6309977074971871 0.07189189089085696 0.20182470518990936 0.3690022925028129 0.928108109109143 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2907458122120666 0.30909232224050154 0.1430314803745766 0.6667715559838536 0.08763293910385117 0.3584379358437935 0.042482631804079865 0.6032747386556472 0.4985305837816298 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6222222222222222 0.031746031746031744 0.06666666666666667 0.09523809523809523 0.1111111111111111 0.1111111111111111 0.2 0.7619047619047619 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7734081090382983 0.7774819321914392 0.09925125743026977 0.23936504721690316 0.14473651293982262 0.1257351232055721 0.7666741023042916 0.7703594250689322 0.08219472721584482 0.19174599959785554 0.13812275632606602 0.09368384115429004 0.7018592874894767 0.7240631287726358 0.08381915866483768 0.23936504721690316 0.12106622611164106 0.09368384115429004 0.07429242326613171 0.06846709778724946 0.3058097582798467 0.24049487477700857 0.3242175310424202 0.29825667438615877 0.08147888490961247 0.07846052976811484 0.308412298142044 0.2638051251312555 0.29719904954273585 0.26403012065546505 0.11666375706933521 0.08822471392983754 0.3047741541155509 0.20880175174437957 0.2737357304270948 0.28030396665331236 0.1021520819909311 0.1007987828534506 0.4207200916940921 0.38591038045613 0.39316033936753253 0.42128755257044925 0.08703426342617696 0.10142458726122161 0.43846567687664095 0.41348179187239337 0.43093862183696696 0.4756287279892776 0.11851556273710243 0.13515275325421922 0.4590196101618359 0.4101462980693169 0.44691547824831807 0.4335368017571231 );
}

}
