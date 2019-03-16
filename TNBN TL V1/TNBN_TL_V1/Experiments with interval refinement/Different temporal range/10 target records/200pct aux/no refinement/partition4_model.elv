// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/200pct aux/no refinement/partition4_model.elv" {

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
states = ("Default" "[46-68]" "[27-46]" "[13-27]" "[0-13]");
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
states = ("Default" "[32-52]" "[16-32]" "[7-16]" "[0-7]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.26646959329921727 0.3903904718020618 0.34313993489872097 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8625817948222527 0.6101986353597172 0.10530623372144726 0.13741820517774733 0.3898013646402828 0.8946937662785528 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.15528622516200158 0.2930489284685944 0.13246722807252517 0.7695208518189884 0.14061793015507384 0.4724146590547622 0.07519292301900998 0.5663331413763317 0.3951181128727127 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.656690569249788 0.09424753909657885 0.08815378072232699 0.2437636401534625 0.09656958316492742 0.27838630696311306 0.08056339869095627 0.17645303171211707 0.07802266817200132 0.20714948207472855 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7666862297866286 0.7766693469348316 0.12972793544124794 0.16468354430379745 0.1854808482656584 0.12532709286246146 0.7250289288869366 0.7571415558043763 0.061349089532781016 0.14013671557896973 0.17900959799693977 0.10825008552856652 0.6117791069689804 0.5527305605786619 0.13497335109926717 0.18324059378689622 0.11926501764211996 0.09077171547675741 0.049658090017028804 0.041974138288033355 0.12001449493932186 0.20632911392405062 0.18889363800756206 0.18207850228699074 0.04480129755858981 0.045585941206611885 0.1033163715883763 0.1379297835056741 0.1300598136041174 0.128019443494127 0.08603839198775907 0.08374321880650994 0.15985676215856096 0.09948118242921707 0.09866789389743508 0.13081169013741073 0.06806120588849912 0.05660441657579063 0.29961185453541406 0.21569620253164556 0.21331579812592474 0.2499159663865546 0.08628336485243476 0.07289696923690053 0.3752495899743471 0.24704191603356868 0.290212825149534 0.27034125898049943 0.08603839198775907 0.15426763110307412 0.3108061292471686 0.23390218618732944 0.2982041507599483 0.2841416346068196 0.05700493079546314 0.06045358074624188 0.2534856039225425 0.22582278481012658 0.21461778727601513 0.22648016168492713 0.08033950134115243 0.053494012487427176 0.21725808486479664 0.2493093119992834 0.16595214911670608 0.22417407914243354 0.13010571706774238 0.09893309222423145 0.14156895403064626 0.21560627535311078 0.23334234433294868 0.2491058574597056 0.05858954351238035 0.06429851745510265 0.19716011116147364 0.18746835443037974 0.19769192832483976 0.21619827677906606 0.06354690736088646 0.07088152126468411 0.2428268640396989 0.2255822728825041 0.23476561413270275 0.2692151328543733 0.08603839198775907 0.1103254972875226 0.2527948034643571 0.26776976224344645 0.25052059336754806 0.2451691023193066 );
}

}
