// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/440 records/aux500pct/partition4_model.elv" {

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
states = ("Default" "[34-59]" "[13-34]" "[0-13]");
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
states = ("Default" "[20-43]" "[0-20]");
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
values= table (0.24604966139954854 0.3860045146726862 0.36794582392776526 );
}

relation Herida_Cabeza Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.9390243902439024 0.7 0.5909090909090909 0.92 0.45 0.44339622641509435 0.4 0.045454545454545456 0.10317460317460317 0.06097560975609756 0.3 0.4090909090909091 0.08 0.55 0.5566037735849056 0.6 0.9545454545454546 0.8968253968253969 );
}

relation Heridas_Internas Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3373493975903614 0.2727272727272727 0.2608695652173913 0.49019607843137253 0.19047619047619047 0.09345794392523364 0.3333333333333333 0.13043478260869565 0.05511811023622047 0.6506024096385542 0.5454545454545454 0.6086956521739131 0.35294117647058826 0.09523809523809523 0.12149532710280374 0.5714285714285714 0.4782608695652174 0.4094488188976378 0.012048192771084338 0.18181818181818182 0.13043478260869565 0.1568627450980392 0.7142857142857143 0.7850467289719626 0.09523809523809523 0.391304347826087 0.5354330708661418 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.75 0.07758620689655173 0.041666666666666664 0.07758620689655173 0.1388888888888889 0.1896551724137931 0.06944444444444445 0.6551724137931034 );
}

relation Signos_Vitales Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7297297297297297 0.2832369942196532 0.11515151515151516 0.08108108108108109 0.10982658959537572 0.12727272727272726 0.1891891891891892 0.6069364161849711 0.7575757575757576 );
}

}
