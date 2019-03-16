// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/300pct aux/refinement/partition2_model.elv" {

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
states = ("Default" "[40-50]" "[20-40]" "[0-20]");
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
states = ("Default" "[26-46]" "[0-26]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

link Pupilas_Dilatadas Herida_Cabeza;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.23854140319787487 0.4062472491850261 0.3552113476170991 );
}

relation Herida_Cabeza Colision Pupilas_Dilatadas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8338867596674049 0.8172200930007383 0.8338867596674049 0.8172200930007383 0.6001507710918365 0.6001507710918365 0.6168174377585031 0.5751507710918364 0.11665877902740295 0.11665877902740295 0.11665877902740295 0.08665877902740295 0.1661132403325951 0.18277990699926178 0.1661132403325951 0.18277990699926178 0.3998492289081636 0.3998492289081636 0.38318256224149694 0.4248492289081636 0.883341220972597 0.883341220972597 0.883341220972597 0.9133412209725971 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.21204734559943747 0.33799672283037646 0.13456290086724867 0.6435397867104182 0.14240717545725953 0.43404240686849377 0.14441286769014414 0.519596101712364 0.4313946922642574 );
}

relation Pupilas_Dilatadas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4224210996589355 0.46291552311770473 0.3772551956478404 0.18940087316379062 0.10968626640553919 0.11897214172697977 0.24753381443188477 0.19289653747181026 0.21935488630911892 0.13876895657545057 0.23261053048071242 0.28255883660157693 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8314476325936941 0.8349533070059524 0.06276506895291965 0.1624020432841916 0.1040776522090982 0.06751579210282557 0.014982432658338301 0.023029771115448506 0.07453160485463858 0.10933247665095727 0.10486154789339096 0.09507682119735895 0.15169713066567528 0.14009777428564507 0.8608400360710757 0.7264123872402585 0.7892211236186794 0.8355789862921739 );
}

}
