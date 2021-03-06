// Bayesian Network
//   Elvira format 

bnet  "data files/aux100pct/CollisionModel_TargetFixed200Records_AuxVarying100.0pct_Partition1.elv" { 

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
pos_x =265;
pos_y =190;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =555;
pos_y =191;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =266;
pos_y =314;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[41.0-87.0]" "[16.0-41.0]" "[0.0-16.0]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =557;
pos_y =316;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[22.0-68.0]" "[0.0-22.0]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Heridas_Internas Pupilas_Dilatadas;

link Signos_Vitales Herida_Cabeza;

link Signos_Vitales Heridas_Internas;

//Network Relationships: 

relation Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.26070144884080637 0.3669334276985773 0.37236512346061634 );
}

relation Herida_Cabeza Colision Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5135096716032793 0.42022781002611176 0.4247888585012037 0.49069323287668304 0.43406982193223903 0.4238469053891711 0.4139669598316641 0.3601140000908727 0.26424441139394544 0.4864903283967207 0.5797721899738881 0.5752111414987964 0.509306767123317 0.565930178067761 0.576153094610829 0.5860330401683359 0.6398859999091273 0.7357555886060545 );
}

relation Heridas_Internas Colision Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.37390720419965784 0.38397811742728727 0.3404641785223663 0.44958914025691216 0.3225627752302842 0.2537072583075669 0.2979934489747407 0.25711930763536067 0.22542262027484905 0.4566421885855538 0.3482392658447038 0.38350640855921914 0.2820089756536965 0.2872239861281293 0.20902330128541707 0.43732636957925797 0.41121530902847453 0.3619328266099112 0.16945060721478836 0.2677826167280088 0.2760294129184145 0.2684018840893913 0.3902132386415864 0.537269440407016 0.26468018144600125 0.3316653833361648 0.4126445531152398 );
}

relation Pupilas_Dilatadas Herida_Cabeza Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4772178121784496 0.4851555267726313 0.4323185175273405 0.22173204729189225 0.20723730252176623 0.16488357976005097 0.15910292938971665 0.17684925656079747 0.18584291447915882 0.18684535222053988 0.16353928774178814 0.18519826449951288 0.17066824488625185 0.16386773721914488 0.1739043460635478 0.2002616934155168 0.26699726272480967 0.25182075143070703 0.193011013545582 0.1741274794474264 0.20793422192995287 0.39116090707205103 0.3622261470116359 0.3980974043097291 );
}

relation Signos_Vitales Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.40796983453113767 0.32964125854536147 0.33957982068979764 0.23481635343504706 0.2259002088707984 0.24728156345177105 0.35721381203381525 0.44445853258384005 0.4131386158584312 );
}

}
