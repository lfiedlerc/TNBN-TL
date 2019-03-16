// Bayesian Network 
//   Elvira format 

bnet "Network" {

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
states = ("Default" "[38-59]" "[20-38]" "[0-20]");
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
states = ("Default" "[26-48]" "[0-26]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Pupilas_Dilatadas;

link Herida_Cabeza Pupilas_Dilatadas;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.23347817034908797 0.38613501353950197 0.38038681611141 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8328575496472491 0.6028928979278471 0.09696635360933206 0.1671424503527509 0.3971071020721529 0.903033646390668 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.18665628245067498 0.33630847998459557 0.13954439252336448 0.721858774662513 0.1783136652156272 0.508559329105474 0.09148494288681207 0.4853778547997772 0.35189627837116155 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6581324085466482 0.14668761420208912 0.7040717062724536 0.12687756777494616 0.5041423665948342 0.08058888940480455 0.1115817833215801 0.33171661110106454 0.11038595083487841 0.25945498632010644 0.18768443133560012 0.28773746248455995 0.1044595418329686 0.3225658080362076 0.08689957831681917 0.2481743347409714 0.14365968818280506 0.2967292581872024 0.12345218580259924 0.19674226589442448 0.09629412732404286 0.363236980848149 0.16219642214187663 0.3326964409977724 );
}

relation Signos_Vitales Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.477560803073692 0.43635630583251944 0.08275828826063884 0.08419474661209096 0.08922544965585598 0.1313421230424907 0.4360856106574968 0.4722420140322134 0.7837464391387969 );
}

}
