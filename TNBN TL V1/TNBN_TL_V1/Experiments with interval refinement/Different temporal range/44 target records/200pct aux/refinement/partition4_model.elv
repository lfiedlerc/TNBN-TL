// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/200pct aux/refinement/partition4_model.elv" {

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
states = ("Default" "[37-62]" "[8-37]");
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
states = ("Default" "[28-46]" "[4-28]");
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
values= table (0.2344789053920368 0.3900993855019239 0.3754217091060393 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8078521666909244 0.5996460688925097 0.07851451157128123 0.19214783330907562 0.4003539311074903 0.9214854884287188 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.27236024844720497 0.31849180069378746 0.10443568159529257 0.6427329192546584 0.15811001192875654 0.49747415413533835 0.08490683229813666 0.523398187377456 0.398090164269369 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6331153700150463 0.09863157659315967 0.6737856082325506 0.09395534868596724 0.5435766507298638 0.059962042519926956 0.14093738834787858 0.4539265441617181 0.15122521472663217 0.367867753165096 0.19350667342328357 0.38322890352904654 0.22371014023472788 0.4452803242729235 0.17282881683043677 0.5359061095491522 0.26081334244007787 0.5545547662832085 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8496463507168538 0.8331678456825634 0.06930460983961989 0.17133806514851024 0.11417528565753207 0.08253822130283195 0.013668513571195112 0.026596430398431924 0.07428085273580498 0.11280214819967924 0.10851352750695233 0.0900312960403763 0.1344070501167519 0.13781786661005632 0.8542298064617573 0.7136905145710475 0.7750966250496595 0.8252868803701161 );
}

}
