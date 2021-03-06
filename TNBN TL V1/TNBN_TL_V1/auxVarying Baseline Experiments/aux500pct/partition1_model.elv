// Bayesian Network
//   Elvira format 

bnet  "auxVarying Baseline Experiments/aux500pct/partition1_model.elv" { 

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
pos_x =371;
pos_y =54;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Leve" "Moderado" "Severo");
}

node Herida_Cabeza(finite-states) {
title = "Herida Cabeza";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =240;
pos_y =113;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =513;
pos_y =110;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =233;
pos_y =173;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[35-78]" "[12-35]" "[0-12]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =477;
pos_y =178;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[19-59]" "[0-19]");
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
values= table (0.22914033806663148 0.4030260901534501 0.3678335717799185 );
}

relation Herida_Cabeza Colision Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.9311901937765893 0.8635673126608797 0.7637430595853085 0.721184183464443 0.6805858030270098 0.5085460686243225 0.16777669668137252 0.2397653407262556 0.09880979818899074 0.06880980622341074 0.13643268733912026 0.23625694041469145 0.278815816535557 0.3194141969729903 0.4914539313756774 0.8322233033186274 0.7602346592737443 0.9011902018110093 );
}

relation Heridas_Internas Colision Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.36355733607033014 0.3593906694036635 0.35105733607033013 0.31360436225827965 0.18230001443219268 0.16076155289373117 0.20782583686587752 0.10941313845317913 0.09405960309964378 0.5887569549721979 0.538756954972198 0.5637569549721979 0.2260203102873632 0.14688987550475446 0.13304372165860062 0.40319940394286896 0.32065972140318655 0.4063162870597522 0.047685708957471915 0.10185237562413857 0.0851857089574719 0.46037532745435716 0.6708101100630528 0.7061947254476681 0.38897475919125335 0.5699271401436343 0.4996241098406041 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.697778046802985 0.1152456713663226 0.08928847336826831 0.08990726017267003 0.10419448792824709 0.22406027830055208 0.10873899190049963 0.5707867901604553 );
}

relation Signos_Vitales Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.49006120317452495 0.334443225646435 0.3067278698411916 0.13933501930229364 0.1869005623734547 0.1448905748578492 0.37060377752318147 0.4786562119801104 0.5483815553009592 );
}

}
