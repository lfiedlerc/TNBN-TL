// Bayesian Network
//   Elvira format 

bnet  "data files/aux100pct/CollisionModel_TargetFixed200Records_AuxVarying100.0pct_Partition2.elv" { 

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
pos_x =262;
pos_y =181;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =550;
pos_y =177;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =262;
pos_y =301;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[41.0-80.0]" "[17.0-41.0]" "[0.0-17.0]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =549;
pos_y =305;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[20.0-80.0]" "[0.0-20.0]");
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
values= table (0.15223870313240107 0.11058440893398319 0.4508323994395542 0.4116216754135166 0.3969288974280448 0.47779391565250035 );
}

relation Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5733607082459758 0.4266392917540242 );
}

relation Heridas_Internas Colision Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3492000554724446 0.3739497783428757 0.31301603170606696 0.41029150176112944 0.3066037836175363 0.23265942297271303 0.3113526201772643 0.292135240096439 0.2110428245437396 0.47869361481072265 0.3526823896806712 0.4503986465783761 0.34500012148294623 0.2803273822747529 0.15543472510591447 0.45637951799481724 0.35590754897047805 0.35642218677858845 0.17210632971683273 0.27336783197645315 0.236585321715557 0.24470837675592427 0.4130688341077108 0.6119058519213725 0.23226786182791842 0.35195721093308296 0.43253498867767187 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.42163667041200453 0.19294529080753806 0.17834217361441573 0.1751278226573042 0.19088142847967832 0.23666241198789192 0.20913972749390147 0.3952644745472658 );
}

relation Signos_Vitales Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.41133756670289917 0.34127627639266467 0.3220015377428937 0.24965455520551444 0.2165457718797826 0.2500725332295559 0.3390078780915864 0.4421779517275527 0.4279259290275505 );
}

}
