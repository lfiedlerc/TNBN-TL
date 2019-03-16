// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/300pct aux/refinement/partition0_model.elv" {

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
states = ("Default" "[34-56]" "[0-34]");
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
states = ("Default" "[28-46]" "[0-28]");
}

// Links of the associated graph:

link Colision Pupilas_Dilatadas;

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
values= table (0.5 0.7142857142857143 0.08 0.125 0.2 0.03333333333333333 0.42857142857142855 0.19047619047619044 0.7199999999999999 0.375 0.05 0.3333333333333333 0.07142857142857142 0.09523809523809522 0.2 0.5 0.75 0.6333333333333333 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4486040777669346 0.5513959222330653 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2542424148144091 0.34780722308646195 0.39795036209912893 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6343630513516498 0.10173323288596972 0.6797920783933735 0.09334775033134796 0.5283215197189957 0.06339135075934783 0.13448715352582993 0.4100323595767574 0.11833771015897064 0.3098949952678071 0.19689331057601558 0.26540900833283115 0.2290484333486791 0.4861208386734752 0.1995498641896368 0.5946633692976839 0.27262150695140625 0.6690061780290373 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8460833147225255 0.8272494536136903 0.0665830872558148 0.1734514245415383 0.11786691164431781 0.08283716961440361 0.01923958565968431 0.022532679963431702 0.08230529891932693 0.10748837976814077 0.10465985794050467 0.09840006074987168 0.13275314105182173 0.14834014309259203 0.8492410388494188 0.7172069477632841 0.7756043043805256 0.8169061647159159 );
}

}
