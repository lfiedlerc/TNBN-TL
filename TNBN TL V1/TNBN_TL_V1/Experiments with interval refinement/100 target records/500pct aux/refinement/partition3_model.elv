// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/500pct aux/refinement/partition3_model.elv" {

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
states = ("Default" "[36-54]" "[6-36]");
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
states = ("Default" "[20-34]" "[6-20]");
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
values= table (0.22995085738941318 0.39561939107307653 0.37442975153751035 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8888778391099771 0.5517475314506828 0.09624817266698713 0.11112216089002297 0.4482524685493173 0.903751827333013 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2473548790458327 0.23574185627853064 0.12587286085892876 0.684893954696292 0.15067655414564693 0.4429821922945483 0.06775116625787524 0.6135815895758223 0.43114494684652277 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6440724286136149 0.10921359332470104 0.6685207570828424 0.09125126498866137 0.5829370770370869 0.06180144290424308 0.1186425237954617 0.3291259012615562 0.09470835511918788 0.2570919800425005 0.14624284311686564 0.2529368958900607 0.18695185567769723 0.3881539161617266 0.17302487954467016 0.47847674063465373 0.21665606387683797 0.4682023392007506 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8179530476400347 0.8555217764539822 0.08404707499973747 0.2224253073054765 0.10520582209044682 0.05551603071142014 0.04272530514570613 0.038897983262389406 0.2447339838900505 0.24063512429807427 0.22952636226938436 0.24015341913599564 0.06687439066284438 0.06853454193849562 0.30771699444998996 0.2891213060596265 0.32815097105701047 0.36023012870399346 );
}

}
