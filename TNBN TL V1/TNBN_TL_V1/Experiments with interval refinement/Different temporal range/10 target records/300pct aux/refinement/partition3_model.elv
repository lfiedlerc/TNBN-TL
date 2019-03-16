// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/300pct aux/refinement/partition3_model.elv" {

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
states = ("Default" "[41-50]" "[20-41]" "[0-20]");
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
states = ("Default" "[31-44]" "[21-31]" "[0-21]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

link Pupilas_Dilatadas Herida_Cabeza;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.22315678781325948 0.42163186456964147 0.3552113476170991 );
}

relation Herida_Cabeza Colision Pupilas_Dilatadas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8172200930007383 0.8172200930007383 0.8172200930007383 0.8172200930007383 0.6358650568061222 0.6001507710918365 0.6168174377585031 0.5834841044251697 0.13332544569406962 0.11665877902740295 0.09999211236073628 0.09999211236073628 0.18277990699926178 0.18277990699926178 0.18277990699926178 0.18277990699926178 0.3641349431938779 0.3998492289081636 0.38318256224149694 0.41651589557483026 0.8666745543059303 0.883341220972597 0.9000078876392638 0.9000078876392638 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.195691237938982 0.27052777873099754 0.13456290086724867 0.6762520020313294 0.1362736350845887 0.43404240686849377 0.12805676002968866 0.5931985861844137 0.4313946922642574 );
}

relation Pupilas_Dilatadas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.42231870788211423 0.4632798373028775 0.37727640324138073 0.14907904312719633 0.10961186421279263 0.10846236820420398 0.2869771580198529 0.196545411691904 0.2543255530305472 0.13976160293174655 0.2286730270646191 0.25806563469276117 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8311549110747067 0.8349533070059524 0.0626335809538141 0.1624756071242846 0.10447927091018391 0.06798745083380553 0.0037108810752811707 0.01707379582697044 0.030055837083645235 0.06128227264944259 0.04299995150118114 0.046230781208640596 0.024120726989327608 0.02466214952784619 0.1427652261473149 0.10770823677780819 0.1420867962647725 0.1553354248610324 0.13915804032304388 0.12141365921401204 0.762666865997498 0.66667684488333 0.7085644182151154 0.7285971118481759 );
}

}
