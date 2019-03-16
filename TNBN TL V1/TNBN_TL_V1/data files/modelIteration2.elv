// Bayesian Network 
//   Elvira format 

bnet "data files/modelIteration2.elv" {

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
states = ("Default" "[48-65]" "[23-48]" "[0-23]");
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
states = ("Default" "[26-48]" "[0-26]");
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
values= table (0.7333333333333334 0.6363636363636365 0.09090909090909091 0.39999999999999997 0.26315789473684204 0.057142857142857134 0.2 0.2272727272727273 0.8636363636363636 0.39999999999999997 0.15789473684210523 0.3142857142857143 0.06666666666666667 0.13636363636363638 0.045454545454545456 0.19999999999999998 0.5789473684210525 0.6285714285714286 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4468533774868226 0.5531466225131774 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2507750084343814 0.34780722308646195 0.40141776847915667 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6354602734992832 0.10739607811253982 0.6847495026782313 0.1059244573620096 0.511001533896258 0.07363066625360597 0.08080004247180834 0.20000253851420272 0.09347543815936166 0.2050462504810267 0.11298828194063734 0.19650258594620482 0.14093030663687503 0.4425982102305041 0.11546965890274087 0.3565218589444879 0.21486296237891692 0.36493337390009467 0.14093030663687503 0.2481512977861404 0.10447254853105124 0.3306601696946287 0.15929495486712805 0.36306192070060694 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8522911268992185 0.8346671080858648 0.07716472119152941 0.17711710430082134 0.12515517568494222 0.08852349034074775 0.03178545370523147 0.033066578382827054 0.11374908009170016 0.1362388900164203 0.1491419451015275 0.12470905967168848 0.11405368682465408 0.13042928139892893 0.8072515361346462 0.6848274871492062 0.7238840750049751 0.784933493227686 );
}

}
