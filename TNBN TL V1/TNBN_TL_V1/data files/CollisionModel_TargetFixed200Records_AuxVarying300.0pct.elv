// Bayesian Network
//   Elvira format 

bnet  "data files/CollisionModel_TargetFixed200Records_AuxVarying300.0pct.elv" { 

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
pos_x =270;
pos_y =161;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =569;
pos_y =158;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =274;
pos_y =261;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[38.0-82.0]" "[16.0-38.0]" "[0.0-16.0]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =530;
pos_y =267;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[26.0-111.0]" "[0.0-26.0]");
}

// Links of the associated graph:

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Signos_Vitales Heridas_Internas;

//Network Relationships: 

relation Colision Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.17990335785010297 0.05055364127218435 0.4331735751619763 0.36527800600745247 0.38692306698792084 0.5841683527203633 );
}

relation Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4996472941770219 0.500352705822978 );
}

relation Heridas_Internas Colision Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.47794414290169407 0.40205761588583994 0.3529035998168123 0.3095871128414793 0.2478661804797167 0.38499847559977546 0.15490494559719523 0.20245895871839362 0.3106701075234808 0.3952052621207386 0.337587074432653 0.3592440419086108 0.1605160057775414 0.2355278359594135 0.31691793791690054 0.4074968082788832 0.43302404660555016 0.3930651091135728 0.12685059497756743 0.26035530968150705 0.28785235827457695 0.5298968813809793 0.5166059835608698 0.29808358648332406 0.43759824612392156 0.36451699467605625 0.2962647833629464 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5480059000174495 0.4404554938235418 0.17005116761294953 0.16002450548171399 0.13026465155240802 0.15522434589406361 0.15167828081719298 0.24429565480068058 );
}

relation Signos_Vitales Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4579364747419382 0.5724260767025345 0.5318949911637372 0.26216087939982147 0.20294958808536456 0.22801056604890807 0.2799026458582404 0.22462433521210087 0.2400944427873547 );
}

}
