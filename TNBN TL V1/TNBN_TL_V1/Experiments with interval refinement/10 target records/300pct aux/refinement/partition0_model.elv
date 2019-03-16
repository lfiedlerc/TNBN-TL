// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/300pct aux/refinement/partition0_model.elv" {

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
states = ("Default" "[29-54]" "[4-29]");
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
states = ("Default" "[32-42]" "[14-32]" "[4-14]");
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
values= table (0.26987825880062344 0.49051225314261004 0.23960948805676655 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8426320144523862 0.45615877906155633 0.24170357734871056 0.15736798554761383 0.5438412209384437 0.7582964226512895 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.1452411869379118 0.2553920907004994 0.2634501229294525 0.619787909392584 0.176677014441895 0.3740628117895829 0.23497090366950418 0.5679308948576055 0.36248706528096464 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6550578707052647 0.07355291173155855 0.7022846874088785 0.07306636155895081 0.6348088186830098 0.07026155860328578 0.14069195971234286 0.49476923351970536 0.1413880964814466 0.40532582039357706 0.18128666169320126 0.38989031413410596 0.14994800969341804 0.31877749273752826 0.11150985722498995 0.41030933457874397 0.13809200583850348 0.39655510582870607 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8513088000728978 0.8401486385819259 0.05180586972078554 0.14498497473167854 0.10014443277310923 0.06010675852273472 0.037172799981775556 0.03631685670857855 0.24639453206180306 0.16701906407571157 0.1902920375139303 0.19202119987169936 0.05455576400203031 0.06233917135803248 0.3517494354261602 0.349360978066626 0.35800705362790275 0.3234041260997042 0.03744023019747178 0.04232200624306792 0.24469525942689405 0.2451655986432463 0.2386713690852685 0.26445024894611224 );
}

}
