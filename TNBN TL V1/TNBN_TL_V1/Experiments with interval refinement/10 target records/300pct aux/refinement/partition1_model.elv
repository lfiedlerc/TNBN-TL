// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/300pct aux/refinement/partition1_model.elv" {

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
states = ("Default" "[39-55]" "[29-39]" "[21-29]" "[3-21]");
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
states = ("Default" "[29-41]" "[20-29]" "[10-20]" "[4-10]");
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
values= table (0.26987825880062344 0.4597430223733793 0.2703787188259973 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8426320144523862 0.6672698901726675 0.17503691068204388 0.15736798554761383 0.3327301098273326 0.8249630893179561 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.36560380897417394 0.27008293216958357 0.20835946742038697 0.5096065983744529 0.11791364856555842 0.31897215628051734 0.12478959265137303 0.612003419264858 0.4726683762990957 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6601599115215913 0.07355291173155855 0.7050624651866563 0.0748520758446651 0.6348088186830098 0.06936870146042864 0.08738745132301938 0.30274967348772286 0.09901474383019396 0.2593718287364064 0.11412224416155944 0.25093808228477726 0.06129258738628443 0.19521563645656445 0.04582065272993019 0.15198858753980501 0.06456058383996792 0.15122758601268035 0.047941726767489805 0.09595344842780287 0.04582065272993019 0.1404242384878633 0.04434464344563453 0.1462420611990755 0.10134516924266831 0.22664866266567227 0.07057433868747869 0.27093617778834805 0.1023839561906562 0.28085123116640637 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8570485959912651 0.8443153052485926 0.05106182210173792 0.14230640330310712 0.10103728991596637 0.060850806141782336 0.045682854422899107 0.04400390298876991 0.24532692570439807 0.19486062035868584 0.20262844628012208 0.2767136017617963 0.022328136712315858 0.02785057151187969 0.16695860221549316 0.15803656611767436 0.1479509290299304 0.13919532694684297 0.03490375394109145 0.04288988012829471 0.25725254014836185 0.23628768137982376 0.24765698989792695 0.24652666338778215 0.020274974715781064 0.02311597435486014 0.1362927365024434 0.14269321018391956 0.13830195539754364 0.13919532694684297 );
}

}
