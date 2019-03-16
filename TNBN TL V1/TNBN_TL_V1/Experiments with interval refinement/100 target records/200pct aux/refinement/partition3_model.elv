// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/200pct aux/refinement/partition3_model.elv" {

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
states = ("Default" "[36-54]" "[6-36]");
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
states = ("Default" "[21-34]" "[6-21]");
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
values= table (0.22874961150818807 0.40140007436654107 0.3698503141252709 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8569551134328142 0.5508225362394115 0.09490583281301934 0.14304488656718586 0.44917746376058854 0.9050941671869805 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.24123331340904564 0.2433746813272355 0.12432372369610863 0.689151225343694 0.1455771139437579 0.4332268150259782 0.06961546124726041 0.6110482047290065 0.4424494612779132 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6569697442849112 0.12009938694010935 0.6904826771067449 0.0858880926164555 0.603809267875698 0.06722873509633848 0.11915787830103086 0.35482753846406995 0.09157317245362576 0.2760259485040507 0.13206357737476732 0.24442561084180725 0.1552663262710402 0.37274812121478057 0.1703261007637439 0.48573397431556975 0.20442718141573574 0.5086209402075842 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7956845369329528 0.8232478790277425 0.061017525822431876 0.22174969070664435 0.09741339684679982 0.06285780438139686 0.03648490411911557 0.0564877912385565 0.20585385010815915 0.17834902921306067 0.19418197836762074 0.22441144531096818 0.07114556303227536 0.058309978052703486 0.35753563439838165 0.3224694568599784 0.3488083685492447 0.3267430643727697 );
}

}
