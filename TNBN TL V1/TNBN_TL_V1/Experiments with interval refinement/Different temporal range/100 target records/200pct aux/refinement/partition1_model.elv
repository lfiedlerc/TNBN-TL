// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/200pct aux/refinement/partition1_model.elv" {

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
states = ("Default" "[46-64]" "[31-46]" "[15-31]" "[0-15]");
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
states = ("Default" "[37-51]" "[26-37]" "[10-26]" "[0-10]");
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
values= table (0.23488099962182768 0.3757343514223802 0.3893846489557921 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8043247488998055 0.6115388295018509 0.07798769963947944 0.19567525110019443 0.38846117049814916 0.9220123003605205 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2336271824717563 0.31886864884744054 0.12036581364829398 0.7005717220130092 0.1339124719030198 0.43838685203412076 0.06580109551523453 0.5472188792495396 0.4412473343175853 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6324497860455274 0.10116380868771901 0.6801586043140866 0.09571942442723276 0.524778435818769 0.0591640051566223 0.09188755348861816 0.24565650143916154 0.08633755466368213 0.21985679955786094 0.11351446269916043 0.22391896677272388 0.08423025736456664 0.2666039550502528 0.0726020346035509 0.19500342221653755 0.1212103584753747 0.22391896677272388 0.10337349767469542 0.21518747800484692 0.08829977181512946 0.23706298387108488 0.1327542021396961 0.25590739059739875 0.08614458139557951 0.169483942853375 0.07063981745210357 0.250445571670259 0.10581856692294618 0.2352089987108444 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8452079645824695 0.826089898882707 0.06991202872251136 0.17775374070609937 0.11910929171322848 0.08260205252609364 0.012747579387326041 0.012680944873135949 0.08079914808395172 0.06986406124719417 0.07385791214674363 0.07043015738480778 0.016389744926562054 0.023550326192966764 0.06284378184307356 0.08061237836214713 0.0810635621122796 0.06681835444199712 0.07284331078472024 0.06702785147229003 0.45067969264604185 0.32603228582023946 0.38730368564755807 0.4207750428374413 0.050990317549304165 0.06883941502559515 0.33396981208033377 0.3439461476784944 0.3368641358888063 0.3575684913382548 );
}

}
