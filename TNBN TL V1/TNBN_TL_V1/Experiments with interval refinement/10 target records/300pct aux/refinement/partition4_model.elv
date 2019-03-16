// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/300pct aux/refinement/partition4_model.elv" {

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
states = ("Default" "[43-55]" "[19-43]" "[5-19]");
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
states = ("Default" "[21-35]" "[6-21]");
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
values= table (0.26987825880062344 0.4289737916041485 0.30114794959522806 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8426320144523862 0.5386984616012389 0.14170357734871053 0.15736798554761383 0.46130153839876115 0.8582964226512895 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2554224979560429 0.2058105007423404 0.1753050741149476 0.619787909392584 0.12709542448373598 0.4181353361968353 0.12478959265137306 0.6670940747739236 0.406559589688217 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6576088911134279 0.07355291173155855 0.7040704016945928 0.07383166768139979 0.6348088186830098 0.06877346336519055 0.07717581345207171 0.23534076303062376 0.07146779207733447 0.19751618556615308 0.10060723063115652 0.20952597074283213 0.12862635575345285 0.37952841361980877 0.12228933311010566 0.3784343723452345 0.1384982655441895 0.3608502829459887 0.08881343611547933 0.1856208835171117 0.06511509944823808 0.23735138265512512 0.08166171317464004 0.2361324432181124 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8539873715014692 0.8461010195343068 0.05180586972078554 0.14230640330310712 0.10014443277310923 0.062338901379877576 0.044724588909459885 0.04835246244433807 0.29450194710647054 0.22481735209649256 0.2213289276662191 0.274396335861903 0.04972321943463482 0.059680753645582986 0.3711064998220265 0.3603237013053374 0.35703425557835344 0.346783099310135 );
}

}
