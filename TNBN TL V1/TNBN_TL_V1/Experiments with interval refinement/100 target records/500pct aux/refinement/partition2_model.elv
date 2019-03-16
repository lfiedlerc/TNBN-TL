// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/500pct aux/refinement/partition2_model.elv" {

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
states = ("Default" "[26-43]" "[7-26]");
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
states = ("Default" "[35-41]" "[24-35]" "[5-24]");
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
values= table (0.23383435253504425 0.42668735223812515 0.3394782952268307 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8229358101244698 0.5932713409744923 0.10996768486210907 0.17706418987553024 0.4067286590255077 0.8900323151378909 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.23964218727456355 0.2553363438740944 0.18740268389502798 0.7212537873322753 0.13379514944793053 0.3599884775016704 0.03910402539316116 0.6108685066779751 0.45260883860330164 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6645275273008954 0.08855719126471395 0.717154220821988 0.07063556005556842 0.5873445529283785 0.06205205921273447 0.08386811817477616 0.22366694692890454 0.08273720071193548 0.23748346855722902 0.11736072347908502 0.21486855217238154 0.12580217726216425 0.28703924855876084 0.09813016828624907 0.3459404856936013 0.12682529795320477 0.35500021663263037 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8329856489636009 0.8186696594332206 0.0656647550556091 0.21722188630083367 0.11165229425973769 0.07375665081410937 0.015906128670133243 0.013503323233696341 0.08933882820185411 0.0861430460051714 0.11360421394162684 0.12537031191000944 0.03777705559156645 0.034722831172362016 0.21031849139186487 0.1704134170971869 0.16761277466797403 0.16092308692926585 0.07356584509936624 0.08873612410714737 0.4448329154217319 0.38764370702327133 0.3929588383882502 0.4565724791946612 );
}

}
