// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/300pct aux/refinement/partition0_model.elv" {

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
num-states = 5;
states = ("Default" "[31-48]" "[21-31]" "[10-21]" "[0-10]");
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
values= table (0.42857142857142855 0.7647058823529412 0.10000000000000002 0.25 0.0909090909090909 0.07692307692307693 0.42857142857142855 0.17647058823529413 0.6999999999999998 0.25 0.1818181818181818 0.3076923076923077 0.14285714285714285 0.058823529411764705 0.20000000000000004 0.5 0.7272727272727272 0.6153846153846154 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.448291526637736 0.551708473362264 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.25903510556512016 0.3616286262039946 0.37933626823088523 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6315439414436177 0.09902443373601681 0.6744871388447955 0.09408648192240272 0.5447552221584353 0.06066845253229966 0.07487342366386378 0.17644104839336336 0.07693940354577561 0.15906832651469588 0.07323502947886042 0.1651994132560782 0.14186543431047874 0.49929062630462406 0.1302051444620818 0.4015505315675859 0.21574643819448067 0.4379705374696026 0.14974684732772756 0.22336685913627916 0.11639550792822465 0.3433548023548923 0.16428398504717337 0.33424067333206514 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.848009445954949 0.8344773694920873 0.0689325591205981 0.17066459576075516 0.11310703989395907 0.08266293785611992 0.016887839338339 0.01154809050055205 0.0502776418074877 0.08970736160645254 0.08262977889186716 0.08405877461876192 0.04315781164242189 0.032719589751564145 0.16386786959477473 0.1318148986870323 0.1524060366227772 0.14984390258127125 0.046910664828719445 0.05581577075266825 0.3668405717064843 0.25996827241053594 0.3158293770978034 0.3234435458156709 0.04315781164242189 0.06351449775303628 0.3482192228888963 0.3460141090534598 0.33419155018488494 0.3581634744625508 );
}

}
