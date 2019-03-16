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
states = ("Default" "[32-45]" "[15-32]" "[0-15]");
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
values= table (0.4347826086956521 0.736842105263158 0.21875 0.26315789473684215 0.05263157894736841 0.01470588235294118 0.391304347826087 0.1842105263157895 0.65625 0.368421052631579 0.23684210526315783 0.4852941176470589 0.17391304347826086 0.07894736842105264 0.125 0.368421052631579 0.7105263157894737 0.5000000000000001 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4301184479366154 0.5698815520633845 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.24100153788887146 0.34826378805847785 0.41073467405265063 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6172881875911462 0.08196986562902707 0.1670399623220964 0.39487322373598616 0.21355742018394602 0.5211524780271899 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8324757460665506 0.8283563061638102 0.07471851049800442 0.18276448491594505 0.12296932738555133 0.09175106067743971 0.02025018454140597 0.017164369383618983 0.04273388405330502 0.07462506930611638 0.06675074886706163 0.05538103288552198 0.07731888643082278 0.059121716765798714 0.39389493127394193 0.27483866988350175 0.3726916811744274 0.402435505634793 0.06811425709382007 0.0934504555330367 0.48679467921590935 0.46595165225282414 0.4357340551044301 0.448586366372728 );
}

}
