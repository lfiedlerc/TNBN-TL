// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/200pct aux/no refinement/partition2_model.elv" {

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
states = ("Default" "[46-72]" "[28-46]" "[12-28]" "[0-12]");
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
states = ("Default" "[34-52]" "[20-34]" "[10-20]" "[0-10]");
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
values= table (0.23834840600185545 0.3982724928925605 0.363379101105584 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8077067835318402 0.5992801422431636 0.09449130906197184 0.19229321646815983 0.40071985775683644 0.9055086909380281 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.1903543307086614 0.3004126547631098 0.1461371838463374 0.7451968503937008 0.15658124724573044 0.42660565422930086 0.06444881889763779 0.5430060979911598 0.4272571619243617 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6428165196852385 0.10744771402999251 0.6756840596255193 0.07636120577411253 0.33808519188266023 0.07008506094895055 0.09909426211875605 0.21600105941878095 0.09870170173167243 0.2551598087398352 0.15671087000200926 0.2136090093592841 0.06930959497905607 0.277896505744607 0.09214897631177975 0.19181264491507563 0.20730359654410288 0.23915955555746013 0.08350720823483747 0.20106599448371598 0.08502309644340633 0.2519851663441009 0.10525416917821981 0.2484449545022175 0.10527241498211194 0.19758872632290353 0.048442165887622284 0.2246811742268759 0.19264617239300788 0.22870141963208773 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8071652148393412 0.7846712125522038 0.07368589165155333 0.21464811223088498 0.10859475268046659 0.09741963150107723 0.03083136235761399 0.026245431487395644 0.09388406145481185 0.09218185334726725 0.09530629061063295 0.09983084419189517 0.04802657050078723 0.040944182103867785 0.19720417205032037 0.1641034044961979 0.21761137790312016 0.15728588048083386 0.04756979289489128 0.052197169030656444 0.3265893623428659 0.216134960491875 0.21181257385290625 0.2659506441953561 0.06640705940736633 0.09594200482587625 0.30863651250044855 0.3129316694337749 0.36667500495287414 0.37951299963083773 );
}

}
