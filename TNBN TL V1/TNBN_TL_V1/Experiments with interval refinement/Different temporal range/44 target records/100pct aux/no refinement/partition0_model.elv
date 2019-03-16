// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/100pct aux/no refinement/partition0_model.elv" {

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
num-states = 5;
states = ("Default" "[53-73]" "[37-53]" "[19-37]" "[0-19]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 5;
states = ("Default" "[33-53]" "[18-33]" "[9-18]" "[0-9]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Pupilas_Dilatadas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.24937252241331342 0.37520576848064735 0.37542170910603934 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8238243889131467 0.6118743297620749 0.08407006712683679 0.17617561108685337 0.3881256702379251 0.9159299328731633 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.14391669711362806 0.31067454335606975 0.10443568159529257 0.7812787723785166 0.18516974886701013 0.48456143756129455 0.07480453050785531 0.5041557077769202 0.41100288084341285 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6155658781595582 0.11598619102416571 0.6745095403040757 0.08384332570090122 0.34690515501742797 0.07737778583464602 0.07829268498506745 0.1075765247410817 0.09154958077535381 0.193025698469513 0.11450926435516418 0.1610434308925448 0.0698624821376605 0.29954890678941315 0.06888163702915825 0.18145075826212734 0.1965345808108604 0.19353910165493682 0.10835735775355737 0.27999539700805526 0.0883622291274186 0.2591262473300215 0.17771234635846633 0.2680513335080539 0.12792159696415642 0.19689298043728426 0.07669701276399354 0.2825539702374369 0.16433865345808107 0.2999883481098184 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7831947861138289 0.8006020058809958 0.067971108623197 0.17140562427105677 0.11516543313556057 0.08085357236589748 0.04377441054447755 0.02936224505419948 0.09860766483619497 0.13018667170848341 0.11355726653694889 0.13389336401994628 0.06514509318006406 0.05163164291561839 0.2528905034872151 0.1915707904526042 0.23438787772585024 0.23776896210607068 0.05048590045797073 0.04472957932709484 0.2834687774223514 0.2114579175585158 0.21744903761429518 0.23703712676397554 0.05739980970365879 0.07367452682209137 0.29706194563104155 0.2953789960093398 0.31944038498734506 0.31044697474411 );
}

}
