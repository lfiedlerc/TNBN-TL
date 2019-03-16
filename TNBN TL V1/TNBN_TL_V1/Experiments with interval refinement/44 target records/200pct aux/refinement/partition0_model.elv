// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/200pct aux/refinement/partition0_model.elv" {

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
states = ("Default" "[36-54]" "[6-36]");
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
states = ("Default" "[32-41]" "[14-32]" "[4-14]");
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
values= table (0.27097229277238966 0.3698363478637524 0.35919135936385793 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8493464177806402 0.6353463457632211 0.09056978945258576 0.15065358221935976 0.364653654236779 0.9094302105474141 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.16507858373474912 0.2370441545655919 0.11521098368709028 0.7815090889912449 0.1935082451390598 0.4282562295665136 0.05341232727400582 0.5694476002953482 0.45653278674639614 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6482209783426821 0.10436440678511656 0.7264728933110784 0.08397187796562144 0.6588930478135573 0.07758330151875054 0.11605081126839353 0.35288042372666406 0.08513757625416762 0.3011599305318505 0.12403889170416099 0.30027989989545545 0.17588951082865895 0.40840983050598684 0.1431035856187073 0.4517398957977757 0.15322451328161063 0.45671314115835737 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8042714261232704 0.8211642272161744 0.040219665681877896 0.16428148810891313 0.09842195913842255 0.06535739207122486 0.043495238639273244 0.042404358495133895 0.21487619425032586 0.15096850537387374 0.19140644915116822 0.1847757938899498 0.06524285795890986 0.07374671042631982 0.3581269904172098 0.3127204754173099 0.3202033121313936 0.31752733513127296 0.057993651519030985 0.029498684170527926 0.2542701631962189 0.24262795506515425 0.22897220085373393 0.2439758055245939 );
}

}
