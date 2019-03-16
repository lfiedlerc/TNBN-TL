// Bayesian Network 
//   Elvira format 

bnet "data files/modelIteration1.elv" {

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
states = ("Default" "[50-67]" "[23-50]" "[0-23]");
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
states = ("Default" "[26-47]" "[0-26]");
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
values= table (0.633449880056421 0.103074301552109 0.6796627628127933 0.092240286352997 0.5156039806686644 0.06524472317861194 0.08847761515879493 0.19747129574881553 0.07822188349920166 0.20089764154482853 0.09983734749577146 0.17619395098815846 0.1336192555459352 0.45769047986641354 0.14526921221280306 0.3534310360510872 0.2107677336021842 0.39133603851054144 0.14264758362336324 0.2399183967041684 0.09498371567760198 0.35157087270344994 0.17194209846493974 0.36537061415439176 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8442849803798755 0.8243889471745083 0.06868826490115584 0.17506640988870445 0.12069462426885567 0.08381784797631525 0.027806253503593656 0.030876668628657882 0.11802762583430897 0.143062807294076 0.14471900975575086 0.12350946516214664 0.1260550158829579 0.14280459240754273 0.8114399276108741 0.6800128242809327 0.7327544797759536 0.7908292620083719 );
}

}
