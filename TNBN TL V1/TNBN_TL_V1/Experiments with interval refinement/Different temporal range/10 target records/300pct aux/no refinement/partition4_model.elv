// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/300pct aux/no refinement/partition4_model.elv" {

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
states = ("Default" "[52-71]" "[36-52]" "[19-36]" "[0-19]");
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
states = ("Default" "[30-50]" "[14-30]" "[6-14]" "[0-6]");
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
values= table (0.24623371089018256 0.4062472491850261 0.34751903992479144 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8472200930007383 0.5930079139489792 0.09165877902740295 0.1527799069992618 0.4069920860510208 0.9083412209725971 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.195691237938982 0.27666131910366837 0.1427409546974764 0.7171422711824681 0.14240717545725953 0.45039851452894925 0.08716649087854995 0.5809315054390721 0.4068605307735742 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6348486640804506 0.10180289784513781 0.692294965717502 0.07549567529279402 0.5535123922986916 0.08085586743373865 0.07057286300071114 0.2062120041488506 0.07411257096552926 0.17549930310079007 0.0978879906392937 0.17083387056647867 0.08899585789648172 0.22787805342703527 0.07685055479211778 0.2191881503884085 0.10660780768003404 0.23521328353780127 0.0971833489460133 0.2528065598408196 0.07492062875006444 0.23815739177890882 0.13737847037549197 0.22864824151217747 0.10839926607634323 0.2113004847381567 0.08182127977478651 0.2916594794390986 0.10461333900648868 0.2844487369498041 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7779339924668611 0.7820712979910859 0.07875312722736744 0.19602987765976843 0.13702071000530644 0.09306646028201523 0.023592116458534516 0.03763272324856552 0.09648626802201522 0.11886248240704717 0.09926924542892526 0.10658942439641522 0.08117940907627771 0.06984316841832468 0.3805635601360195 0.269751567934809 0.30079798863146184 0.3396658517466759 0.06067669881055362 0.06067119510039831 0.21730926814141402 0.20368515715144542 0.21582326685735786 0.26319214915487277 0.05661778318777307 0.049781615241625575 0.2268877764731838 0.21167091484693001 0.2470887890769485 0.19748611442002081 );
}

}
