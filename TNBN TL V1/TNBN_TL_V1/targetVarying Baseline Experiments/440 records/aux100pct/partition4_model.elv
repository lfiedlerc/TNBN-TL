// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/440 records/aux100pct/partition4_model.elv" {

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
states = ("Default" "[34-58]" "[14-34]" "[0-14]");
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
states = ("Default" "[21-45]" "[0-21]");
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
values= table (0.9382716049382716 0.6666666666666666 0.625 0.9166666666666666 0.47619047619047616 0.4485981308411215 0.42105263157894735 0.045454545454545456 0.10236220472440945 0.06172839506172839 0.3333333333333333 0.375 0.08333333333333333 0.5238095238095238 0.5514018691588785 0.5789473684210527 0.9545454545454546 0.8976377952755905 );
}

relation Heridas_Internas Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.34146341463414637 0.2 0.28 0.5102040816326531 0.18181818181818182 0.09259259259259259 0.35 0.13043478260869565 0.0546875 0.6463414634146342 0.6 0.6 0.3673469387755102 0.09090909090909091 0.12037037037037036 0.55 0.5217391304347826 0.40625 0.012195121951219513 0.2 0.12 0.12244897959183673 0.7272727272727273 0.7870370370370371 0.1 0.34782608695652173 0.5390625 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.75 0.07758620689655173 0.041666666666666664 0.07758620689655173 0.1388888888888889 0.16810344827586207 0.06944444444444445 0.6767241379310345 );
}

relation Signos_Vitales Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7207207207207207 0.27167630057803466 0.10909090909090909 0.07207207207207207 0.11560693641618497 0.12727272727272726 0.2072072072072072 0.6127167630057804 0.7636363636363637 );
}

}
