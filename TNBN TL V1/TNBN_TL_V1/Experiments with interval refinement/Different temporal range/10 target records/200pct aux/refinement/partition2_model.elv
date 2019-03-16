// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/200pct aux/refinement/partition2_model.elv" {

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
states = ("Default" "[43-70]" "[21-43]" "[0-21]");
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
states = ("Default" "[41-48]" "[25-41]" "[4-25]");
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
values= table (0.2587772856069096 0.3903904718020618 0.35083224259102863 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8575817948222526 0.6101986353597172 0.10030623372144726 0.14241820517774734 0.3898013646402828 0.8996937662785527 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.17164233282245708 0.3543843321953026 0.12428917424229742 0.6959183673469387 0.14061793015507384 0.4560585513943066 0.1324392998306042 0.5049977376496236 0.41965227436339586 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6458702765803338 0.09346461753692009 0.10515254446042387 0.29497467976767705 0.1229657550555073 0.2887546187796413 0.12601142390373496 0.32280608391576165 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8354310074546949 0.8460233853013379 0.05115965853006614 0.1474805324159315 0.10631894262907778 0.07328254651416709 0.8346104180915854 0.8461789589621762 0.05000266281905706 0.14689792525176043 0.10623084852027327 0.07218532709271272 0.8331055319042494 0.8430156210983788 0.05142886040683786 0.14756439791751852 0.10485183806573346 0.07208500067796918 0.004571360904036253 0.00446309028112064 0.03600510224327875 0.01987739691258191 0.03293664830605364 0.03530352203755554 0.004352357418642488 0.0073248114779916095 0.03975759781153726 0.025158506225819402 0.029266999922509942 0.04014582719310378 0.00470125262241551 0.006451412831573475 0.029511102120676154 0.02893384550149415 0.0372066473175612 0.04387304961333479 0.013714082712108758 0.01785236112448256 0.09742557077593071 0.11705578181853792 0.1185719339017931 0.10370409598531939 0.010880893546606221 0.017091226781980422 0.09625523680687967 0.10292116183289755 0.11481669200369285 0.08921294931800838 0.021155636800869793 0.019354238494720424 0.11804440848270462 0.10015561904363361 0.10724268932708816 0.10090801411067002 0.14399786847714197 0.12942961815249857 0.8132917212599434 0.7133776891959952 0.7399766986093386 0.7855033653356107 0.14798015223384461 0.12696339895185457 0.8118919974145502 0.7227352697599028 0.7474341518671771 0.7962255726632249 0.13868695236125753 0.1290282566314695 0.7989076931240187 0.721120457114162 0.7485101989768194 0.7809402831173593 );
}

}
