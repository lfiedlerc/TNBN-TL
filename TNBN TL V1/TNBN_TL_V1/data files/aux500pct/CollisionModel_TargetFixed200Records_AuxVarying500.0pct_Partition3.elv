// Bayesian Network
//   Elvira format 

bnet  "data files/aux500pct/CollisionModel_TargetFixed200Records_AuxVarying500.0pct_Partition3.elv" { 

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
pos_x =284;
pos_y =177;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =557;
pos_y =171;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =287;
pos_y =296;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[39.0-88.0]" "[16.0-39.0]" "[0.0-16.0]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =556;
pos_y =295;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[22.0-90.0]" "[0.0-22.0]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Signos_Vitales Herida_Cabeza;

link Signos_Vitales Heridas_Internas;

//Network Relationships: 

relation Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.22739815915237555 0.4027458464433168 0.36985599440430766 );
}

relation Herida_Cabeza Colision Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5760075974935414 0.4828972064825612 0.5059330681032363 0.5593530165004265 0.5067834680718641 0.4762909720221594 0.45548415503813383 0.39724268359503856 0.35379615557174 0.42399240250645875 0.5171027935174388 0.4940669318967636 0.4406469834995735 0.4932165319281358 0.5237090279778406 0.5445158449618661 0.6027573164049616 0.6462038444282601 );
}

relation Heridas_Internas Colision Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3707207088836585 0.3478688103517758 0.29927809761662 0.4025434702169549 0.3758853839866905 0.29891382869905203 0.24832540355835062 0.2730072139050944 0.22338228914557812 0.44922396461995384 0.3763573705347513 0.49351918480121093 0.3455216197539211 0.29006948102035734 0.2392653295910221 0.4706177987498101 0.41057022695831846 0.37768946531637787 0.1800553264963877 0.27577381911347293 0.20720271758216902 0.251934910029124 0.3340451349929521 0.4618208417099258 0.28105679769183933 0.3164225591365871 0.39892824553804396 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.48683696829468065 0.17062539475537405 0.16158145015758932 0.15587535112175147 0.16874168148925914 0.24140084144912155 0.18283990005847084 0.4320984126737529 );
}

relation Signos_Vitales Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3941297233732662 0.3504427848066876 0.335785477224435 0.2422694915804455 0.22134590688458175 0.2503673734423369 0.36360078504628834 0.4282113083087307 0.4138471493332281 );
}

}
