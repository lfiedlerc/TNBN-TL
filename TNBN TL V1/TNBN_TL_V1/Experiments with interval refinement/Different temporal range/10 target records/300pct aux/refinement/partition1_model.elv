// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/300pct aux/refinement/partition1_model.elv" {

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
states = ("Default" "[50-64]" "[23-50]" "[0-23]");
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
states = ("Default" "[32-48]" "[20-32]" "[0-20]");
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
values= table (0.5 0.5 0.14285714285714282 0.3333333333333333 0.3333333333333333 0.2 0.3333333333333333 0.25 0.7142857142857143 0.3333333333333333 0.3333333333333333 0.4 0.16666666666666666 0.25 0.14285714285714282 0.3333333333333333 0.3333333333333333 0.4 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.48679929421167145 0.5132007057883285 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.271788841724186 0.31068252420282405 0.41752863407299 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6551265840946048 0.0828149604085743 0.7009608264383566 0.06254725545100018 0.6486521526839998 0.06920744569503047 0.06595939648463843 0.18996091824173877 0.07092595783192826 0.18559670498141817 0.045145254124402255 0.18807767076677737 0.15076433482203072 0.4873744771050671 0.12076582009220216 0.4280087278142909 0.1746925050900783 0.4298918188954911 0.12626513041345072 0.2379308470906627 0.10543047785827171 0.3219534678249091 0.12954725096567607 0.31090390473691765 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8317027346345105 0.8352211641488095 0.06272611617504055 0.1624265645642226 0.10416693792338391 0.06765989845252465 0.0037399392303442114 0.017046086467364528 0.054811338235377746 0.0710116608304246 0.05850338364581983 0.054843535385145616 0.02991951384275369 0.02462212489730432 0.19001263921597616 0.14566494529317867 0.14991492059241332 0.18646802030949508 0.1327678426772195 0.12121661487903666 0.6906228617657596 0.6190760174960093 0.6855865270994511 0.6892004280066633 );
}

}
