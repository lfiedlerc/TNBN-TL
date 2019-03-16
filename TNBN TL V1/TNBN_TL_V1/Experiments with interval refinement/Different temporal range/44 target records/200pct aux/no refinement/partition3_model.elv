// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/200pct aux/no refinement/partition3_model.elv" {

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
states = ("Default" "[51-72]" "[34-51]" "[16-34]" "[0-16]");
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
states = ("Default" "[31-50]" "[17-31]" "[7-17]" "[0-7]");
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
values= table (0.238734224540973 0.39009938550192397 0.3711663899571031 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8209834798222376 0.6039938949794662 0.09170895601572568 0.17901652017776246 0.3960061050205338 0.9082910439842744 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.14151138716356104 0.32871436798157216 0.10747396784800876 0.7776708074534161 0.15811001192875654 0.49671458257215934 0.08081780538302277 0.5131756200896713 0.3958114495798319 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6141305493311582 0.11598619102416571 0.6674725343149364 0.0804245222820978 0.3421432502555232 0.07004848143110656 0.07775691221494288 0.1951530494821634 0.08462289647263067 0.2101505313045268 0.1388756977749823 0.1799157868655896 0.09767082351384666 0.2268860759493671 0.075178184914846 0.22450164574883064 0.1564761380611683 0.22486119293635828 0.08745970051897488 0.27502416570771004 0.09591895670348434 0.2299087493232092 0.17288780564509787 0.26725433639527707 0.12298201442107749 0.18695051783659378 0.07680742759410264 0.25501455134133555 0.18961710826322825 0.2579202023716684 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8044069073259501 0.7974441111441538 0.07821839932584784 0.1986790128932014 0.13709115786608211 0.09674441637838589 0.039734006504073514 0.03076575382612931 0.10790709640794646 0.12311552373816476 0.10772260929989326 0.1050144466968545 0.049499492000680795 0.05956852337914776 0.2722472021685347 0.2260141015256942 0.27491329078105636 0.2619233879730803 0.0757164967561312 0.04567566577451374 0.2865010763328346 0.2581255723590178 0.22974314328082354 0.2775745937645847 0.030643097413164417 0.0665459458760554 0.25512622576483635 0.1940657894839218 0.25052979877214476 0.2587431551870945 );
}

}
