// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/440 records/aux200pct/partition2_model.elv" {

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
states = ("Default" "[35-57]" "[16-35]" "[0-16]");
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
states = ("Default" "[22-43]" "[0-22]");
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
values= table (0.4479638009049774 0.06666666666666667 0.47058823529411764 0.3466666666666667 0.08144796380090498 0.5866666666666667 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.49547511312217196 0.504524886877828 );
}

relation Heridas_Internas Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4050632911392405 0.15384615384615385 0.20689655172413793 0.5 0.18181818181818182 0.11711711711711711 0.3333333333333333 0.14285714285714285 0.08403361344537816 0.5822784810126582 0.6153846153846154 0.5517241379310345 0.30357142857142855 0.045454545454545456 0.11711711711711711 0.5416666666666666 0.35714285714285715 0.31092436974789917 0.012658227848101266 0.23076923076923078 0.2413793103448276 0.19642857142857142 0.7727272727272727 0.7657657657657657 0.125 0.5 0.6050420168067226 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7072072072072072 0.048672566371681415 0.07207207207207207 0.10619469026548672 0.12162162162162163 0.18141592920353983 0.0990990990990991 0.6637168141592921 );
}

relation Signos_Vitales Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5610859728506787 0.12444444444444444 0.08597285067873303 0.10222222222222223 0.35294117647058826 0.7733333333333333 );
}

}
