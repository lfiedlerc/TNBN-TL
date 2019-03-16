// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/440 records/aux100pct/partition0_model.elv" {

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
states = ("Default" "[37-59]" "[16-37]" "[0-16]");
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
states = ("Default" "[16-44]" "[0-16]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Signos_Vitales Herida_Cabeza;

link Signos_Vitales Heridas_Internas;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.26410835214446954 0.39954853273137697 0.3363431151241535 );
}

relation Herida_Cabeza Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.9659090909090909 0.6153846153846154 0.6190476190476191 0.8125 0.6666666666666666 0.5420560747663551 0.45454545454545453 0.11764705882352941 0.06086956521739131 0.03409090909090909 0.38461538461538464 0.38095238095238093 0.1875 0.3333333333333333 0.45794392523364486 0.5454545454545454 0.8823529411764706 0.9391304347826087 );
}

relation Heridas_Internas Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4157303370786517 0.21428571428571427 0.18181818181818182 0.4897959183673469 0.17857142857142858 0.05555555555555555 0.30434782608695654 0.16666666666666666 0.06896551724137931 0.5730337078651685 0.6428571428571429 0.7727272727272727 0.3469387755102041 0.14285714285714285 0.046296296296296294 0.5217391304347826 0.4444444444444444 0.3103448275862069 0.011235955056179775 0.14285714285714285 0.045454545454545456 0.16326530612244897 0.6785714285714286 0.8981481481481481 0.17391304347826086 0.3888888888888889 0.6206896551724138 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6425531914893617 0.03286384976525822 0.10638297872340426 0.07981220657276995 0.12340425531914893 0.1784037558685446 0.1276595744680851 0.7089201877934272 );
}

relation Signos_Vitales Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7310924369747899 0.26256983240223464 0.1390728476821192 0.10084033613445378 0.1452513966480447 0.10596026490066225 0.16806722689075632 0.5921787709497207 0.7549668874172185 );
}

}
