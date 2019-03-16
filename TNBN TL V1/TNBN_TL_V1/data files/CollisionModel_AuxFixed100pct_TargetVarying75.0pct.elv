// Bayesian Network
//   Elvira format 

bnet  "data files/CollisionModel_AuxFixed100pct_TargetVarying75.0pct.elv" { 

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
pos_x =241;
pos_y =140;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =532;
pos_y =152;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =272;
pos_y =246;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[44.0-115.0]" "[17.0-44.0]" "[0.0-17.0]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =500;
pos_y =253;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[22.0-73.0]" "[0.0-22.0]");
}

// Links of the associated graph:

link Colision Pupilas_Dilatadas;

link Colision Signos_Vitales;

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Heridas_Internas Colision;

link Heridas_Internas Signos_Vitales;

//Network Relationships: 

relation Colision Herida_Cabeza Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2649776489955287 0.27696388673026945 0.04945453428434947 0.08978462711523623 0.04781627581177407 0.02979678806616481 0.37060080204214474 0.33504908265809 0.5663011100838716 0.4089985004939286 0.3060178932558394 0.38198729546456633 0.36442154896232654 0.3879870306116405 0.38424435563177894 0.5012168723908352 0.6461658309323864 0.588215916469269 );
}

relation Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4890430616628283 0.5109569383371716 );
}

relation Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.22686171752037856 0.3942520953055649 0.37888618717405653 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6229415361062125 0.42950820205917234 0.6748743368635067 0.5244412746319171 0.37038348650466507 0.5967195771543786 0.13245637402065455 0.20991634522459726 0.11596602800700867 0.13720853708544692 0.19880390753198499 0.10797451357563712 0.11293673608722962 0.17092341750877832 0.09521550871540538 0.12869848009255627 0.17492968893291327 0.1071763405862304 0.13166535378590336 0.18965203520745202 0.1139441264140791 0.2096517081900797 0.2558829170304367 0.1881295686837538 );
}

relation Signos_Vitales Colision Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6365943590940332 0.6030951312479544 0.4736020976444111 0.6800522455419121 0.6426306987830418 0.6932403583155885 0.41768791280618817 0.5561019706278048 0.5589478158030985 0.19636099317750333 0.23027313996002008 0.2656854371028295 0.16507616433612063 0.19871390601122796 0.17964875743906117 0.2906336352323017 0.21462707504951278 0.2239261087357881 0.16704464772846356 0.16663172879202548 0.2607124652527593 0.15487159012196736 0.1586553952057303 0.12711088424535044 0.29167845196151027 0.22927095432268255 0.21712607546111345 );
}

}
