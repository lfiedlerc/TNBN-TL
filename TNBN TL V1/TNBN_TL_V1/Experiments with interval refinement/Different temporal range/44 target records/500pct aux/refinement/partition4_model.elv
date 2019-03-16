// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/500pct aux/refinement/partition4_model.elv" {

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
values= table (0.5454545454545454 0.4 0.0909090909090909 0.3333333333333333 0.08333333333333333 0.058823529411764705 0.36363636363636365 0.4 0.8181818181818181 0.3333333333333333 0.16666666666666666 0.47058823529411764 0.09090909090909091 0.2 0.0909090909090909 0.3333333333333333 0.7500000000000001 0.47058823529411764 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4330741353333882 0.5669258646666119 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2718010630119287 0.3382243708848457 0.38997456610322573 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6331153700150463 0.09863157659315967 0.6737856082325506 0.09370873466965547 0.5435766507298638 0.059820708171397396 0.1314506428288337 0.42191713436064865 0.13641692746638792 0.3391407060538499 0.18488034400815642 0.34828504130492766 0.23347203726315238 0.4775334838900068 0.1878204073812587 0.5652345100897497 0.26961716834522814 0.5899910535766535 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8496463507168538 0.8331678456825634 0.06887303531107429 0.171619090422912 0.11366106919798838 0.08253822130283195 0.015621158367080126 0.01191658245124547 0.06570452371796855 0.1007985620060616 0.09251972137808055 0.08991125431232247 0.13277984612018107 0.15292947479098354 0.8635451688647294 0.7257496464436435 0.7919688149963695 0.8257156008274512 );
}

}
