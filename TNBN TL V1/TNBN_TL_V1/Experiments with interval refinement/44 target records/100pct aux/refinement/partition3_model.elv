// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/100pct aux/refinement/partition3_model.elv" {

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
states = ("Default" "[32-49]" "[13-32]");
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
states = ("Default" "[35-41]" "[23-35]" "[4-23]");
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
values= table (0.23196682616604952 0.4202446299105942 0.34778854392335634 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8527207493555452 0.6150165089072929 0.12135997599723994 0.14727925064445482 0.38498349109270713 0.8786400240027601 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.14224056692675938 0.3003937976864386 0.12439787630533385 0.7889290964604773 0.11807777504307163 0.4491754860940192 0.06883033661276339 0.5815284272704898 0.4264266376006469 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6633922017215957 0.08319312627834619 0.12487063484521449 0.2786373831899144 0.10315400269822066 0.2750420621164961 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7959560632133621 0.8220669729959846 0.07869418390251723 0.19352647007764662 0.11406043719873507 0.10540555965324841 0.803813206070505 0.8076622110912226 0.06559894580727914 0.2053121843633609 0.11013186577016364 0.09361984536753412 0.7959560632133621 0.8076622110912226 0.07869418390251723 0.19352647007764662 0.11013186577016364 0.10147698822467699 0.03369532901063745 0.01634078819424631 0.1077550662102319 0.10526977492349303 0.12656279468589499 0.11785076459657806 0.038867195023767884 0.0366357693159576 0.12782750452347433 0.06816735213135956 0.10563826945585582 0.0895632563866073 0.03182336628782426 0.02930861545276608 0.11853057283125508 0.08921167366397714 0.14295070429394963 0.11097296161368532 0.056158881684395756 0.04175979205196279 0.25322440559404497 0.16593371301499746 0.18182260645015902 0.20713164686671295 0.04256883264507911 0.04029934624755336 0.23585074778274845 0.15965511420239475 0.20590510148175287 0.23107320147744687 0.05241495623876937 0.03846755778175548 0.24244889897302177 0.17307064690811566 0.17511461276008827 0.21657626379445039 0.0935981361406596 0.07625701157314944 0.43461210038126863 0.4228633331672516 0.4402959195410713 0.4124776760880232 0.07773439004753577 0.08243048096090459 0.42489142348647807 0.432324522727833 0.4243435569667429 0.43706869116664365 0.08049439708096726 0.08426226942670248 0.42024475821990437 0.4300002670603698 0.4449340671149182 0.4098840033795796 );
}

}
