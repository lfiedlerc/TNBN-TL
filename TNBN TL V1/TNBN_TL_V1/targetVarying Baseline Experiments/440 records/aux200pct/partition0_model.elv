// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/440 records/aux200pct/partition0_model.elv" {

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
states = ("Default" "[38-59]" "[18-38]" "[0-18]");
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
states = ("Default" "[15-43]" "[0-15]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Signos_Vitales Heridas_Internas;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.26410835214446954 0.39954853273137697 0.3363431151241535 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8813559322033898 0.6348314606741573 0.11333333333333333 0.11864406779661017 0.3651685393258427 0.8866666666666667 );
}

relation Heridas_Internas Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4157303370786517 0.21428571428571427 0.18181818181818182 0.48 0.17857142857142858 0.056074766355140186 0.28 0.1875 0.06896551724137931 0.5730337078651685 0.6428571428571429 0.7727272727272727 0.34 0.14285714285714285 0.04672897196261682 0.52 0.4375 0.3103448275862069 0.011235955056179775 0.14285714285714285 0.045454545454545456 0.18 0.6785714285714286 0.897196261682243 0.2 0.375 0.6206896551724138 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6425531914893617 0.03286384976525822 0.10638297872340426 0.07511737089201878 0.11914893617021277 0.15492957746478872 0.13191489361702127 0.7370892018779343 );
}

relation Signos_Vitales Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5726495726495726 0.10849056603773585 0.10256410256410256 0.12735849056603774 0.3247863247863248 0.7641509433962265 );
}

}
