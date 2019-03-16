// Bayesian Network
//   Elvira format 

bnet  "data files/CollisionModel_AuxFixed100pct_TargetVarying50.0pct.elv" { 

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
pos_x =239;
pos_y =152;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =533;
pos_y =163;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =265;
pos_y =262;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[35.0-86.0]" "[13.0-35.0]" "[0.0-13.0]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =532;
pos_y =263;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[23.0-97.0]" "[0.0-23.0]");
}

// Links of the associated graph:

link Colision Pupilas_Dilatadas;

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Heridas_Internas Colision;

link Heridas_Internas Signos_Vitales;

//Network Relationships: 

relation Colision Herida_Cabeza Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.24608164603383914 0.28037280144046534 0.059870028179844575 0.08977120572676205 0.04638504352253449 0.03730419403889834 0.3873661727717518 0.3111470742320254 0.5428575983864957 0.42346648874874926 0.31637883078424955 0.3918066407492153 0.3665521811944092 0.4084801243275093 0.3972723734336596 0.4867623055244886 0.6372361256932159 0.5708891652118865 );
}

relation Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.45760028444040846 0.5423997155595915 );
}

relation Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.24949503796486547 0.3877679580137063 0.3627370040214283 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5896855823136002 0.38079225146852363 0.5731080438482852 0.4867207755472928 0.4024368570717842 0.5400910511760831 0.146093839780913 0.23356707788149772 0.1607648777520673 0.14810673289763793 0.153834990730791 0.1473482444820512 0.12877783718523095 0.18948788355747684 0.12973108743231127 0.15637959033162332 0.19565742065280112 0.1300736967250216 0.13544274072025592 0.19615278709250178 0.1363959909673362 0.20879290122344593 0.24807073154462372 0.18248700761684422 );
}

relation Signos_Vitales Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5823802376284326 0.5676103642865222 0.5201320607310206 0.20248374879404343 0.2167288197961532 0.22140807372966512 0.21513601357752396 0.21566081591732464 0.25845986553931427 );
}

}
