// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/300pct aux/no refinement/partition4_model.elv" {

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
states = ("Default" "[50-72]" "[33-50]" "[16-33]" "[0-16]");
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
states = ("Default" "[32-52]" "[17-32]" "[9-17]" "[0-9]");
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
values= table (0.2344789053920368 0.3900993855019239 0.3754217091060393 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8078521666909244 0.5996460688925097 0.07851451157128123 0.19214783330907562 0.4003539311074903 0.9214854884287188 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.27236024844720497 0.31849180069378746 0.10443568159529257 0.6427329192546584 0.15811001192875654 0.49747415413533835 0.08490683229813666 0.523398187377456 0.398090164269369 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6349097701103789 0.11265285769083239 0.6748146132931171 0.07987507173264725 0.33357182168409466 0.06713969059655078 0.09933520128191085 0.18448714998082089 0.09909489843669303 0.23296408879619254 0.13121629058888276 0.1865209490317908 0.06711975415175929 0.24082777138473344 0.06880265563481844 0.1598697062819141 0.1907539900935608 0.22080117893585735 0.09473690827008062 0.23714077483697737 0.0597661018980579 0.2658728589884915 0.16341221794166205 0.23530822835476461 0.10389836618587034 0.224891446106636 0.09752173073731349 0.2614182742007546 0.1810456796917997 0.2902299530810364 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8037076066266494 0.7837966510093519 0.0727742411540096 0.1797389576043901 0.12499668116800783 0.0821482647931682 0.02924449601456302 0.03488940443712169 0.10021478871563877 0.13852000504181675 0.10329429167037642 0.11505481194355278 0.06170986235669929 0.06718757099819539 0.313277078765507 0.20932202153509316 0.2774316256136462 0.25148567621585605 0.038172223931426504 0.06295479019629213 0.19195054376205936 0.2103282841250464 0.20026465060159587 0.23803827751196174 0.06716581107066179 0.051171583359038916 0.32178334760278526 0.26209073169365366 0.2940127509463737 0.31327296953546124 );
}

}
