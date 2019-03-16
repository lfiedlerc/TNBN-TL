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
states = ("Default" "[49-65]" "[22-49]" "[0-22]");
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
values= table (0.4 0.7727272727272727 0.13333333333333333 0.2142857142857143 0.05882352941176472 0.08695652173913043 0.5333333333333333 0.13636363636363635 0.5333333333333333 0.4285714285714286 0.11764705882352944 0.21739130434782605 0.06666666666666667 0.09090909090909091 0.3333333333333333 0.3571428571428572 0.823529411764706 0.6956521739130435 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4437209121100123 0.5562790878899877 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2720772817455461 0.3515516825775173 0.37637103567693675 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6212163474547299 0.09186641494866762 0.07500666387035053 0.19975239752656598 0.16501466051477118 0.4069030319985603 0.13688716156338973 0.299628596289849 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8401028998715752 0.8263909514326273 0.06831601403698266 0.17816402480107507 0.12811406673547465 0.09075862529630346 0.015228295250326178 0.013354542197490209 0.05534756352255548 0.08071603327846585 0.06548499498767894 0.07065679394425453 0.07043086553275855 0.06868050272994965 0.39296770101014394 0.2990162141906803 0.3816839707853287 0.3867529773790775 0.07233440243904933 0.08966621189743426 0.4815238026462327 0.44026927242799546 0.42284596763472687 0.4499722140660421 );
}

}
