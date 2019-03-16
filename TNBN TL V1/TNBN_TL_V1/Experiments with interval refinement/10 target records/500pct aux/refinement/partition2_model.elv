// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/500pct aux/refinement/partition2_model.elv" {

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
states = ("Default" "[33-54]" "[4-33]");
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
states = ("Default" "[21-35]" "[6-21]");
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
values= table (0.23682165649322198 0.4210114747175874 0.34216686878919067 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8062691434578031 0.5326999124030638 0.12746768486210908 0.19373085654219688 0.4673000875969363 0.872532315137891 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.31897273120761793 0.3606567147002491 0.15735323543553767 0.4039316116000577 0.12569358246130324 0.38002144314133063 0.2770956571923244 0.5136497028384477 0.46262532142313173 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6381969568345209 0.08151716224302988 0.6924803368531951 0.07990228023418619 0.6468438899667482 0.06539544534029816 0.13024909553957245 0.3954329242789304 0.11645715054080186 0.36300730350135624 0.12496293124253524 0.34574966183942724 0.18271053679856694 0.3864458123635001 0.1510303671076024 0.42770167442239 0.17023935560577264 0.4555972106529953 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8585416147960516 0.8608966057788856 0.06628102106280814 0.16328634945881185 0.11052388841937492 0.05669103026811252 0.040948479927458745 0.04573262275762665 0.27652446683909143 0.22901429659209246 0.24078747262990663 0.2820943014245835 0.05770013080687368 0.060976830343502195 0.35194023052247997 0.34442307597708394 0.346805837444567 0.35396546102320353 );
}

}
