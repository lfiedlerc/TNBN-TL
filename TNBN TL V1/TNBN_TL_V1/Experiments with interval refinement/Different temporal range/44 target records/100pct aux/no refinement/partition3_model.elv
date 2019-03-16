// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/100pct aux/no refinement/partition3_model.elv" {

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
states = ("Default" "[52-73]" "[35-52]" "[17-35]" "[0-17]");
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
states = ("Default" "[34-52]" "[20-34]" "[9-20]" "[0-9]");
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
values= table (0.6110545999640695 0.11598619102416569 0.6633984291929647 0.0804245222820978 0.3421432502555232 0.0682601387758225 0.08349062277838298 0.16557422324510931 0.08665994903361651 0.18666680062191437 0.12550200487459703 0.1640377091056999 0.09908765360833767 0.21255235903337166 0.07503039266917326 0.23751427573746436 0.12124223602484471 0.23975344435163654 0.08563831566409759 0.3754844649021863 0.10014085407112874 0.23186572688009358 0.22149540058180672 0.23946067580822328 0.12072880798511228 0.13040276179516683 0.0747703750331168 0.26352867447842987 0.18961710826322825 0.28848803195861783 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8044069073259501 0.7974441111441538 0.0727742411540096 0.18807229093772343 0.12413979210991956 0.08595161158158376 0.039734006504073514 0.03076575382612931 0.10518501732202735 0.10897322779752748 0.1109604507389339 0.10231624549765396 0.044768965949240354 0.03987967787676223 0.21013285394066097 0.1773906808864572 0.2062354630962871 0.18852323050230332 0.06262442178296734 0.05983471466190852 0.31009781157391914 0.25220984072371855 0.2491670470582336 0.3244861358025132 0.04846569843776871 0.07207574249104616 0.3018100760093829 0.27335395965457326 0.30949724699662595 0.2987227766159459 );
}

}
