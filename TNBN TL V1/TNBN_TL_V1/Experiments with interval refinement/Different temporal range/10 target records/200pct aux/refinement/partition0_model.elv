// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/200pct aux/refinement/partition0_model.elv" {

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
states = ("Default" "[34-54]" "[13-34]");
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
states = ("Default" "[31-49]" "[20-31]" "[3-20]");
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
values= table (0.26646959329921727 0.4057750871866772 0.3277553195141055 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8625817948222527 0.5895637147247966 0.13030623372144726 0.13741820517774733 0.4104362852752034 0.8696937662785528 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.11439595601086286 0.31144954958660687 0.16517944339343615 0.7695208518189884 0.15901855127308628 0.4560585513943067 0.1160831921701487 0.5295318991403068 0.37876200521225717 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6409530652086299 0.07409841169646528 0.1825662380295102 0.5100775217001509 0.17343792612803466 0.4130519061593613 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8351631503118377 0.8458745757775284 0.05145496856914915 0.1474805324159315 0.10631894262907778 0.0729392485937331 0.8344616085677758 0.8462428283427221 0.050042113824934106 0.14734296841806738 0.10606195749110431 0.07222868271743182 0.8331055319042494 0.8430156210983788 0.05142886040683786 0.14756439791751852 0.10498506591383472 0.07215420488689546 0.011447003450566824 0.016662208024050978 0.06989279178964164 0.07863043633056942 0.06810964178577468 0.07725506261718891 0.01241537935741681 0.01454459731893169 0.07276273170702632 0.0740520995170413 0.07725390490817617 0.06911163311585722 0.012517085107181294 0.015053296607004774 0.0734377656459222 0.07862270116294734 0.07683422868025083 0.07397403833475777 0.032051609661587106 0.027076088039082836 0.22765080754340422 0.13863787458284607 0.16098642603910376 0.17747784655300153 0.033107678286444835 0.027011395020873137 0.2283941300803882 0.13752532767450526 0.20086015276125804 0.17592052065854566 0.035465074470347 0.03655800604558302 0.1978739796570682 0.13448619935767306 0.18066426743734657 0.18387832386068356 0.11904883588589497 0.10830435215633134 0.6490044951895296 0.6331819346619537 0.6625210610070809 0.670239867570747 0.11794610389545972 0.1101233797004828 0.6467798373957896 0.6389638301184707 0.6136167304135135 0.6806448715955636 0.11682612766702541 0.1032226053051756 0.6752194563555627 0.6372576831102046 0.6354398371934258 0.6678798889652415 );
}

}
