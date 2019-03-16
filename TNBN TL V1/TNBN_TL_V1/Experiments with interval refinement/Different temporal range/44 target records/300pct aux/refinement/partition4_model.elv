// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/300pct aux/refinement/partition4_model.elv" {

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
num-states = 3;
states = ("Default" "[26-43]" "[0-26]");
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
values= table (0.5454545454545454 0.4 0.0909090909090909 0.3333333333333333 0.08333333333333333 0.058823529411764705 0.36363636363636365 0.4 0.8181818181818181 0.3333333333333333 0.16666666666666666 0.47058823529411764 0.09090909090909091 0.2 0.0909090909090909 0.3333333333333333 0.7500000000000001 0.47058823529411764 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4330741353333882 0.5669258646666119 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2718010630119287 0.3382243708848457 0.38997456610322573 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6333594929806882 0.09863157659315967 0.6737856082325506 0.09370873466965547 0.5435766507298638 0.059820708171397396 0.07520830913216653 0.18140748144037036 0.08436579097434035 0.15893207993267 0.09013402275502688 0.1576578771573526 0.16545828009076635 0.49320159016600695 0.12936087949398856 0.4143586369673183 0.2071164778200618 0.4499017470100062 0.12409371006807478 0.2248696905354591 0.11061292594413515 0.33110849985972923 0.1572551035300469 0.33069701062273954 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8496463507168538 0.8331678456825634 0.06995197163243828 0.17133806514851024 0.11366106919798838 0.08232434366036687 0.01978337490567713 0.019860970752075782 0.09012836563561939 0.11650122440088972 0.10914577067200992 0.10259727834853041 0.12859193688690138 0.14498508649015324 0.8380020379311846 0.7102816584441342 0.7753113364977258 0.8131784283920558 );
}

}
