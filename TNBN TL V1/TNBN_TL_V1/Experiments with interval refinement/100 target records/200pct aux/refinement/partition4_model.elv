// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/200pct aux/refinement/partition4_model.elv" {

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
num-states = 3;
states = ("Default" "[36-54]" "[7-36]");
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
states = ("Default" "[23-40]" "[4-23]");
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
values= table (0.26370106781886765 0.38974958892964784 0.34654934325148445 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7868464177806402 0.6167566021734775 0.08041105929385561 0.21315358221935976 0.3832433978265226 0.9195889407061444 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.28881160680323864 0.18649037656903766 0.06398633909094159 0.6365646905395859 0.15364853556485356 0.3886296177091155 0.07462370265717547 0.6598610878661088 0.5473840431999427 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6447248463257276 0.09331367265439508 0.7312435466719622 0.07832506740637146 0.6186902202566504 0.08358143002046196 0.09474004097980598 0.3028260658525835 0.07678755809372508 0.29162370914095276 0.09623532536379774 0.2654206425772439 0.1985897012845933 0.4300488509149114 0.1462620154166192 0.4446361491223169 0.20881249843088193 0.4626927417900603 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8245710915548016 0.8094844685252017 0.04503287109097407 0.16222588118283482 0.12652830367909795 0.06808624710983958 0.06510763612399117 0.08426648507539154 0.35135583044766044 0.26844805097582286 0.2815914914217282 0.30345553803167075 0.07415036336343439 0.07693896463405316 0.4252306460802455 0.43239954519595625 0.4376326363496922 0.4488987248989212 );
}

}
