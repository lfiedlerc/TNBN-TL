// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/100pct aux/refinement/partition1_model.elv" {

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
states = ("Default" "[44-54]" "[20-44]" "[7-20]");
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
states = ("Default" "[35-41]" "[23-35]" "[11-23]" "[4-11]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.26993736626424913 0.448395202742018 0.28166743099373276 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8090843857191816 0.6715382480377277 0.17969330933057326 0.19091561428081846 0.32846175196227234 0.8203066906694267 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3626031889630216 0.2820302458500834 0.21189479976090855 0.5134758189151495 0.10889599912489402 0.303347280334728 0.12392099212182893 0.6090737550250225 0.48475791990436345 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6713240443396324 0.08812960657278188 0.06884428800994186 0.23682070897260277 0.19098737964048385 0.4470820860978108 0.06662350452575018 0.22575432070285498 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8237721543292695 0.8345508726057644 0.06741873096039763 0.1899086823748501 0.10517427312640078 0.09591392256228251 0.8219864400435553 0.831872301177193 0.06518658810325477 0.1899086823748501 0.10517427312640078 0.09502106541942537 0.8193078686149838 0.831872301177193 0.06741873096039763 0.1899086823748501 0.10517427312640078 0.09502106541942537 0.018797636871544583 0.026933578878131373 0.15684321342938765 0.09493257628419725 0.12540313036945927 0.1325703142396653 0.03350843481533078 0.017243866545928924 0.13619798054124765 0.09048892377727737 0.1281478818732562 0.12080515051778164 0.02139775240085718 0.03192298078914056 0.16346368311255952 0.08977816148938517 0.13146728688664253 0.11758426992230205 0.06579172905040603 0.04809567656809174 0.2691768662909761 0.1856459269557635 0.26781007502630283 0.27600704767930323 0.048168375047038 0.04742063300130453 0.28890480720870715 0.20036833122111417 0.27397133366006493 0.27552051872476513 0.06657078524711121 0.04894857054334887 0.2640567188741346 0.20043496518560408 0.24597105288468604 0.2750632028539565 0.054043206005690674 0.0500195036308154 0.3115669239745944 0.35019572584837205 0.3251979482462249 0.2803536153592922 0.06073403810278703 0.06681998286547457 0.3177952879295779 0.34041071325737676 0.33141693587911086 0.2967144047805163 0.061815729158031844 0.04469217310479679 0.31435323675492216 0.2902131266749893 0.31594557655015704 0.31285814675755363 0.035245569134146094 0.03847654125447339 0.1928747624604632 0.17720747573050152 0.17428909644568916 0.2129818163194623 0.03350843481533078 0.03448773309185785 0.18985173045143613 0.17666885118420822 0.1590801292219732 0.2098194719519365 0.02853033653447624 0.04043577566624472 0.18861194205295329 0.22757720005448798 0.19932137044103868 0.19737359594100698 );
}

}
