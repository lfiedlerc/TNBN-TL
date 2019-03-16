// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/200 records/aux200pct/partition2_model.elv" {

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
states = ("Default" "[32-58]" "[13-32]" "[0-13]");
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
states = ("Default" "[19-45]" "[0-19]");
}

// Links of the associated graph:

link Colision Heridas_Internas;

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Signos_Vitales Heridas_Internas;

//Network Relationships:

relation Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.48514851485148514 0.0380952380952381 0.44554455445544555 0.3333333333333333 0.06930693069306931 0.6285714285714286 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4900990099009901 0.5099009900990099 );
}

relation Heridas_Internas Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4358974358974359 0.1111111111111111 0.25 0.41379310344827586 0.1111111111111111 0.08163265306122448 0.3333333333333333 0.2727272727272727 0.09259259259259259 0.5384615384615384 0.7777777777777778 0.5 0.20689655172413793 0.3333333333333333 0.08163265306122448 0.6 0.5454545454545454 0.35185185185185186 0.02564102564102564 0.1111111111111111 0.25 0.3793103448275862 0.5555555555555556 0.8367346938775511 0.06666666666666667 0.18181818181818182 0.5555555555555556 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5588235294117647 0.08490566037735849 0.1568627450980392 0.09433962264150944 0.12745098039215685 0.1320754716981132 0.1568627450980392 0.6886792452830188 );
}

relation Signos_Vitales Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5841584158415841 0.1619047619047619 0.10891089108910891 0.10476190476190476 0.3069306930693069 0.7333333333333333 );
}

}
