// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/100pct aux/no refinement/partition2_model.elv" {

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
states = ("Default" "[55-72]" "[38-55]" "[20-38]" "[0-20]");
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
states = ("Default" "[34-53]" "[20-34]" "[10-20]" "[0-10]");
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
values= table (0.24053455187321524 0.38944472101747224 0.3700207271093126 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8050743889131466 0.5859814726192177 0.09295895601572568 0.19492561108685338 0.41401852738078226 0.9070410439842744 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.1987577639751553 0.35938206984492616 0.11950051759834368 0.6427329192546584 0.15811001192875654 0.4630402432712215 0.15850931677018637 0.4825079182263173 0.4174592391304347 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5967688856783553 0.11598619102416571 0.6364143022088377 0.09773221458979012 0.33357182168409466 0.0766661284899301 0.06768500425712888 0.09088147295742233 0.08913115783514503 0.18433279561162608 0.144589983489268 0.13319632155054228 0.10548952503569546 0.3203866513233602 0.07835472604752487 0.20620265519213257 0.16522839845899834 0.21167753456721441 0.09848588292989609 0.2808239355581128 0.09690483915527753 0.23301578925074307 0.17556411667583927 0.26034859588204184 0.13157070209892438 0.19192174913693905 0.09919497475321488 0.2787165453557082 0.1810456796917997 0.3181114195102713 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7873614527804956 0.7574441111441538 0.07630444195653034 0.17473895760439012 0.12413979210991954 0.08418690569923082 0.029838559052270938 0.04409908715946265 0.10966307725544742 0.10523541316054219 0.10634241831610468 0.11183029495487856 0.060818944668284455 0.06341924076492417 0.20301216980273598 0.1999977591925624 0.21979003818243034 0.18467627642177942 0.05339262488210507 0.05883153825267323 0.31942497064123465 0.21237401877143064 0.26129924279870764 0.2614323784143904 0.06858841861684402 0.07620602267878615 0.29159534034405166 0.3076538512710747 0.28842850859283775 0.3578741445097208 );
}

}
