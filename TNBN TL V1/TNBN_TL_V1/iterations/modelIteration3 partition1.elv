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
states = ("Default" "[33-59]" "[0-33]");
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
states = ("Default" "[30-43]" "[14-30]" "[0-14]");
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
values= table (0.34545454545454546 0.6538461538461539 0.04109589041095891 0.11475409836065574 0.12280701754385966 0.06666666666666665 0.5636363636363636 0.2692307692307692 0.8767123287671234 0.3934426229508196 0.03508771929824562 0.3166666666666666 0.09090909090909091 0.07692307692307693 0.08219178082191782 0.4918032786885246 0.8421052631578948 0.6166666666666666 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4299861443401525 0.5700138556598475 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2749194270681631 0.28359924358144484 0.4414813293503921 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6294864221917411 0.08356933100956049 0.18911630533963214 0.3941428512819052 0.1794675142508754 0.520346227308131 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8386274496294008 0.8304332539358211 0.07716834651923474 0.19282340110506055 0.13060067311917112 0.08763688359760324 0.01994492195591675 0.013336710364598338 0.0430529980325712 0.08311887173975349 0.06384357907980169 0.059949937833422375 0.07615333837713668 0.07239928483639098 0.4118112855289418 0.2752158197605171 0.3624061988941684 0.3653199336724176 0.06346111531428057 0.08192550652538978 0.4660955004395752 0.44699482135600765 0.44127179658098226 0.4852198093392624 );
}

}
