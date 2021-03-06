// Bayesian Network
//   Elvira format 

bnet  "data files/CollisionModel_AuxFixed100pct_TargetVarying100.0pct.elv" { 

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
pos_x =264;
pos_y =164;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =548;
pos_y =158;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =276;
pos_y =267;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[44.0-124.0]" "[15.0-44.0]" "[0.0-15.0]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =506;
pos_y =269;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[40.0-97.0]" "[0.0-40.0]");
}

// Links of the associated graph:

link Colision Signos_Vitales;

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Heridas_Internas Colision;

link Heridas_Internas Signos_Vitales;

//Network Relationships: 

relation Colision Herida_Cabeza Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2762665971211583 0.30308311036617286 0.054730443721517495 0.08658039310381287 0.053368232596472415 0.03464792701391067 0.41532950451963974 0.36326198602460136 0.598685391016623 0.45815468026953826 0.3459499539657547 0.41674757549034036 0.30840389835920196 0.3336549036092258 0.3465841652618596 0.45526492662664897 0.6006818134377729 0.5486044974957489 );
}

relation Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4970877698888031 0.5029122301111969 );
}

relation Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.23039858062301624 0.40455776388150283 0.36504365549548096 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6218111692411604 0.5346626009045596 0.15215835183906853 0.13688793304592245 0.10691592596989168 0.1148103828320628 0.11911455294987927 0.21363908321745517 );
}

relation Signos_Vitales Colision Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6533230216815911 0.6860146026931054 0.47313214838891043 0.7239838384183038 0.6801658590856526 0.7303862370199619 0.4549883242294513 0.5798128702386407 0.5998209460537244 0.17919975879154537 0.1418890281154887 0.2652044754046566 0.13255272636271956 0.16810782448771944 0.14483973788552834 0.2507487407514514 0.19142469224562678 0.18842020199499124 0.1674772195268635 0.17209636919140595 0.2616633762064331 0.14346343521897664 0.15172631642662787 0.12477402509450976 0.2942629350190973 0.2287624375157325 0.21175885195128438 );
}

}
