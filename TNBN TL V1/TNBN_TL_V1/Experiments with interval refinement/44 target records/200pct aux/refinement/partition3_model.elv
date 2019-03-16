// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/200pct aux/refinement/partition3_model.elv" {

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
states = ("Default" "[20-43]" "[3-20]");
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
states = ("Default" "[22-35]" "[8-22]");
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
values= table (0.22841910128302798 0.42941081594885877 0.3421700827681133 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8379827814170039 0.6038246066327864 0.12112534500814134 0.16201721858299614 0.39617539336721375 0.8788746549918587 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.1585973301454473 0.2856535564853556 0.12339783032620837 0.7717872086072923 0.12059414225941421 0.46100361612298607 0.06961546124726041 0.59375230125523 0.4155985535508056 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6451990003207041 0.10436440678511656 0.7165689317264445 0.07087663987038335 0.653654952575462 0.07008800076687083 0.13214527028871736 0.3510891525402343 0.1133724273094222 0.32106772483243506 0.10517284162629949 0.30877386847123206 0.10861255092223344 0.20778745762585296 0.09691513947418348 0.2618764682990811 0.10335951677067363 0.30697867156151565 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8219499975518418 0.8192934789168547 0.0396244275866398 0.17999577382319884 0.10616005437651779 0.06956657574469424 0.057495313290551076 0.06638198733666563 0.2607761385766615 0.22888030049330493 0.2323983858621054 0.25015521464504353 0.06120468834155437 0.04056677003907344 0.2985437172670745 0.3135840337467327 0.28781646249076126 0.30774490434749957 );
}

}
