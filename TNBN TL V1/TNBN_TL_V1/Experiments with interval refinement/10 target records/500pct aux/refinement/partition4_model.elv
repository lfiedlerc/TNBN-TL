// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/500pct aux/refinement/partition4_model.elv" {

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
states = ("Default" "[31-41]" "[12-31]" "[4-12]");
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
values= table (0.2675908872624527 0.4210114747175874 0.3113976380199599 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8262691434578031 0.5326999124030638 0.1474676848621091 0.1737308565421969 0.4673000875969363 0.852532315137891 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.27490020680036553 0.19538474817305237 0.1793894976391639 0.6022579714326937 0.12569358246130322 0.42409396754858303 0.12284182176694079 0.6789216693656442 0.396516534812253 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6398976371066298 0.08151716224302988 0.6954565273293856 0.07735125982602292 0.6468438899667482 0.06582061540832537 0.15562212667753686 0.44396332862225363 0.14041824787806775 0.40467050007630573 0.15212878586047768 0.4067910229628487 0.15924124590259586 0.3325231408709187 0.12035849818120091 0.37589393118199066 0.1376403300642417 0.3923913407340753 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.858031410714419 0.8653608914931714 0.06568578296757005 0.16328634945881185 0.11052388841937492 0.05917118899827124 0.023361919755855096 0.022755905663125957 0.201236908283908 0.178139035276511 0.19008965287811747 0.21186602995840456 0.05750626401441255 0.06826771698937788 0.40067705845813817 0.3490805337741731 0.36583291685977326 0.371663289842286 0.03414434425855745 0.03413385849468894 0.18147256907745274 0.18173780366593548 0.199056145938406 0.18313843267590904 );
}

}
