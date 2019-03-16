// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/100pct aux/refinement/partition4_model.elv" {

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
states = ("Default" "[39-59]" "[18-39]" "[0-18]");
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
states = ("Default" "[24-40]" "[5-24]");
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
values= table (0.2672487927018892 0.38058340289138326 0.35216780440672757 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8015843857191816 0.627948504447984 0.08064569028295422 0.19841561428081844 0.372051495552016 0.9193543097170458 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.27245484358455074 0.2012306177701206 0.06498638507006707 0.6537065783927708 0.15113216834851093 0.3768014876801488 0.07383857802267846 0.6476372138813684 0.5582121272497842 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6851851851851852 0.1111111111111111 0.07407407407407407 0.05555555555555555 0.12962962962962962 0.2222222222222222 0.1111111111111111 0.6111111111111112 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8089537187884547 0.8073776657750168 0.08834425605258939 0.19068589814405656 0.12879056522673546 0.11215002299528815 0.7706884126660056 0.8034385901447648 0.0688637365720699 0.19068589814405656 0.11390961284578306 0.08919083932181875 0.7260455555231485 0.7513552568114314 0.09727282748116081 0.199614469572628 0.13516811624714362 0.09786430870957386 0.0716423554543295 0.06732431099125627 0.33445358653691987 0.21713305171744826 0.24429790335910098 0.3067118102379914 0.07767005377441745 0.06675670523385345 0.2869198951260482 0.22789997990178454 0.2893723171031013 0.2604878270184148 0.08527058867822529 0.06814707776279286 0.3128974661718686 0.2081720213667604 0.24760746879231155 0.261852506815909 0.07347933892751743 0.07667490974004186 0.39379212608379277 0.4360605914656192 0.4185397903137539 0.3981872624142344 0.09986149770996529 0.096426352004455 0.4439138000063388 0.46477239995718256 0.3954155885880887 0.42216992654708596 0.1251844812510116 0.11419240057549074 0.41360009896281474 0.43249532025335574 0.4288274278359599 0.423268435675031 );
}

}
