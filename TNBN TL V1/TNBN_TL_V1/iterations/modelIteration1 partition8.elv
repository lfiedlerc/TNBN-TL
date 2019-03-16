// Bayesian Network 
//   Elvira format 

bnet "Network" {

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
states = ("Default" "[37-62]" "[0-37]");
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
states = ("Default" "[29-49]" "[0-29]");
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
values= table (0.2436209943874697 0.39350238620838895 0.3628766194041414 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8187230407169778 0.6217411408580558 0.0834144869278175 0.18127695928302226 0.37825885914194435 0.9165855130721826 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.22272136357070632 0.27104258878569343 0.1109745074608573 0.6721739130434783 0.18463389782084164 0.36394563685387754 0.10510472338581538 0.544323513393465 0.5250798556852652 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6136632561699978 0.06999144370173331 0.15081594812615057 0.3467488798267245 0.23345482381171254 0.5812553476864167 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8102960460761223 0.8168498357092964 0.07542290103199577 0.18434873295426168 0.1360998223856702 0.10523514549891647 0.8188217602774566 0.7788074090792125 0.07214278210859604 0.1771954947250741 0.12122668903447326 0.09215525578400566 0.7604808922846897 0.7379048076404979 0.08777369617111722 0.1862940145830876 0.12636477066420995 0.08503858748590276 0.031291373843113854 0.030846343459486926 0.12416841205148817 0.14795534611527345 0.1621004748282959 0.13824693030918028 0.03242136921350777 0.03686543182013125 0.10802495676074557 0.14317943827289892 0.12719087395553674 0.1340698989348515 0.059879776928827566 0.06600915955720792 0.13279243663331838 0.1539957589223596 0.13978163669372642 0.11942654226499795 0.15645686921556926 0.1503759243649988 0.7984984036541855 0.6657990575187305 0.6998926383762893 0.7545978279376091 0.1468497311435352 0.18238687321538619 0.817903244045645 0.6777160078250549 0.7496553025561181 0.7718595610106449 0.17770772507910115 0.1941445869329645 0.7775093391284149 0.6578090442856347 0.7319121810213174 0.7936086356964381 );
}

}
