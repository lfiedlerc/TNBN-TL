// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/500pct aux/refinement/partition0_model.elv" {

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
states = ("Default" "[49-62]" "[23-49]" "[0-23]");
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
states = ("Default" "[30-43]" "[12-30]" "[0-12]");
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
values= table (0.2475406393715161 0.41476650893592315 0.3376928516925607 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.82543159443743 0.5810644537333323 0.11423074070948508 0.17456840556257014 0.41893554626666774 0.8857692592905149 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.15476455232376504 0.2934776309324329 0.19429616547271777 0.7306436752394719 0.1541796328726393 0.41691637065994613 0.114591772436763 0.5523427361949277 0.3887874638673361 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6519579744019308 0.07206859125619824 0.6983457241636669 0.07329074906610898 0.6567879013465443 0.06687214693662676 0.06960840511961384 0.18361195960249696 0.07247537796067743 0.16597777628666704 0.07950110759769313 0.19574779809679724 0.14888464428361847 0.483708925834535 0.12144522793410813 0.4090166629921438 0.1415507525519902 0.39909745243036326 0.1276154093859587 0.25863620116050645 0.1057748759426103 0.3497388857469056 0.12022118709895058 0.3363821384770204 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.850614615710938 0.8385714451703562 0.05917064992969021 0.14883101410304647 0.0945093533994483 0.061066482770130624 0.009336586518066375 0.017092435217256403 0.039123596735597045 0.06985836169348648 0.03961521578877413 0.03959358205186197 0.05415220180478498 0.06836974086902561 0.4881134449869726 0.3180393834992936 0.39803859673482583 0.43364399390134534 0.08402927866259738 0.07406721927477775 0.41172927993175934 0.4614328627648711 0.46595039522986714 0.4638105326075258 );
}

}
