// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/300pct aux/refinement/partition0_model.elv" {

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
states = ("Default" "[36-54]" "[6-36]");
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
states = ("Default" "[23-40]" "[4-23]");
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
values= table (0.24388871436447707 0.3880477273771134 0.36806355825840953 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8610935529139246 0.6409541006989832 0.09884643449156767 0.13890644708607536 0.3590458993010168 0.9011535655084323 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.20645302639242907 0.2587822848856726 0.10458404657772861 0.7299692204107151 0.11226332492360294 0.39968637249147393 0.06357775319685578 0.6289543901907243 0.49572958093079766 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.651187531441825 0.08268811848665676 0.7187499734504197 0.07100131305381097 0.6081146638112787 0.08108563698870962 0.10314347188548187 0.30017726203993544 0.08305369911531231 0.20893143160235575 0.10687781896056035 0.25214113619212236 0.17815690598401412 0.43628248023195587 0.1472315575225991 0.5297904158488307 0.19688019282208488 0.4594571815056452 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8307014491517415 0.8029376161047429 0.04734516693871731 0.16776898231738058 0.11321210706504824 0.05853661869064025 0.05315187061515093 0.05602754051923976 0.3075499854764771 0.28613785551784443 0.25443703257205363 0.274049736737576 0.07480633642132353 0.1139870651943154 0.49132985484656705 0.3946084151259162 0.4583608307364202 0.46793526476960257 );
}

}
