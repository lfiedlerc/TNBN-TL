// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/200pct aux/refinement/partition1_model.elv" {

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
states = ("Default" "[49-62]" "[22-49]" "[7-22]");
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
states = ("Default" "[26-48]" "[4-26]");
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
values= table (0.6414738985419632 0.07419730237339567 0.06457923566635446 0.22812841592234506 0.18483022621749723 0.4673310267923768 0.10688976937879359 0.22812841592234506 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8356095788832664 0.8462912424441951 0.05124894424435185 0.1474805324159315 0.10631894262907778 0.0729392485937331 0.834729465710633 0.8461789589621762 0.04982236077339702 0.14698651826348536 0.10615124320539002 0.0723626112888604 0.8331055319042494 0.8430156210983788 0.05142886040683786 0.1476376348072111 0.10498506591383472 0.0719853138577265 0.01686055601197268 0.02479173508964596 0.11376426686662748 0.1342364907521876 0.11560053478429838 0.10758482794097418 0.018888061061641943 0.021298297989852527 0.12038449727757866 0.10977117191247375 0.12198928442606341 0.1262980482282772 0.013175879060190835 0.02834440174612605 0.1099480184528438 0.1018406981788787 0.12235647200165298 0.11381312188537317 0.14542229560326436 0.1264378489571944 0.8328402932877634 0.7159279506783337 0.7758574353792334 0.8171868845729314 0.14402146559501983 0.1301562654935432 0.8276434187833532 0.7409554104091977 0.7696414853789818 0.7991617879272024 0.1515226091921946 0.1264596385596393 0.8364672776412431 0.7483077387926302 0.770392601491889 0.8120128503744893 );
}

}
