// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/100pct aux/refinement/partition4_model.elv" {

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
states = ("Default" "[38-59]" "[19-38]" "[0-19]");
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
states = ("Default" "[23-40]" "[4-23]");
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
values= table (0.21494554957030482 0.4202446299105942 0.36480982051910105 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8001954968302927 0.5976252045594668 0.06858219821946215 0.19980450316970733 0.40237479544053323 0.9314178017805378 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.49482076218477883 0.2728484699319058 0.11621102966621576 0.4253307701006447 0.11807777504307163 0.4512221977537988 0.07984846771457652 0.6090737550250226 0.4325667725799855 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7272727272727273 0.03333333333333333 0.045454545454545456 0.06666666666666667 0.045454545454545456 0.16666666666666666 0.18181818181818182 0.7333333333333333 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8081782854355843 0.8076622110912226 0.07869418390251723 0.18959789864907517 0.11406043719873507 0.10540555965324841 0.7982009611725458 0.8076622110912226 0.06559894580727914 0.18959789864907517 0.11013186577016364 0.0929055596532484 0.7841703489276478 0.7958764968055083 0.07869418390251723 0.2053121843633609 0.10751281815111602 0.0929055596532484 0.07027132117706315 0.06657846539149986 0.34908853188068684 0.24078465982488675 0.3000763035294607 0.3256323762862176 0.07474038475090895 0.07212667084079152 0.3456743784296771 0.25695676384297617 0.301406948690751 0.2952082498169902 0.09223489362066332 0.0668368992760725 0.33829197934829447 0.24451932788819664 0.3172092995727961 0.2844734043690996 0.07596899586709531 0.08692188537223594 0.4426586538280874 0.4420375098277772 0.42332192819334635 0.40256749815603826 0.09155697131986348 0.08877128718866649 0.4644999460148786 0.4258654058096878 0.4395518001740119 0.4311829588236038 0.07932200851377047 0.09573934220626601 0.4066701453867795 0.4333026325077602 0.4354907333118048 0.4437069451794761 );
}

}
