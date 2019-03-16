// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/500pct aux/no refinement/partition2_model.elv" {

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
states = ("Default" "[53-71]" "[37-53]" "[20-37]" "[0-20]");
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
states = ("Default" "[32-50]" "[18-32]" "[9-18]" "[0-9]");
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
values= table (0.23235124581756872 0.3709504493317111 0.39669830485072016 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8050743889131466 0.6002671869049321 0.08724467030143997 0.19492561108685338 0.399732813095068 0.9127553296985601 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.18240165631469982 0.332803394896686 0.09553035982008994 0.7299654934437543 0.16015452538631347 0.5081605402655814 0.0876328502415459 0.5070420797170005 0.39630909991432844 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6212734064740153 0.11265285769083237 0.6578428736374091 0.08583923415250588 0.3510718216840947 0.07488567094335541 0.07711991753426001 0.1165469888761028 0.0875484664960812 0.1796534342414594 0.12371629058888275 0.1507098793664449 0.09115538546032802 0.3154921365554277 0.08510325611407124 0.19944559362358538 0.1896780407264722 0.2039066709690047 0.09682054009555591 0.28635596471039504 0.07080866927117632 0.2101390781308464 0.12005090809025866 0.2263578659161647 0.11363075043584075 0.16895205216724204 0.09869673448126212 0.3249226598516029 0.21548293891029172 0.3441399128050304 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7998614527804956 0.780939508152209 0.09869232889129753 0.18554792021169406 0.14147712277836283 0.0983374719883714 0.031552188322255335 0.030603690151407403 0.09666393607326604 0.1125088017826868 0.10141459242225612 0.09360244685361276 0.0509090522866664 0.062990587140068 0.25484632894296266 0.20719131904974203 0.2665106015344609 0.2365937859608746 0.04937478934685962 0.04275558888558462 0.2516202459116513 0.19413511446402298 0.19191429369667534 0.24485131124704743 0.06830251726372312 0.08271062567073093 0.2981771601808224 0.3006168444918541 0.2986833895682448 0.32661498395009386 );
}

}
