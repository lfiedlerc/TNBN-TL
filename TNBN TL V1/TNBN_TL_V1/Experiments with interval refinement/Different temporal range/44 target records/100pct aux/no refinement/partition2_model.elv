// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/100pct aux/no refinement/partition2_model.elv" {

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
states = ("Default" "[48-73]" "[30-48]" "[15-30]" "[0-15]");
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
states = ("Default" "[35-52]" "[20-35]" "[9-20]" "[0-9]");
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
values= table (0.23235124581756872 0.3709504493317111 0.39669830485072016 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8050743889131466 0.6002671869049321 0.08724467030143997 0.19492561108685338 0.399732813095068 0.9127553296985601 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.18240165631469982 0.332803394896686 0.09553035982008994 0.7299654934437543 0.16015452538631347 0.5081605402655814 0.0876328502415459 0.5070420797170005 0.39630909991432844 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6181974571069266 0.1126528576908324 0.6578428736374091 0.08273221458979012 0.3510718216840947 0.06952064297750317 0.09634776563552583 0.20673341004986578 0.10632531628197192 0.25722726213756736 0.16296367638965326 0.21499748829970766 0.10504974627306785 0.2940744150364404 0.0918055827797197 0.20553891010752082 0.14861447440836545 0.24378286081407316 0.08767271559011702 0.25213732259301885 0.0623648745358875 0.17469109829364549 0.1619881673087507 0.1978970753630901 0.09273231539436261 0.13440199462984276 0.08166135276501174 0.2798105148714763 0.17536186020913594 0.2738019325456259 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7998614527804956 0.7774441111441538 0.08235985437578279 0.17140562427105677 0.13176359846124092 0.08214826479316821 0.02312492978228654 0.030603690151407403 0.09483017333102339 0.10897322779752748 0.08846322666609358 0.08820604445521169 0.05881941404517915 0.052784357585239396 0.22719347660475187 0.17417792322277903 0.18810456684790783 0.19820483314154203 0.06303304331516356 0.052961818440413234 0.2960997120525796 0.2308122304514838 0.2711079323461778 0.29783598812912604 0.05516116007687523 0.08620602267878616 0.2995167836358623 0.31463099425715285 0.3205606756785799 0.3336048694809522 );
}

}
