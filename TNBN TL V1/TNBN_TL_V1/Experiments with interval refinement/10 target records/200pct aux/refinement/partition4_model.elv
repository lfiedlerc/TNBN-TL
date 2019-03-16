// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/200pct aux/refinement/partition4_model.elv" {

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
num-states = 4;
states = ("Default" "[32-40]" "[13-32]" "[5-13]");
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
values= table (0.2113978246872833 0.42941081594885877 0.35919135936385793 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7854575288917514 0.5864333022849602 0.06834756723036355 0.21454247110824864 0.41356669771503984 0.9316524327696365 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5111775254034668 0.2581082287308229 0.11521098368709028 0.40818888224745975 0.12059414225941424 0.46305032778276556 0.08063359234907355 0.6212976290097628 0.4217386885301442 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6639352640569678 0.10043583535654513 0.7194575871886293 0.07037297686672034 0.647107333527843 0.06910585790972798 0.1122226945877989 0.34176989767815846 0.07728717633801625 0.3054250363256556 0.12016058535790292 0.2740873237034194 0.16290391149841776 0.38207295164963945 0.1500575696432913 0.4606410383927921 0.16506269883375085 0.5130780998594497 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8206404737423179 0.8080689891209363 0.0396244275866398 0.17101618198646415 0.10396225217871559 0.06411022653834504 0.035743101282949226 0.04299529813599098 0.17321059431026675 0.15384744730701655 0.17503246328408603 0.15962213371428585 0.07374027201617453 0.08323889719127853 0.41673440017222596 0.33308719174237567 0.32918949516731777 0.3377268302796995 0.03670913104735326 0.028204915577210082 0.18178537620681462 0.15832844091790052 0.19430209226949 0.25203494796992504 );
}

}
