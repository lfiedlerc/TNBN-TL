// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/200pct aux/refinement/partition2_model.elv" {

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
states = ("Default" "[41-55]" "[17-41]" "[5-17]");
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
states = ("Default" "[23-40]" "[5-23]");
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
values= table (0.20288718638941095 0.3528150712680077 0.44429774234258135 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7743464177806403 0.5889177743346496 0.10326820215099847 0.22565358221935977 0.4110822256653504 0.8967317978490016 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2687786411635784 0.2966716875871687 0.09121505388277859 0.6432423457528059 0.12610320781032075 0.49184544354793963 0.0879790130836156 0.5772251046025104 0.4169395025692818 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6525860577077615 0.10043583535654513 0.7132075871886294 0.07305917955292304 0.661137945772741 0.07099739230126237 0.08504403795695423 0.28908149801915417 0.06811319804270051 0.23128697454095343 0.0973327177035744 0.2264106935590734 0.12304243789516782 0.36090298821024835 0.10754715480426397 0.34961984523632494 0.11715975279133956 0.3432098608712938 0.08142514272474341 0.1274831450891922 0.06990565062277157 0.19722145115895254 0.07750568261580924 0.20664468062931302 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8184579340597782 0.8037039097558569 0.05053712599933822 0.16428148810891313 0.10933465755112096 0.06411022653834504 0.0636333014635829 0.08038792267141097 0.3693356530742612 0.27376985734363185 0.3171987235683131 0.3257616326856914 0.07486270760421518 0.07664894952390348 0.3765422024025395 0.390842493707685 0.3870899677443821 0.4013527297729789 );
}

}
