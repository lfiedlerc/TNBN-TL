// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/100pct aux/refinement/partition0_model.elv" {

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
states = ("Default" "[32-49]" "[13-32]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[35-41]" "[23-35]" "[4-23]");
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
values= table (0.24394782182810282 0.37669990774575224 0.37935227042614506 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.82754592418072 0.6452224585640434 0.10350283314009708 0.17245407581928 0.3547775414359566 0.8964971668599029 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.20345240638127665 0.27072959856617246 0.10811937891825017 0.7338384409514117 0.10324567548293857 0.38406149654568456 0.06270915266731167 0.6260247259508889 0.5078191245360653 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6786341613770435 0.08594068623815042 0.08781508380976137 0.22525697956249247 0.10089392607930031 0.26993604988893727 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7851926208228099 0.790935556756175 0.08999199817101051 0.21158726943912537 0.11828148648479617 0.1257351232055721 0.7584436496293945 0.7571319118414189 0.061773303285648964 0.19615517067369329 0.13812275632606602 0.10792885539930427 0.7018592874894767 0.7518409065504136 0.07610310928212162 0.218201026052882 0.12269065756063391 0.08785633532678422 0.033047289104183086 0.035785805600294374 0.13872073198612644 0.0929731993585937 0.11719043534062834 0.11346842017970234 0.03872277372353218 0.032005872082913785 0.11866898930774399 0.09511852968826368 0.12233096361823578 0.09331288123438239 0.027605621528752157 0.04291473044616908 0.08905030271979551 0.08396409028071673 0.12056048046206934 0.1100541435904289 0.06242265719679028 0.03766926905294144 0.21455473213854223 0.16921122283264053 0.2064783860763452 0.1934543557162138 0.057162189782357035 0.04706745894546145 0.2095249342464855 0.22007816672970812 0.2075919382612486 0.16049815572313772 0.08281686458625648 0.05224401967359714 0.2244809714394845 0.16419644321562385 0.1799133323818573 0.16787920208709492 0.07711034124309386 0.10924088025353018 0.4106133666789343 0.41280100515215606 0.42039743471400015 0.41481078196842003 0.10510467153530163 0.12237539325819977 0.5061974075158455 0.3748789111243333 0.39108838368860227 0.44790182992503547 0.1380281076437608 0.10262218150170867 0.4582380160789477 0.41422284538486925 0.435872506285943 0.4551391701027907 );
}

}
