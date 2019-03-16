// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/100pct aux/no refinement/partition1_model.elv" {

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
states = ("Default" "[53-71]" "[36-53]" "[19-36]" "[1-19]");
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
states = ("Default" "[31-53]" "[17-31]" "[8-17]" "[0-8]");
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
values= table (0.24822685956552293 0.39713702870977996 0.3546361117246972 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8100743889131466 0.6181243297620749 0.10629228934905902 0.18992561108685338 0.3818756702379251 0.893707710650941 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.22329192546583854 0.321899323123049 0.13994565217391305 0.6754451345755694 0.15470248949949497 0.4425951086956522 0.10126293995859213 0.523398187377456 0.41745923913043476 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6267784612696996 0.12828998849252016 0.6680281364423383 0.10182695950731985 0.3469455145844799 0.09134398789699433 0.06589928997141459 0.16118296892980438 0.08047575393611359 0.1980619662494323 0.10995046780407264 0.16218092219987912 0.10920886554566546 0.25766628308400463 0.09054685339258334 0.2028845180860402 0.17130434782608694 0.21876706909407803 0.07566846846092269 0.29051783659378594 0.07928957430868855 0.21876272235439745 0.204127682993946 0.26287190464644594 0.12244491475229764 0.16234292289988494 0.08165968192027628 0.2784638338028103 0.16767198679141443 0.2648361161626028 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7998614527804956 0.7707774444774872 0.07074888640097479 0.17473895760439012 0.12747312544325293 0.0884726199849451 0.03405218832225533 0.04076575382612931 0.106829600785811 0.13705557902697607 0.1323406417227225 0.13849632712390875 0.0665175546643916 0.06303515168754822 0.26818689270635065 0.21135725239661357 0.28109953364423723 0.2834371890601071 0.047694014885997914 0.04951098597983821 0.2883372086011372 0.21789760910514755 0.21227006511787844 0.214815664016197 0.05187478934685962 0.07591066402899714 0.26589741150572654 0.2589506018668727 0.24681663407190907 0.27477819981484203 );
}

}
