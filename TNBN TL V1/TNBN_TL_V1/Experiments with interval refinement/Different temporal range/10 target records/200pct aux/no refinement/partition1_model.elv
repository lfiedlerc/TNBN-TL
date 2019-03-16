// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/200pct aux/no refinement/partition1_model.elv" {

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
states = ("Default" "[49-72]" "[32-49]" "[17-32]" "[0-17]");
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
states = ("Default" "[29-52]" "[14-29]" "[6-14]" "[0-6]");
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
values= table (0.26646959329921727 0.39808277949436954 0.33544762720641325 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8625817948222527 0.6423414925025743 0.1136395670547806 0.13741820517774733 0.35765850749742567 0.8863604329452194 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.1961764943131403 0.3169015854734254 0.14473430881786678 0.7286305826678496 0.13721040772581228 0.43561341681873733 0.07519292301900998 0.5458880068007624 0.4196522743633959 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6653068740334177 0.0791666291626961 0.07641750488157835 0.23980230374348036 0.08512890286865078 0.2417486960714449 0.0835932251622929 0.19616165109491096 0.08955349305406027 0.2431207199274677 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7762100393104382 0.7671455374110221 0.12645564888051541 0.16468354430379745 0.1854808482656584 0.12532709286246146 0.7383622622202699 0.7571415558043763 0.05340557261075366 0.14501917489180882 0.17900959799693977 0.0999167521952332 0.6117791069689804 0.5527305605786619 0.15116255829447034 0.18324059378689622 0.11771589166261423 0.09298462869049023 0.04727713763607643 0.044355090668985735 0.12983135462151954 0.20632911392405062 0.18889363800756206 0.18207850228699074 0.04146796422525647 0.0491215151917712 0.12160188027718202 0.14281224281851312 0.15203088051189317 0.16547953016307446 0.08603839198775907 0.1057142857142857 0.17604596935376415 0.10757578602681866 0.12153106448212464 0.1207837631119425 0.0693536738967639 0.06899684349534577 0.3418735424047444 0.25658227848101267 0.21331579812592474 0.2733517710881821 0.08889389503038377 0.07643254322205986 0.39866277901603187 0.2680279253606839 0.2820336625399917 0.3038556277796784 0.11057587981638614 0.13229656419529834 0.29836442371752164 0.2538047479286653 0.32484077714702075 0.31346307058938866 0.0509505580252936 0.054910216768125755 0.20405299489724643 0.19506329113924054 0.24369554496136778 0.22648016168492713 0.06244425473924649 0.05590230201355019 0.19992392914382906 0.19271007003734208 0.20441090555014607 0.27042878321359337 0.10556822923911531 0.09893309222423145 0.15491005996002666 0.24410349342394644 0.23556876523437853 0.2674648411588223 0.05620859113142797 0.06459231165652077 0.19778645919597426 0.17734177215189872 0.1686141706394871 0.19276247207743857 0.0688316237848434 0.061402083768242466 0.22640583895220343 0.2514305868916521 0.18251495340102936 0.16031930664842056 0.08603839198775907 0.1103254972875226 0.2195169886742172 0.2112753788336733 0.20034350147386187 0.2053036964493564 );
}

}
