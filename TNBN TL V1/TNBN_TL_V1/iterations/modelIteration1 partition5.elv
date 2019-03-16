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
num-states = 3;
states = ("Default" "[36-61]" "[0-36]");
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
states = ("Default" "[30-49]" "[0-30]");
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
values= table (0.22743976461400692 0.3845128141120207 0.3880474212739724 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.825581751279392 0.6195834613954118 0.09423373008401714 0.17441824872060802 0.38041653860458835 0.9057662699159827 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.26926720238412005 0.32425633142762283 0.0880563862057096 0.640642860944069 0.15715625616573625 0.4988792945808145 0.09008993667181098 0.518587412406641 0.4130643192134758 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6162900190867173 0.07318144722858616 0.1371923954103357 0.3514101386339507 0.24437395432466047 0.5733533840869722 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8100815458616221 0.8202559710325664 0.07766158954070716 0.18567195949226487 0.14468183167970483 0.10574712318704835 0.819158406447436 0.796155042718981 0.07620595520041272 0.17465483628104883 0.12580742208742854 0.08418739287204378 0.7602663920701895 0.746158525936351 0.08626458926536652 0.18827861678246646 0.12448773738722752 0.0866087662322357 0.03418532174490803 0.02995733816123893 0.11576675522225693 0.1264603545259071 0.14700781018005074 0.11705885297336921 0.030140265592094005 0.036328804267904385 0.10924535384559435 0.13596173230637015 0.12732804939161366 0.12236327109851605 0.0483333886955263 0.06248405515412898 0.10002998180673883 0.1434670351733315 0.12287891405091543 0.10960694805213171 0.15383394785208615 0.14778953492877872 0.8046738395776547 0.6859516200041628 0.7064011658002438 0.7752750262498551 0.14881756136096416 0.16549788610934218 0.8126321057988071 0.687468477436435 0.7449641098733217 0.7915374099185258 0.18946688368646314 0.1894047921859535 0.8117817754316111 0.6663666238971844 0.7507133655298115 0.8018613568024373 );
}

}
