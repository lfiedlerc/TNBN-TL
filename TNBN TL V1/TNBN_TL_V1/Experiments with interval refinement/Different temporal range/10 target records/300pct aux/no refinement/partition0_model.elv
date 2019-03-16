// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/300pct aux/no refinement/partition0_model.elv" {

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
states = ("Default" "[49-73]" "[33-49]" "[17-33]" "[0-17]");
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
states = ("Default" "[32-52]" "[17-32]" "[9-17]" "[0-9]");
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
values= table (0.24623371089018256 0.42163186456964147 0.332134424540176 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8472200930007383 0.5723729933140587 0.11665877902740295 0.1527799069992618 0.4276270066859414 0.883341220972597 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.1548009687878433 0.2950619402216808 0.17545317001838742 0.7171422711824681 0.16080779657527194 0.4340424068684938 0.12805676002968866 0.5441302632030472 0.3905044231131188 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6203832012260809 0.09539466999703654 0.6807385905326208 0.06516322567964518 0.5535123922986916 0.0782740241496526 0.0786626387507772 0.23291271538038183 0.08814193132339959 0.23001849248755465 0.09856610998829912 0.23089939517103308 0.10199176560232354 0.2890450764150544 0.07894321541522933 0.2019274562107449 0.12865865333475165 0.2267758557870022 0.09022468162525125 0.22023533084966768 0.07284381718433788 0.22672115576473273 0.12654451654079354 0.2284705332513376 0.10873771279556713 0.16241220735785955 0.07933244554441243 0.27616966985732266 0.09271832783746412 0.23558019164097455 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.763142863224955 0.7534998694196573 0.07079808576075897 0.20116067934753215 0.12709829269211742 0.07610435852698558 0.028383245700440655 0.051918437534279806 0.09737016151830505 0.11552914907371384 0.10174984975722254 0.09380660167275595 0.06465542565976248 0.07289663234556956 0.2966828600677078 0.20850426585545886 0.25818728841895294 0.27134067210373464 0.05532082927744956 0.05015449196834442 0.21627189338779634 0.1897798814791719 0.20235932551920754 0.20901869056844427 0.0884976361373924 0.07153056873214887 0.31887699926543184 0.2850260242441234 0.31060524361249964 0.3497296771280795 );
}

}
