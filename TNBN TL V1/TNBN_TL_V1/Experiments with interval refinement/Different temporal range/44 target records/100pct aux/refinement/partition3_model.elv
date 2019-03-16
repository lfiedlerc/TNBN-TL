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
states = ("Default" "[49-65]" "[23-49]" "[0-23]");
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
states = ("Default" "[32-46]" "[15-32]" "[0-15]");
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
values= table (0.4 0.6666666666666666 0.047619047619047616 0.16666666666666669 0.11111111111111109 0.045454545454545456 0.4 0.20833333333333334 0.8095238095238096 0.6666666666666667 0.3333333333333333 0.40909090909090917 0.2 0.125 0.14285714285714285 0.16666666666666669 0.5555555555555556 0.5454545454545454 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.45768916607826626 0.5423108339217337 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2582625250736465 0.35673221632947966 0.38500525859687396 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6244398698446786 0.0905333123165205 0.08594908451315814 0.17999861527068864 0.15695050215446268 0.42441778758562376 0.1307920851287189 0.30315556256115983 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8400727359213487 0.8264346105691727 0.07116802190435943 0.1791579003415537 0.13419219229924284 0.09710367982204778 0.016544199732274275 0.013351183802371333 0.049758855969409314 0.07878618367257409 0.05759665673545809 0.06579811240163214 0.07720626541727996 0.06675591901185667 0.3925420859808957 0.2784999980984015 0.3548697237571773 0.3545787168310177 0.06433855451439995 0.091550974644832 0.48468811555387586 0.461723681057876 0.45148347053923604 0.48069176560081267 );
}

}
