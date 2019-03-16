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
states = ("Default" "[44-72]" "[21-44]" "[0-21]");
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
values= table (0.2692307692307692 0.7500000000000001 0.07692307692307693 0.1851851851851852 0.282051282051282 0.019607843137254905 0.6538461538461539 0.16666666666666669 0.7948717948717948 0.3703703703703704 0.25641025641025633 0.5686274509803922 0.07692307692307693 0.08333333333333334 0.1282051282051282 0.4444444444444445 0.4615384615384615 0.41176470588235303 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.44426271950662954 0.5557372804933705 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.26035410650252383 0.34650446363905496 0.39314142985842127 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6183643015546755 0.08112336613606441 0.11341060850026152 0.28162034358108834 0.135012629166978 0.33938861918746543 0.13141229238919191 0.2960624124826826 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8439415255447524 0.8161262493860665 0.07465007851083799 0.18884571098556752 0.12958469627994396 0.09534089790472625 0.01692200325418347 0.01706045108789074 0.047019813083798885 0.09586368870170567 0.06271551315013504 0.07319855805335201 0.0770891259357247 0.07392862138085987 0.4269399028008939 0.2857475336300842 0.3781935489962689 0.40540739844933427 0.06016712268154123 0.09098907246875061 0.44950941308111736 0.4276995342076099 0.4276057714781935 0.4241762594886553 );
}

}
