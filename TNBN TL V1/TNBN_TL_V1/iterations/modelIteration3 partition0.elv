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
states = ("Default" "[38-60]" "[19-38]" "[0-19]");
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
states = ("Default" "[26-48]" "[0-26]");
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
values= table (0.24789241140498777 0.4041604400810173 0.3479471485139949 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8175743889131467 0.5964576630954083 0.10629228934905902 0.18242561108685337 0.4035423369045918 0.893707710650941 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.12788129744651483 0.29804666611821806 0.2012810559006211 0.7572256728778468 0.18877771379211059 0.44259510869565216 0.11489302967563839 0.5131756200896713 0.35612383540372666 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6447308883479927 0.11653231649932305 0.6984676070861209 0.11163330801447063 0.5096361070522754 0.0726496909985246 0.11131765498429562 0.3556817946561167 0.12852200353706322 0.2627890999852482 0.1695650844772506 0.30911676966715845 0.11605457647298903 0.33043986084181165 0.08156204070621322 0.288370339806821 0.1810221847797675 0.2820408482364584 0.12552841945037588 0.1950513067469027 0.08897677167950531 0.3348816849369534 0.1374852036302032 0.3339363643119668 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8267752885198063 0.8057594966112009 0.06971536643740682 0.18409029784569525 0.13911679973946242 0.09751226145168738 0.033745073664972806 0.03387915756781379 0.12705276245415045 0.14600489406971767 0.14776353437307735 0.13933896200864687 0.13722996623755604 0.15810273531646435 0.8010784344566775 0.6677576772894441 0.7109781653892997 0.7610051002010713 );
}

}
