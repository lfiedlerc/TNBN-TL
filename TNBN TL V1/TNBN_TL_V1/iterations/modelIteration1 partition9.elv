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
num-states = 3;
states = ("Default" "[36-62]" "[0-36]");
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
states = ("Default" "[30-50]" "[0-30]");
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
values= table (0.2504843283319525 0.3861365705624634 0.363379101105584 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8218676898298433 0.6078349595189111 0.100071666204829 0.17813231017015674 0.39216504048108886 0.899928333795171 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.23943774606299215 0.3137531287479794 0.11079359043187785 0.6873658956692913 0.1650706397815565 0.47373044544858034 0.07319635826771653 0.5211762314704642 0.41547596411954185 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6176692224048834 0.07687504581681318 0.14032353007480342 0.3653217903788782 0.23997357317140294 0.5558390681571104 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8123941957455387 0.824637030945877 0.07562141693230025 0.19345151455229334 0.1388009061900502 0.1079715436092859 0.8255807056439968 0.7919422713074322 0.06860715754834339 0.178634391500541 0.12423544040725082 0.08604355636145236 0.7671576413665021 0.7562880253765203 0.08919336493858371 0.17816420918135326 0.1213057484395409 0.08715741638127983 0.035292180998364 0.02287343074618995 0.09923746219812282 0.12281533755680989 0.13363434214292325 0.11333148421357433 0.02412181730455364 0.04008451653710021 0.08299540180262287 0.13171118889078184 0.11676860794569992 0.11150268612390282 0.04284299398856361 0.048742394924695946 0.10530624381034633 0.1192395678643126 0.1031590735584606 0.10142695373541334 0.15045614004565708 0.15058341907908385 0.8233033900881302 0.6819000831512428 0.7257087191372638 0.7768690450124047 0.148441952643407 0.16606442565370086 0.8465530983867533 0.6878250975407496 0.7571714421478978 0.8006258446273677 0.18813662577586632 0.19309487220168006 0.803652913289485 0.7007617680641139 0.7736930516884546 0.8095715034517538 );
}

}
