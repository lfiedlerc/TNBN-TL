// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/300pct aux/refinement/partition4_model.elv" {

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
states = ("Default" "[57-64]" "[43-57]" "[29-43]" "[0-29]");
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
states = ("Default" "[43-50]" "[31-43]" "[20-31]" "[0-20]");
}

// Links of the associated graph:

link Colision Pupilas_Dilatadas;

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Colision;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7333333333333334 0.6363636363636365 0.09090909090909091 0.39999999999999997 0.26315789473684204 0.057142857142857134 0.2 0.2272727272727273 0.8636363636363636 0.39999999999999997 0.15789473684210523 0.3142857142857143 0.06666666666666667 0.13636363636363638 0.045454545454545456 0.19999999999999998 0.5789473684210525 0.6285714285714286 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4468533774868226 0.5531466225131774 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2507750084343814 0.34780722308646195 0.40141776847915667 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.630938123583378 0.0990257615234092 0.6772153334943083 0.09372688692733473 0.5241778520738206 0.06335102597758425 0.04846267064056652 0.08481975048419788 0.024208849987926877 0.08030268090517287 0.04979534106204203 0.08445195667415223 0.06337426160689469 0.21110693453844803 0.07262654996378065 0.1759011105541882 0.09590213834171057 0.1650651880449339 0.09692534128113305 0.27142320154943317 0.08069616662642293 0.19502079648399126 0.12725476049188517 0.24183969411234502 0.15843565401723672 0.33173946856041836 0.1432356957619007 0.4531365565363326 0.20102563613935487 0.4433727725392992 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8478213410141232 0.8305870736936829 0.06899468990074532 0.17057852475681964 0.1180547368749193 0.08240509970010258 0.005636246629106547 0.009411829239239838 0.045548204995071166 0.03071931389789556 0.03951689570010545 0.047242509718410555 0.013151242134581945 0.013176560934935775 0.03279470759645124 0.07589477551244787 0.06107156608198115 0.04360847050930205 0.03569622865100813 0.030117853565567485 0.18583667637989035 0.1391404217728211 0.18501092077776643 0.17625090164176246 0.0958161926948113 0.11482431671872602 0.6650037929280391 0.5818599455954336 0.5945496580334048 0.648675998825868 );
}

}
