// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/200pct aux/refinement/partition0_model.elv" {

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
states = ("Default" "[51-67]" "[23-51]" "[5-23]");
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
states = ("Default" "[40-50]" "[25-40]" "[5-25]");
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
values= table (0.6315439414436177 0.10003144096928987 0.6744871388447955 0.09531955200396157 0.5458537755038241 0.06165779297200652 0.08534857853565918 0.2060403180502274 0.08824143826496507 0.19273626935567778 0.07991414250791079 0.18212549165944178 0.15196210324641757 0.49371925268639394 0.15687366802660457 0.42677316785900077 0.22220029868053243 0.4533341042392627 0.12906370412709436 0.19826521170870937 0.07843683401330229 0.2832043141552816 0.1500826578807105 0.30090298621994727 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.848009445954949 0.8344773694920873 0.0689325591205981 0.17094562103515692 0.11310703989395907 0.08244906021365486 0.008940620826179472 0.010610425032558506 0.05147728639477462 0.047310168364841594 0.059126197340402725 0.06648919853524239 0.037997638511262755 0.023342935071628716 0.09847828701609057 0.14193050509452476 0.13189690175935992 0.12854578383480197 0.10281713950106391 0.12944718539721378 0.7788737245818073 0.6375608403452462 0.6935957764931858 0.7202996507984593 );
}

}
