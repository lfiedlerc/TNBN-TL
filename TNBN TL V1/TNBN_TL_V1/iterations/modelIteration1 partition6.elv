// Bayesian Network 
//   Elvira format 

bnet "Network" {

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
states = ("Default" "[37-63]" "[0-37]");
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
states = ("Default" "[31-50]" "[0-31]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.24875062514193866 0.38960397694249116 0.36164539791557015 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8330044025794592 0.5988833168463382 0.09539136666565848 0.16699559742054076 0.40111668315366183 0.9046086333343415 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2611772275744646 0.34780722308646195 0.39101554933907345 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6213730916285931 0.07740471097385995 0.14547244374269844 0.35321116713762263 0.2311616914267537 0.5674540062210987 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8136283380511096 0.8310961510183009 0.07787124614580222 0.18586882355649484 0.13709222905127724 0.1082128902462487 0.8227564063911261 0.7931254173538821 0.07193951087742098 0.18114948962038877 0.12289878707800167 0.08555713562564325 0.7616953551006445 0.7474265285658273 0.0844278880296367 0.17855345696106495 0.1194500496622477 0.08523921370679458 0.027955749292333566 0.02203093682369988 0.09054971731233605 0.12074754527027266 0.1364426817312083 0.1096459561172645 0.022388664455857753 0.03541096459708325 0.09298837906729181 0.12218927437735848 0.09662979464394897 0.10812049899416241 0.040358044700697315 0.046428946954811166 0.09783331035167188 0.12047882631237714 0.09968490003823613 0.10547937496025034 0.15655219603706796 0.14503700075602421 0.8297310831273241 0.6915541229115617 0.7246212691941196 0.7803137210345323 0.15298920711502798 0.1695998830702408 0.8332488085049482 0.6948375154891578 0.7786131529964351 0.8044898145497847 0.19602478854624408 0.2042873666011691 0.8158928901026222 0.6991422799642492 0.7790190336321414 0.8074628014198474 );
}

}
