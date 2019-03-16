// Bayesian Network 
//   Elvira format 

bnet "targetVarying Baseline Experiments/440 records/aux100pct/partition2_model.elv" {

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
states = ("Default" "[34-57]" "[15-34]" "[0-15]");
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
states = ("Default" "[20-45]" "[0-20]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Signos_Vitales Herida_Cabeza;

link Signos_Vitales Heridas_Internas;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.255079006772009 0.40857787810383744 0.3363431151241535 );
}

relation Herida_Cabeza Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.9743589743589743 0.6153846153846154 0.6296296296296297 0.7777777777777778 0.52 0.4766355140186916 0.38095238095238093 0.26666666666666666 0.06779661016949153 0.02564102564102564 0.38461538461538464 0.37037037037037035 0.2222222222222222 0.48 0.5233644859813084 0.6190476190476191 0.7333333333333333 0.9322033898305084 );
}

relation Heridas_Internas Colision Signos_Vitales  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4050632911392405 0.14285714285714285 0.21428571428571427 0.509090909090909 0.15384615384615385 0.12037037037037036 0.36363636363636365 0.125 0.08403361344537816 0.5822784810126582 0.6428571428571429 0.5357142857142857 0.2909090909090909 0.07692307692307693 0.12037037037037036 0.5 0.4375 0.31092436974789917 0.012658227848101266 0.21428571428571427 0.25 0.2 0.7692307692307693 0.7592592592592593 0.13636363636363635 0.4375 0.6050420168067226 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7072072072072072 0.048672566371681415 0.07657657657657657 0.11061946902654868 0.12612612612612611 0.18584070796460178 0.09009009009009009 0.6548672566371682 );
}

relation Signos_Vitales Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6695652173913044 0.2896174863387978 0.13245033112582782 0.10434782608695652 0.13114754098360656 0.09271523178807947 0.22608695652173913 0.5792349726775956 0.7748344370860927 );
}

}
