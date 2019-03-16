// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/500pct aux/refinement/partition3_model.elv" {

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
states = ("Default" "[39-55]" "[25-39]" "[4-25]");
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
states = ("Default" "[32-40]" "[14-32]" "[5-14]");
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
values= table (0.17528319495476044 0.4825499362560489 0.34216686878919067 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7062691434578031 0.6723824520856034 0.2074676848621091 0.29373085654219694 0.3276175479143966 0.7925323151378909 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2749002068003655 0.17885755152033272 0.15735323543553767 0.49207666041456255 0.10916638580858358 0.38002144314133063 0.23302313278507186 0.7119760626710836 0.46262532142313173 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6367088615964258 0.08151716224302988 0.6972422416150998 0.07837166798928821 0.6459510328238911 0.06582061540832537 0.11330367187834245 0.32649194623392297 0.08419890321946927 0.28454156269845277 0.1180163223920363 0.27845731656097994 0.08093119419881603 0.20809376792931356 0.0752415730897385 0.23085447539685794 0.0768894221645085 0.21917285561573904 0.13128838170030155 0.28702588679905316 0.10211356347893082 0.3042268280423709 0.1126519441014892 0.32157328815751873 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8553528392858476 0.8608966057788856 0.0643329691147562 0.16328634945881185 0.1140953169908035 0.060659284236366476 0.02929562748641061 0.022557307170991525 0.16374173040491766 0.16374396171881317 0.1578129799692496 0.172422005187971 0.05309832481911924 0.050753941134730925 0.36706937365498027 0.332886076021763 0.333559253116823 0.3376597601597765 0.03661953435801327 0.03571573635406991 0.19792956422572466 0.1889353404447844 0.22775282336471245 0.22271175670112917 );
}

}
