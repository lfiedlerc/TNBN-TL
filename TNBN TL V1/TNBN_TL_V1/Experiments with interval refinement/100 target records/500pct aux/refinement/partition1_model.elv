// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/500pct aux/refinement/partition1_model.elv" {

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
states = ("Default" "[33-54]" "[5-33]");
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
states = ("Default" "[23-40]" "[4-23]");
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
values= table (0.2260673622437821 0.3762019153449212 0.3977307224112967 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8153600525487122 0.6207308004339518 0.07299959975572609 0.1846399474512878 0.37926919956604827 0.927000400244274 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.31322414106754154 0.28671925599071374 0.1435805715582713 0.6453723974832667 0.09524874652208282 0.38002144314133063 0.041403461449191714 0.6180319974872035 0.4763979853003982 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6224399852133533 0.08855719126471395 0.71329619613063 0.08606765882100052 0.6027766516938107 0.05364649052347784 0.113268004435994 0.3701573855884121 0.08717345387920034 0.2840853085055377 0.1558483950292226 0.3142043272570272 0.17178980672792424 0.41293939497802756 0.14722627766264945 0.46724557319989746 0.18055606741190425 0.4713064908855407 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8279021340761645 0.8090078236844283 0.07668768274520346 0.20928537836432573 0.1337482538556973 0.060443798791579934 0.05264170016493791 0.054569193233020494 0.3140009499975826 0.2591891158805773 0.27817135813685584 0.2807438848232331 0.087061273349705 0.09549608815778587 0.4373584660680615 0.4094436758113467 0.4200574200053192 0.4679064747053885 );
}

}
