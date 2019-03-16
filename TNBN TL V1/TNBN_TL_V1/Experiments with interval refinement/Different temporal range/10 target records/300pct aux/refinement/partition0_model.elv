// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/300pct aux/refinement/partition0_model.elv" {

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
states = ("Default" "[38-53]" "[30-38]" "[22-30]" "[0-22]");
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
states = ("Default" "[23-38]" "[0-23]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Colision;

link Heridas_Internas Signos_Vitales;

link Pupilas_Dilatadas Herida_Cabeza;

//Network Relationships:

relation Colision Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.25 0.5 0.2222222222222222 0.5 0.3333333333333333 0.6666666666666666 0.25 0.16666666666666666 0.1111111111111111 );
}

relation Herida_Cabeza Colision Pupilas_Dilatadas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8422200930007382 0.8172200930007383 0.8172200930007383 0.8172200930007383 0.8338867596674049 0.6168174377585031 0.5834841044251697 0.5834841044251697 0.6001507710918365 0.5668174377585031 0.11665877902740295 0.11665877902740295 0.11665877902740295 0.11665877902740295 0.11665877902740295 0.15777990699926178 0.18277990699926178 0.18277990699926178 0.18277990699926178 0.1661132403325951 0.38318256224149694 0.41651589557483026 0.41651589557483026 0.3998492289081636 0.433182562241497 0.883341220972597 0.883341220972597 0.883341220972597 0.883341220972597 0.883341220972597 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2564042263395706 0.32606713958743944 0.41752863407299 );
}

relation Pupilas_Dilatadas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.42227417531601236 0.4625870655726814 0.37738289939783165 0.2208432051544295 0.13747772741163966 0.16141924830426585 0.15017337950501206 0.09284210162863976 0.09578724624648745 0.06890308000818202 0.05713360100223985 0.0851442188857666 0.13603941437512856 0.24817407935347938 0.27849254927219497 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8311287550426736 0.8348706753945156 0.06280052093694531 0.16269442170707976 0.10418884181895535 0.06757052702378899 0.020639818828117676 0.029487379393836492 0.12848702535541878 0.1231331732783706 0.1005889647957529 0.12268808854950145 0.14635507896301622 0.13367611991872544 0.8068229386288797 0.7122780485025746 0.7933242883891454 0.8078538753721018 );
}

}
