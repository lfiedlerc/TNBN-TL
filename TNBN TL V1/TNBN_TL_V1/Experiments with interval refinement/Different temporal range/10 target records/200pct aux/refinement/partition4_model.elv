// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/200pct aux/refinement/partition4_model.elv" {

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
states = ("Default" "[49-62]" "[22-49]" "[8-22]");
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
states = ("Default" "[32-47]" "[22-32]" "[4-22]");
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
values= table (0.26646959329921727 0.3903904718020618 0.34313993489872097 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8625817948222527 0.6101986353597172 0.10530623372144726 0.13741820517774733 0.3898013646402828 0.8946937662785528 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.15528622516200158 0.2930489284685944 0.13246722807252517 0.7695208518189884 0.14061793015507384 0.4724146590547622 0.07519292301900998 0.5663331413763317 0.3951181128727127 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6412653702510516 0.074158566850541 0.06087617959376094 0.21916053248465456 0.18697683732369436 0.48304770425189164 0.1087074635602874 0.22139686444878368 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8354310074546949 0.8464698138727665 0.051189882236535256 0.1474805324159315 0.10631894262907778 0.0729392485937331 0.8344616085677758 0.8461789589621762 0.04985385329524754 0.14689792525176043 0.10615124320539003 0.07259091589317135 0.8331055319042494 0.8430156210983788 0.05142886040683786 0.1476376348072111 0.10489578019954901 0.07210472183005137 0.01082690740429639 0.013350450967585518 0.05718275263306595 0.08097810246181125 0.07258323308596323 0.06683461231068435 0.010477113381786337 0.01357244479745504 0.05650648890094343 0.06664859958970622 0.07394369277619646 0.06828902994610853 0.008669842498480552 0.01820108740888362 0.06268091230791821 0.07769522899880649 0.06696540297758985 0.07325489038183805 0.028149959251170614 0.022250751612642526 0.14825158090054136 0.09672384460716343 0.1383617880701174 0.13151326938554017 0.02933591746900175 0.018096593063273388 0.13812697286897282 0.10219451937088286 0.10656591017745957 0.13657805989221705 0.026009527495441654 0.015925951482773166 0.14834482579540642 0.09597645935146684 0.1294664457566737 0.1331907097851601 0.12342674440897884 0.11570390838574114 0.7412579045027067 0.6725681287800435 0.6804678101809052 0.7265569144742139 0.1236299379050788 0.1198899290441862 0.753419852012579 0.682037335801327 0.7111643393475364 0.7203391223347577 0.13004763747720827 0.12058220408385396 0.7354560377462404 0.676405523048433 0.6964401909669344 0.7192298328398644 );
}

}
