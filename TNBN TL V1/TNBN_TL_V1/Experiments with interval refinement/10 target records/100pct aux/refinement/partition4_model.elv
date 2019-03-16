// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/100pct aux/refinement/partition4_model.elv" {

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
states = ("Default" "[40-59]" "[21-40]" "[0-21]");
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
states = ("Default" "[37-42]" "[28-37]" "[18-28]" "[4-18]");
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
values= table (0.26993736626424913 0.4176259719727872 0.31243666176296353 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8090843857191816 0.5429668194662991 0.14635997599723993 0.19091561428081846 0.4570331805337009 0.8536400240027601 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.25242187794489046 0.2177578144228402 0.1788404064554692 0.6236571299332805 0.1180777750430716 0.402510460251046 0.12392099212182892 0.6641644105340881 0.41864913329348474 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5555555555555556 0.1111111111111111 0.1111111111111111 0.1111111111111111 0.2222222222222222 0.1111111111111111 0.1111111111111111 0.6666666666666666 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8219864400435553 0.8363365868914787 0.06741873096039763 0.1899086823748501 0.10517427312640078 0.09591392256228251 0.8193078686149838 0.831872301177193 0.0659306357223024 0.1899086823748501 0.10517427312640078 0.09655167766432332 0.8193078686149838 0.831872301177193 0.06741873096039763 0.1899086823748501 0.10428141598354364 0.09502106541942537 0.028927203492922278 0.034007981944627806 0.13263378048563232 0.07117081343476768 0.12038014262873531 0.10599629873407723 0.017416109049158187 0.026983457835759145 0.09177537421942443 0.07402923268114946 0.09730965351344105 0.11757204194779353 0.02409228418466882 0.0280212831371345 0.1144910040115583 0.07251456807386251 0.10773973534160206 0.10241101107262851 0.042278220489655634 0.027631485330010086 0.2093126848288885 0.1507146637442139 0.17655754252214512 0.19952244467591007 0.050071313516329784 0.04773996386326618 0.20598472880359706 0.16709455376602309 0.1903884525262977 0.20420407285669404 0.03613842627700324 0.040030404481620714 0.2456352449702524 0.14502913614772503 0.1964665762111567 0.2173621459500687 0.042278220489655634 0.036133480816167046 0.19480586508827247 0.18211355202425847 0.20665257817932894 0.20783587987073968 0.04789429988518501 0.026983457835759145 0.22026089812661862 0.16497943283227595 0.2453895610338948 0.1856400662333582 0.05782148204320518 0.03402584380937761 0.1748589879449254 0.19475341139837363 0.2091418391925216 0.16720165073082208 0.06230474598475567 0.06376496614617713 0.393756535816721 0.4039990292032401 0.38922912783291086 0.3886530953582832 0.06313339530319842 0.0643451686852718 0.41400891036762577 0.4018729774119542 0.35962263254967347 0.393969473895238 0.060230710461672055 0.06404864717059314 0.3955143774944742 0.39572235720307836 0.38025788944094846 0.4159141061929199 );
}

}
