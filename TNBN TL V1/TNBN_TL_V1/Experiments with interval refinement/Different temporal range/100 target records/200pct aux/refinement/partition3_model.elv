// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/200pct aux/refinement/partition3_model.elv" {

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
num-states = 5;
states = ("Default" "[46-66]" "[32-46]" "[15-32]" "[0-15]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 5;
states = ("Default" "[40-48]" "[26-40]" "[12-26]" "[0-12]");
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
values= table (0.23661470281184155 0.38440286737244955 0.37898242981570884 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8371451893289417 0.5807427272771772 0.08836652683200669 0.16285481067105834 0.4192572727228228 0.9116334731679933 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.19489009186351708 0.2888893217529235 0.10995207630296212 0.7238139763779528 0.16650904183912174 0.47541347370641174 0.08129593175853018 0.5446016364079548 0.41463444999062615 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6318492023005791 0.10380892478871533 0.6699366067862338 0.09610053723995267 0.5215205391486506 0.06072407378299687 0.09500665747081832 0.26663536121988635 0.08346430632991789 0.24264514266714385 0.11867797651037407 0.22275318408308378 0.07323429846708912 0.2555255545023911 0.0815673902769652 0.1648505167738611 0.12809686353500693 0.2097592483449039 0.09500665747081832 0.21849286544407356 0.08536122238287056 0.2796902026163261 0.1224455313202272 0.2784414801038547 0.10292387892671985 0.15368565959201783 0.07777355817105984 0.21486134770525717 0.10737531208081462 0.2264657371511352 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8426630276887931 0.8315953821554076 0.07184909253136279 0.1817907112799423 0.11285564636915177 0.08191509872376601 0.011106139221967546 0.012954201372660953 0.03505937821452109 0.03287448035035947 0.03833339799639467 0.04745568078167412 0.020361255240273834 0.018506001960944218 0.07380921729372861 0.09314436099268515 0.11500019398918403 0.0821348321221283 0.06848785853546653 0.06477100686330477 0.4133316168448802 0.290391243094842 0.3267465829216498 0.36869413530377587 0.05553069610983773 0.07032280745158803 0.4041054646831641 0.3999728442627068 0.4052387788190294 0.4179750345770528 );
}

}
