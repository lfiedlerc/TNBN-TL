// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/300pct aux/refinement/partition0_model.elv" {

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
values= table (0.2744609101917855 0.372017981456849 0.3535211083513656 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8976320144523862 0.6422698901726674 0.08614802179315498 0.10236798554761381 0.35773010982733255 0.913851978206845 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.15172244052721365 0.23983708208617505 0.11267569732569417 0.7947817563037335 0.2000095273633816 0.43205297548333615 0.053495803169052926 0.5601533905504434 0.45527132719096974 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6502332613226467 0.08457288381513768 0.709617397831442 0.08663690382987722 0.623910006766908 0.07423688438471258 0.10486722685658528 0.3412344805850383 0.0966210447287152 0.25652595008713647 0.13075530230684562 0.26332081463833756 0.18147681773385116 0.4347458526684382 0.13765901533929853 0.49344482118672106 0.18669700380925894 0.481926773960731 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8253700854452733 0.8391849280057824 0.053036325004139996 0.14534842598127118 0.0973580182072829 0.06000006868081409 0.0662714244083585 0.05427869575388315 0.34404075962079805 0.29201869523716856 0.27289176193733305 0.30600717188628174 0.07443757149185291 0.07766472956273705 0.42408984725534016 0.4326769149325586 0.4521283629730962 0.43956831320681355 );
}

}
