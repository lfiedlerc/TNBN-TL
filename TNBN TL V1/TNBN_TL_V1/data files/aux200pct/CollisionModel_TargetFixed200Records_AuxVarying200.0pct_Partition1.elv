// Bayesian Network
//   Elvira format 

bnet  "data files/aux200pct/CollisionModel_TargetFixed200Records_AuxVarying200.0pct_Partition1.elv" { 

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
pos_x =273;
pos_y =197;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =565;
pos_y =181;
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
pos_y =314;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[39.0-113.0]" "[15.0-39.0]" "[0.0-15.0]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =565;
pos_y =305;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[19.0-59.0]" "[0.0-19.0]");
}

// Links of the associated graph:

link Colision Heridas_Internas;

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Signos_Vitales Heridas_Internas;

//Network Relationships: 

relation Colision Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.1469106133169264 0.11754412894691052 0.41240486201088744 0.3637524798754241 0.44068452467218616 0.5187033911776654 );
}

relation Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5103908235902281 0.4896091764097719 );
}

relation Heridas_Internas Colision Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.36530749144794106 0.3750575433906256 0.3332245613299165 0.45459302629841575 0.32404249575370425 0.2513088138675077 0.29526627099864405 0.2544578445879026 0.22140353044367528 0.464208715504089 0.35456073379492625 0.38766347986159294 0.2819613494683121 0.288796989479565 0.207322770905722 0.4412710152282684 0.41133686388752666 0.3616400776004818 0.17048379304796987 0.2703817228144481 0.27911195880849055 0.2634456242332722 0.3871605147667307 0.5413684152267704 0.26346271377308755 0.33420529152457085 0.41695639195584283 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.452284756684224 0.1733830689833202 0.17679183600782253 0.16992688785083251 0.1680217186795007 0.25724249588029796 0.20290168862845276 0.39944754728554915 );
}

relation Signos_Vitales Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4088078904770034 0.2743625557133248 0.2234754318277593 0.2512920610870087 0.36771667769523725 0.4743453831996665 );
}

}
