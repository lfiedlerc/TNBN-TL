// Bayesian Network
//   Elvira format 

bnet  "auxVarying Baseline Experiments/aux500pct/partition0_model.elv" { 

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
pos_x =254;
pos_y =147;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =562;
pos_y =149;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =258;
pos_y =216;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[35-89]" "[13-35]" "[0-13]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =562;
pos_y =226;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[17-62]" "[0-17]");
}

// Links of the associated graph:

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Colision;

link Heridas_Internas Signos_Vitales;

link Signos_Vitales Colision;

//Network Relationships: 

relation Colision Herida_Cabeza Heridas_Internas Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5882352941176471 0.3333333333333333 0.6666666666666666 0.6 0.5 0.7500000000000001 0.20000000000000004 0.10000000000000002 0.03333333333333333 0.20000000000000004 0.28571428571428575 0.2222222222222222 0.28571428571428575 0.3333333333333333 0.28571428571428575 0.20000000000000004 0.14285714285714282 0.023809523809523808 0.29411764705882354 0.3333333333333333 0.16666666666666666 0.22857142857142856 0.25 0.125 0.6 0.6 0.8666666666666667 0.20000000000000004 0.4285714285714286 0.3333333333333333 0.14285714285714288 0.2222222222222222 0.14285714285714288 0.6 0.14285714285714282 0.33333333333333326 0.11764705882352941 0.3333333333333333 0.16666666666666666 0.17142857142857143 0.25 0.125 0.20000000000000004 0.3 0.10000000000000002 0.6 0.28571428571428575 0.4444444444444444 0.5714285714285715 0.4444444444444444 0.5714285714285715 0.20000000000000004 0.7142857142857143 0.6428571428571428 );
}

relation Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5069510089591773 0.4930489910408228 );
}

relation Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2173435264894743 0.3468844659584912 0.43577200755203443 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.647778046802985 0.1291345602552115 0.10143133051112545 0.10240726017267003 0.13476591649967565 0.21804175978203355 0.11602470618621394 0.5504164197900849 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8511689902032645 0.8083549052189722 0.2782164965159182 0.32931032767993074 0.15991731766986897 0.1202957685935234 0.04330388997300101 0.05613541852630019 0.20139445697152664 0.22366941776544363 0.2261823513111123 0.17393895880507743 0.10552711982373442 0.13550967625472765 0.5203890465125552 0.44702025455462574 0.6139003310190188 0.7057652726013992 );
}

}
