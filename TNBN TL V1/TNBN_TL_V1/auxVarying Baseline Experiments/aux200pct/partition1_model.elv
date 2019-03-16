// Bayesian Network
//   Elvira format 

bnet  "auxVarying Baseline Experiments/aux200pct/partition1_model.elv" { 

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
pos_x =386;
pos_y =76;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Leve" "Moderado" "Severo");
}

node Herida_Cabeza(finite-states) {
title = "Herida Cabeza";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =240;
pos_y =125;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =536;
pos_y =121;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =232;
pos_y =202;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[35-77]" "[13-35]" "[0-13]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =535;
pos_y =203;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[20-65]" "[0-20]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

link Pupilas_Dilatadas Signos_Vitales;

//Network Relationships: 

relation Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.21847342651688845 0.40330694483687196 0.3782196286462397 );
}

relation Herida_Cabeza Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8783874905314375 0.6009665086424926 0.12132529158012462 0.1216125094685625 0.39903349135750743 0.8786747084198754 );
}

relation Heridas_Internas Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3684385151802694 0.2080004335593038 0.10177661553615737 0.5808505414604546 0.151178011294681 0.3934906048901271 0.05071094335927612 0.6408215551460152 0.5047327795737155 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6968975005690312 0.11622012251288927 0.09084594734754431 0.0856509330035726 0.097799946252706 0.2191454194795121 0.11445660583071846 0.5789835250040261 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas Pupilas_Dilatadas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8103113072373636 0.6388827358087922 0.5855494024754588 0.7722160691421255 0.7444594040516134 0.7490571052010386 0.7490571052010386 0.7109618671058006 0.2777429729894519 0.35350054874702763 0.31064340588988476 0.4135005487470277 0.3930262084523862 0.45969287511905293 0.40969287511905295 0.3930262084523862 0.24553388993986064 0.178867223273194 0.16934341374938444 0.17620055660652734 0.18201903148851684 0.15916188863137393 0.13059046005994537 0.1430446725141578 0.06923843058350101 0.16447652582159628 0.19114319248826295 0.09780985915492958 0.09490794242110986 0.10640219529467307 0.10640219529467307 0.09687838577086356 0.20675111273702823 0.30978141576733126 0.2812099871959027 0.18978141576733126 0.23324345235467137 0.19991011902133804 0.19991011902133804 0.1332434523546714 0.2732726369289937 0.2732726369289937 0.19708216073851748 0.15593930359566033 0.20339864273677405 0.1805414998796312 0.20911292845105978 0.16442428376241508 0.12045026217913542 0.19664073836961163 0.22330740503627833 0.12997407170294498 0.16063265352727682 0.14454069950428827 0.14454069950428827 0.19215974712333592 0.5155059142735199 0.3367180354856411 0.40814660691421256 0.3967180354856411 0.3737303391929424 0.3403970058596091 0.3903970058596091 0.4737303391929425 0.4811934731311457 0.5478601397978123 0.6335744255120981 0.6678601397978124 0.6145823257747092 0.6602966114889949 0.6602966114889949 0.6925310437234271 );
}

}
