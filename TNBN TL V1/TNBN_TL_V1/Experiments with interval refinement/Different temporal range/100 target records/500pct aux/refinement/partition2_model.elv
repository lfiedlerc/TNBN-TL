// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/500pct aux/refinement/partition2_model.elv" {

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
states = ("Default" "[34-56]" "[0-34]");
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
states = ("Default" "[29-47]" "[0-29]");
}

// Links of the associated graph:

link Colision Pupilas_Dilatadas;

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Colision;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.35714285714285715 0.6818181818181818 0.04347826086956522 0.21428571428571425 0.2 0.03333333333333333 0.5714285714285714 0.18181818181818182 0.8260869565217392 0.28571428571428564 0.26666666666666666 0.5 0.07142857142857142 0.13636363636363635 0.13043478260869568 0.49999999999999994 0.5333333333333333 0.46666666666666673 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4468533774868226 0.5531466225131774 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.26464463395449234 0.3408724103264064 0.3944829557191012 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.640709778765285 0.10116380868771901 0.6811571485102461 0.09255055645379694 0.5221211228935989 0.060904564521252945 0.14031452426917865 0.384009828213228 0.1315505471181502 0.30878488009558297 0.18477983248114174 0.33255272659492385 0.21684971932509425 0.5127164189879913 0.1850626340814656 0.5965639860350039 0.2909751385047864 0.6044511823014652 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8460833147225255 0.8277536078445527 0.0680139480616756 0.1791203587819011 0.11530450275218954 0.08489444413711593 0.015391668527747449 0.015310790413817542 0.08656787438952816 0.0932817774111476 0.09234817299037687 0.09428360272526684 0.13660105818375862 0.1550217529399026 0.843576307880934 0.7257322282587284 0.7905003607976261 0.818973255044965 );
}

}
