// Bayesian Network 
//   Elvira format 

bnet "Network" {

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
states = ("Default" "[49-66]" "[22-49]" "[0-22]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[32-45]" "[15-32]" "[0-15]");
}

// Links of the associated graph:

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Colision;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5882352941176471 0.4 0.049999999999999996 0.5714285714285714 0.09090909090909091 0.043478260869565216 0.29411764705882354 0.4 0.8999999999999999 0.21428571428571425 0.13636363636363635 0.4782608695652174 0.11764705882352941 0.2 0.049999999999999996 0.21428571428571425 0.7727272727272727 0.4782608695652174 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.43499075337985355 0.5650092466201464 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2755309709135209 0.33946377048960524 0.38500525859687396 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6176820035221524 0.08343904112230657 0.07455200931318026 0.18663842106178838 0.1624851485030852 0.4102349453041289 0.14336924867919282 0.31783968735274853 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8409963383280388 0.8260017241917679 0.0730800103419444 0.18246724964706204 0.12883061236925852 0.09197747371994214 0.016835681824090013 0.01870949202239055 0.04289569368638889 0.07381785556234202 0.05572512074397067 0.055706903452764286 0.0729546212377234 0.06174132367388882 0.38233118285694445 0.2897350830821924 0.36221328483580933 0.3862345306058324 0.06734272729636005 0.0916765109097137 0.4998280829544444 0.4521343653193449 0.4513734780261624 0.4642241954397024 );
}

}
