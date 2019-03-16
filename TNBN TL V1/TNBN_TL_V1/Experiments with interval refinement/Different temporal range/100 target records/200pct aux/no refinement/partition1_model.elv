// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/200pct aux/no refinement/partition1_model.elv" {

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
states = ("Default" "[46-72]" "[28-46]" "[13-28]" "[0-13]");
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
states = ("Default" "[31-52]" "[17-31]" "[8-17]" "[0-8]");
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
values= table (0.23488099962182768 0.3757343514223802 0.3893846489557921 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8043247488998055 0.6115388295018509 0.07798769963947944 0.19567525110019443 0.38846117049814916 0.9220123003605205 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2336271824717563 0.31886864884744054 0.12036581364829398 0.7005717220130092 0.1339124719030198 0.43838685203412076 0.06580109551523453 0.5472188792495396 0.4412473343175853 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6036269308062086 0.10744771402999252 0.6695731443062521 0.09022675199259991 0.33721691208128823 0.06065234421416106 0.10104744321685377 0.19785211975085396 0.10446699581070973 0.26135692510076386 0.19246103504693018 0.2052396113406172 0.09563683359100113 0.3027378669150821 0.08334118604159144 0.1883459491232584 0.20076638250236808 0.2587983647840269 0.08554154837883204 0.22498164282974412 0.0699229620036583 0.2339194433694888 0.128674761043658 0.21758688505486462 0.11414724400710446 0.1669806564743274 0.07269571183778843 0.226150930413889 0.14088090932575562 0.2577227946063302 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8034449767441031 0.7735104982664895 0.08126638945553047 0.20720763604040882 0.1350567971048754 0.07763090599532972 0.02959128299253462 0.04431662716935082 0.11734520879856254 0.12419213945647303 0.11215073020844583 0.11024891534551763 0.06961477711327363 0.05306366833398905 0.2532975644522197 0.1772333908762902 0.25239143609730025 0.252720949381509 0.04587293592391595 0.07026836471261162 0.2718464930994366 0.22348558486130057 0.2003145841061546 0.20154936391611944 0.0514760272261727 0.05884084151755892 0.27624434419425087 0.2678812487655274 0.300086452483224 0.3578498653615243 );
}

}
