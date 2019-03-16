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
num-states = 4;
states = ("Default" "[38-61]" "[19-38]" "[0-19]");
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
states = ("Default" "[37-46]" "[25-37]" "[12-25]" "[0-12]");
}

// Links of the associated graph:

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
values= table (0.2 0.6666666666666666 0.3333333333333333 0.3333333333333333 0.16666666666666666 0.1111111111111111 0.4 0.16666666666666666 0.3333333333333333 0.5 0.3333333333333333 0.7777777777777778 0.4 0.16666666666666666 0.3333333333333333 0.16666666666666666 0.5 0.1111111111111111 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.43267887841639213 0.5673211215836079 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.27235610464005083 0.34312723859992433 0.38451665676002494 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6216080493293303 0.10041608611958183 0.14093169591305554 0.33092516070865274 0.10425084355212329 0.3100046045718988 0.13127884002859969 0.25675227986016164 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8385508906525512 0.8163418640354995 0.06906333170367292 0.18565517255387792 0.1280621117068396 0.09294138524666476 0.009497006432202871 0.014992500895061269 0.03495611995579094 0.04431808584740799 0.055419781035582226 0.04618424718703336 0.018994012864405743 0.024362813954474562 0.11774693037740104 0.11818156225975465 0.10529758396760625 0.10530008358643607 0.0816742553169447 0.06559219141589305 0.39923568581087543 0.282527797277226 0.35838125069676513 0.37871082693367353 0.04938443344745494 0.076836567087189 0.37715813636511275 0.3674707951514246 0.3509919465586875 0.37501608715871093 );
}

}
