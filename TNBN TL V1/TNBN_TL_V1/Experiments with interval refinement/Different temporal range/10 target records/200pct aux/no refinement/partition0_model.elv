// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/200pct aux/no refinement/partition0_model.elv" {

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
num-states = 5;
states = ("Default" "[48-69]" "[28-48]" "[13-28]" "[0-13]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 5;
states = ("Default" "[31-52]" "[16-31]" "[8-16]" "[0-8]");
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
values= table (0.6404943370419902 0.08692911983657917 0.09745047821065837 0.23510810080503347 0.09278230165270118 0.28417262955384376 0.08262018329441596 0.21929215687026005 0.08665269980023436 0.17449799293428359 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7533528964532953 0.7480979183634029 0.12639460210791462 0.16468354430379745 0.18548084826565836 0.12532709286246146 0.7250289288869366 0.7571415558043763 0.0661144987874455 0.15347004891230306 0.17567626466360645 0.10267457330748471 0.6117791069689804 0.5527305605786619 0.13497335109926717 0.18324059378689622 0.1152746620061947 0.09631796202382356 0.052991423350362145 0.056259852573747646 0.12322573472745364 0.20632911392405062 0.18889363800756204 0.18207850228699074 0.04480129755858981 0.045585941206611885 0.10569732396932868 0.1394789094851798 0.1565757870821162 0.12247386627133462 0.08603839198775907 0.1057142857142857 0.17604596935376418 0.10352848422801786 0.11664860516928559 0.1174783568040774 0.07928158888103402 0.07715160540010768 0.29265792402704044 0.21569620253164556 0.19769192832483973 0.23182214658015105 0.0758781399177657 0.0669531057256182 0.3592504590885515 0.24096755291057131 0.2693026382899801 0.24882464743224234 0.11057587981638614 0.13229656419529834 0.2527948034643571 0.23888766562317532 0.2754123850865207 0.2695539986354971 0.0550802310226621 0.06221135927556839 0.1949751288513349 0.2688607594936709 0.17425612362321224 0.25238591639187324 0.07395213229555554 0.06538173950999185 0.21626463125727183 0.21308362118998164 0.17661519914684473 0.20879195651347549 0.08603839198775907 0.08374321880650994 0.16060626249167223 0.21412811021738404 0.23500762430474542 0.23899510480845454 0.059293860292646494 0.05627926438717337 0.26274661028625634 0.14443037974683542 0.25367746177872763 0.20838634187852356 0.08033950134115243 0.06493765775340178 0.25267308689740253 0.2529998675019641 0.22183011081745263 0.3172349564754628 0.10556822923911531 0.1255153707052441 0.2755796135909394 0.26021514614452657 0.2576567234332536 0.27765457772814744 );
}

}
