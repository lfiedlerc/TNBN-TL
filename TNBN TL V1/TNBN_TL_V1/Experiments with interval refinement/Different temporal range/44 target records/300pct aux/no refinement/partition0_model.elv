// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/300pct aux/no refinement/partition0_model.elv" {

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
states = ("Default" "[52-73]" "[36-52]" "[19-36]" "[0-19]");
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
states = ("Default" "[33-53]" "[18-33]" "[9-18]" "[0-9]");
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
values= table (0.24937252241331342 0.37520576848064735 0.37542170910603934 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8238243889131467 0.6118743297620749 0.08407006712683679 0.17617561108685337 0.3881256702379251 0.9159299328731633 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.14391669711362806 0.31067454335606975 0.10443568159529257 0.7812787723785166 0.18516974886701013 0.48456143756129455 0.07480453050785531 0.5041557077769202 0.41100288084341285 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6155658781595582 0.11598619102416571 0.6745095403040758 0.08384332570090122 0.34690515501742797 0.07737778583464602 0.09059648245342189 0.16118296892980438 0.09591927038867097 0.1985535246853877 0.11450926435516418 0.16471224221194766 0.08547527227492224 0.23102876869965477 0.07106648183581685 0.21528486699722235 0.12788295725554943 0.2033024938824885 0.07061883488330778 0.29988032220943617 0.060846000114893585 0.1929511783204413 0.2524399192808659 0.24876071783107617 0.13774353222878985 0.19192174913693905 0.09765870735654285 0.30936710429604736 0.15826270409099247 0.3058467602398416 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.783194786113829 0.800602005880996 0.06797110862319701 0.17140562427105677 0.11516543313556057 0.08085357236589748 0.03956078127449316 0.029362245054199484 0.09588558575027586 0.12665109772332409 0.10708158365886762 0.1257987604223447 0.07357235172003285 0.05475834802674962 0.2762417325803907 0.19067936924382864 0.24332524851091827 0.24696828377041566 0.04627227118798634 0.04464084889950793 0.23769497845467064 0.23919351161757507 0.23253699188134294 0.23758948579734723 0.057399809703658794 0.07063655213854707 0.3222065945914659 0.27207039714421544 0.3018907428133106 0.3087898976439949 );
}

}
