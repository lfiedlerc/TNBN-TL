// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/200pct aux/refinement/partition3_model.elv" {

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
states = ("Default" "[50-64]" "[24-50]" "[7-24]");
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
states = ("Default" "[27-49]" "[4-27]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2433926702222942 0.4057750871866772 0.35083224259102863 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8325817948222527 0.6451192702803521 0.12030623372144728 0.16741820517774736 0.35488072971964785 0.8796937662785528 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.15528622516200158 0.2869153880959236 0.12428917424229742 0.7286305826678496 0.134484389782403 0.4560585513943066 0.1160831921701487 0.5786002221216734 0.41965227436339586 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.641297910695509 0.07418502077976878 0.0663495194089232 0.21574421461466928 0.1700206434853657 0.46290748961011563 0.12025850392867328 0.24506867097006121 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8351631503118377 0.8460233853013379 0.05136706825998505 0.1474805324159315 0.10631894262907778 0.07328254651416709 0.8344616085677758 0.8462428283427221 0.04973480567619992 0.14689792525176043 0.10615124320539002 0.07228736790903925 0.8331055319042494 0.8430156210983788 0.051644728399604586 0.1476376348072111 0.10520898092287631 0.07238225937231098 0.015806273257768982 0.025279742711720645 0.0976221808949456 0.10513644908543472 0.10920292222238201 0.1259615956194336 0.013422031737747902 0.015375717165727786 0.11192012288702534 0.10140231379436439 0.11570123501656118 0.10927384368379105 0.021155636800869793 0.01935423849472042 0.09205254329304066 0.09721904961084861 0.10684071869577595 0.10526158758895762 0.14677253739356913 0.12639871355860322 0.848888529521266 0.7450974435185157 0.7822495040827773 0.7985065436589094 0.14987935440485156 0.1361849234678747 0.8362333710049441 0.7494953628279107 0.7758788701110573 0.8162087099646433 0.14338820498367305 0.13547966946304293 0.8541619714865865 0.7528824074514554 0.7857244520751856 0.8201632032972948 );
}

}
