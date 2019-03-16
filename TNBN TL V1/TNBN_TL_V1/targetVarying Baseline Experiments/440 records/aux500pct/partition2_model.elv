// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/440 records/aux500pct/partition2_model.elv" {

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
states = ("Default" "[36-57]" "[16-36]" "[0-16]");
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
states = ("Default" "[21-43]" "[0-21]");
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
values= table (0.5166666666666667 0.3333333333333333 0.3 0.7076923076923077 0.7142857142857143 0.6470588235294118 0.14285714285714285 0.15789473684210525 0.10526315789473684 0.18181818181818182 0.25 0.18181818181818182 0.07142857142857142 0.4 0.11538461538461539 0.09090909090909091 0.07692307692307693 0.018518518518518517 0.43333333333333335 0.3333333333333333 0.6 0.2 0.14285714285714285 0.23529411764705882 0.7142857142857143 0.631578947368421 0.7719298245614035 0.2727272727272727 0.5 0.36363636363636365 0.35714285714285715 0.1 0.19230769230769232 0.6363636363636364 0.6153846153846154 0.37037037037037035 0.05 0.3333333333333333 0.1 0.09230769230769231 0.14285714285714285 0.11764705882352941 0.14285714285714285 0.21052631578947367 0.12280701754385964 0.5454545454545454 0.25 0.45454545454545453 0.5714285714285714 0.5 0.6923076923076923 0.2727272727272727 0.3076923076923077 0.6111111111111112 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.49547511312217196 0.504524886877828 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.21896162528216703 0.3340857787810384 0.4469525959367946 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7072072072072072 0.048672566371681415 0.05855855855855856 0.10619469026548672 0.13513513513513514 0.18141592920353983 0.0990990990990991 0.6637168141592921 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8656716417910447 0.7590361445783133 0.06493506493506493 0.2571428571428571 0.17142857142857143 0.07142857142857142 0.014925373134328358 0.060240963855421686 0.22077922077922077 0.17142857142857143 0.11428571428571428 0.0873015873015873 0.11940298507462686 0.18072289156626506 0.7142857142857143 0.5714285714285714 0.7142857142857143 0.8412698412698413 );
}

}
