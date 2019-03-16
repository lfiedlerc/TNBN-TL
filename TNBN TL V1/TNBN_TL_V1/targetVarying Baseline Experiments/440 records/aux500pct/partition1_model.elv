// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/440 records/aux500pct/partition1_model.elv" {

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
states = ("Default" "[34-58]" "[15-34]" "[0-15]");
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
states = ("Default" "[22-44]" "[0-22]");
}

// Links of the associated graph:

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Colision;

link Heridas_Internas Signos_Vitales;

link Signos_Vitales Colision;

//Network Relationships:

relation Colision Herida_Cabeza Heridas_Internas Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5833333333333334 0.3333333333333333 0.6363636363636364 0.7213114754098361 0.5 0.6666666666666666 0.1111111111111111 0.041666666666666664 0.14925373134328357 0.3076923076923077 0.2 0.1111111111111111 0.14285714285714285 0.2727272727272727 0.140625 0.07142857142857142 0.08333333333333333 0.010752688172043012 0.3541666666666667 0.3333333333333333 0.18181818181818182 0.22950819672131148 0.3333333333333333 0.23809523809523808 0.6666666666666666 0.7083333333333334 0.746268656716418 0.3076923076923077 0.4 0.3333333333333333 0.07142857142857142 0.18181818181818182 0.125 0.5714285714285714 0.5833333333333334 0.46236559139784944 0.0625 0.3333333333333333 0.18181818181818182 0.04918032786885246 0.16666666666666666 0.09523809523809523 0.2222222222222222 0.25 0.1044776119402985 0.38461538461538464 0.4 0.5555555555555556 0.7857142857142857 0.5454545454545454 0.734375 0.35714285714285715 0.3333333333333333 0.5268817204301075 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5067873303167421 0.49321266968325794 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.18284424379232506 0.3611738148984199 0.45598194130925507 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7048458149779736 0.08597285067873303 0.05726872246696035 0.06787330316742081 0.1145374449339207 0.1583710407239819 0.12334801762114538 0.6877828054298643 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8214285714285714 0.7195121951219512 0.07446808510638298 0.36666666666666664 0.14457831325301204 0.10619469026548672 0.017857142857142856 0.04878048780487805 0.23404255319148937 0.1 0.10843373493975904 0.08849557522123894 0.16071428571428573 0.23170731707317074 0.6914893617021277 0.5333333333333333 0.7469879518072289 0.8053097345132744 );
}

}
