// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/300pct aux/no refinement/partition0_model.elv" {

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
states = ("Default" "[48-73]" "[30-48]" "[14-30]" "[0-14]");
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
states = ("Default" "[31-52]" "[18-31]" "[9-18]" "[0-9]");
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
values= table (0.24181581238188318 0.3774680546123941 0.3807161330057227 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8174366370116937 0.6178891647995546 0.0920997274293188 0.18256336298830633 0.3821108352004454 0.9079002725706812 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.18229075532225136 0.2963078935369961 0.0998343366599524 0.74001312335958 0.14309417464564256 0.4534558259705183 0.07769612131816858 0.5605979318173614 0.44670983736952935 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6147467633546125 0.10992787276015124 0.6678724640341434 0.07754329109385605 0.3576250753465943 0.08371782040463725 0.09723468182101898 0.2115619349005425 0.10587110817296953 0.25098350313001433 0.1315702230259192 0.1999885260614388 0.08553948686400309 0.23976841196777904 0.08396520174913338 0.18543020110859085 0.19156118143459913 0.22528014734983706 0.10560166005738857 0.2510736889692586 0.06954193737840589 0.2162209514295598 0.166500904159132 0.21388879363437382 0.09687740790297683 0.18766809140226862 0.07274928866534795 0.2698220532379789 0.15274261603375527 0.27712471254971305 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8071652148393411 0.781759721868974 0.06601393397959565 0.17694428670241955 0.12244120035044365 0.08133362931206037 0.030831362357613988 0.029759173753201754 0.10884826552509859 0.14255072688970039 0.12688377473249923 0.10344599361608856 0.056646664471475684 0.0607021317802532 0.23440469876048803 0.19954816774533313 0.21308018812761884 0.20707113367423163 0.04279547167061715 0.0529381566249737 0.25383651586709655 0.19226509896843938 0.2079377105669255 0.23123487209825486 0.062561286660952 0.07484081597259727 0.3368965858677212 0.2886917196941075 0.32965712622251275 0.37691437129936467 );
}

}
