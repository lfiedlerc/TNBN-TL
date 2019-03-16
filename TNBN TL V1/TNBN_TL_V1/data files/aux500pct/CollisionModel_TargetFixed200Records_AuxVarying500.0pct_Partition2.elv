// Bayesian Network
//   Elvira format 

bnet  "data files/aux500pct/CollisionModel_TargetFixed200Records_AuxVarying500.0pct_Partition2.elv" { 

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
pos_x =272;
pos_y =163;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =561;
pos_y =166;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =271;
pos_y =277;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[39.0-79.0]" "[15.0-39.0]" "[0.0-15.0]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =561;
pos_y =274;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[19.0-64.0]" "[0.0-19.0]");
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
values= table (0.237250375901144 0.4027458464433168 0.3600037776555392 );
}

relation Herida_Cabeza Colision Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6042772050784507 0.5106059824679948 0.5296562328758824 0.5628432500532142 0.5038335430217747 0.48681336893506255 0.4649806426107457 0.4461022179908506 0.3664985677112816 0.39572279492154927 0.4893940175320053 0.4703437671241175 0.4371567499467857 0.4961664569782252 0.5131866310649374 0.5350193573892544 0.5538977820091495 0.6335014322887185 );
}

relation Heridas_Internas Colision Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3563991944273673 0.37991609408860166 0.3169970452010697 0.42265728043971873 0.3175993298622994 0.24219113446350782 0.300914805228271 0.29148389199007935 0.20495497454876466 0.47911963971601834 0.3530624207939837 0.45311630255116137 0.3488273480594924 0.2839892655310629 0.16240196697025044 0.473454514571542 0.3658704921671123 0.35774037921401064 0.16448116585661432 0.2670214851174145 0.22988665224776894 0.22851537150078882 0.3984114046066377 0.5954068985662416 0.22563068020018698 0.34264561584280834 0.4373046462372247 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.467392092154062 0.18220512556024698 0.1627107171464161 0.16550327563142092 0.179487310307934 0.24932483616195306 0.19040988039158777 0.402966762646379 );
}

relation Signos_Vitales Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4139727654598536 0.3439188014005374 0.32191043216213283 0.244326879794502 0.2106571995639762 0.24070248865306323 0.3417003547456443 0.4454239990354864 0.4373870791848039 );
}

}
