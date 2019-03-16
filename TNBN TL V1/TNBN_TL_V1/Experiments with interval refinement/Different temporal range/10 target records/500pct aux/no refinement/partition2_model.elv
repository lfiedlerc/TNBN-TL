// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/500pct aux/no refinement/partition2_model.elv" {

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
states = ("Default" "[53-73]" "[36-53]" "[18-36]" "[0-18]");
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
values= table (0.2398483316792084 0.39938189355130777 0.3607697747694838 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8204315944374299 0.6016993743682528 0.08423074070948508 0.17956840556257012 0.3983006256317471 0.9157692592905149 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.21201092913535927 0.3364124135411286 0.15340589632157908 0.6570411907674223 0.1357790117546269 0.41691637065994613 0.1309478800972185 0.5278085747042446 0.42967773301847484 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6266739784360066 0.0858487682371892 0.6716427477394821 0.08909110964698261 0.6043209453139615 0.07272230443648924 0.07626195124467808 0.19998242865989502 0.08398395147154339 0.16614245962076823 0.06830548107501402 0.16062338427392087 0.0871009016103857 0.2869834336821149 0.07030090435904443 0.2152635483409019 0.11353744465922554 0.23342308587591143 0.10573644011962173 0.2616221556231522 0.08781983027317923 0.26609134082777913 0.10613144603105319 0.2521221682398495 0.10422672858930787 0.16556321379764866 0.08625256615675085 0.26341154156356816 0.10770468292074577 0.281109057173829 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8022615712950874 0.7710440390883494 0.06938347844105514 0.17037437961415886 0.11506590354386602 0.06712250371303803 0.02340874078454372 0.03914410726334688 0.09876887961338053 0.10545817871248193 0.10110972192643097 0.10072213137138347 0.03965477051884435 0.051674676883184625 0.2228115913581037 0.17268458835621908 0.1929119546329915 0.17467016552052317 0.04596636644480649 0.06145006897432766 0.3202861651782792 0.22327804047852196 0.24659527338540657 0.27807103654883825 0.08870855095671806 0.07668710779079137 0.28874988540918156 0.3282048128386182 0.3443171465113049 0.37941416284621704 );
}

}
