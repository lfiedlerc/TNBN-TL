// Bayesian Network
//   Elvira format 

bnet  "data files/CollisionModel_TargetFixed200Records_AuxVarying100.0pct.elv" { 

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
pos_x =271;
pos_y =168;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =568;
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
pos_x =269;
pos_y =276;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[41.0-97.0]" "[17.0-41.0]" "[0.0-17.0]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =559;
pos_y =273;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[25.0-95.0]" "[0.0-25.0]");
}

// Links of the associated graph:

link Colision Signos_Vitales;

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Heridas_Internas Colision;

link Heridas_Internas Signos_Vitales;

link Signos_Vitales Pupilas_Dilatadas;

//Network Relationships: 

relation Colision Herida_Cabeza Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.27402301971133963 0.2839127018119751 0.08130141696365745 0.07249513583051453 0.05658118404290294 0.04002745610495115 0.3617816700023939 0.33190861315164943 0.5191550895896646 0.393122607631364 0.29539248109799204 0.36573768064707707 0.36419531028626645 0.3841786850363755 0.39954349344667794 0.5343822565381214 0.648026334859105 0.5942348632479717 );
}

relation Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4472978022836172 0.5527021977163828 );
}

relation Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2519953027299573 0.3791791797224168 0.368825517547626 );
}

relation Pupilas_Dilatadas Herida_Cabeza Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5549828855041313 0.3764210139679873 0.32881290330254226 0.4990520468187845 0.3376862628124869 0.23399314016003078 0.1633861117432105 0.21284852184403363 0.22303607712598802 0.14054337700645853 0.18880114813084703 0.21458314710526824 0.14278345897190073 0.20733318968956124 0.22604346738130657 0.13869379452022854 0.19524780096118308 0.2342033628002005 0.13884754378075745 0.20339727449841796 0.22210755219016323 0.22171078165452845 0.278264788095483 0.31722034993450043 );
}

relation Signos_Vitales Colision Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5449041431629318 0.5741084249496939 0.45561205665515486 0.639746654399328 0.5354151837641186 0.6524159331321594 0.4550784035950064 0.5459698162000131 0.564662211628799 0.2507556981190245 0.22903164852344868 0.2733793197885938 0.167394590279673 0.24521453117836556 0.18752346430141262 0.24282378876841598 0.20273165360966466 0.19560602153239326 0.2043401587180438 0.1968599265268575 0.27100862355625127 0.19285875532099886 0.21937028505751607 0.160060602566428 0.3020978076365778 0.25129853019032233 0.2397317668388076 );
}

}
