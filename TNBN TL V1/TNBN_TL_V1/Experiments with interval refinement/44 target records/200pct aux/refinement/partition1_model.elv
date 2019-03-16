// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/200pct aux/refinement/partition1_model.elv" {

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
states = ("Default" "[40-55]" "[17-40]" "[4-17]");
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
states = ("Default" "[20-34]" "[6-20]");
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
values= table (0.24544037787877265 0.4123895393531141 0.3421700827681133 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8128079562421787 0.6079653933822686 0.0961253450081413 0.1871920437578213 0.3920346066177314 0.9038746549918586 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.33173939031679617 0.2706288322556105 0.12339783032620835 0.5592946802151822 0.1281065043742868 0.499891137658797 0.10896592946802151 0.6012646633701028 0.3767110320149946 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6257719987508454 0.10043583535654513 0.7145468729029151 0.07861473510847859 0.6588930478135573 0.06979913522065234 0.10435203880986041 0.30165025880259566 0.06684661837083634 0.2803439662557536 0.09616313013766736 0.238375173440565 0.13133963505378982 0.32319670585992394 0.10839992168243733 0.33748413772189445 0.12519350904715185 0.3494974347436855 0.09175782722936 0.16518942743951667 0.08129994126182799 0.20177623048980992 0.06894714991002565 0.21328304992050554 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8271880927899369 0.8080689891209363 0.0391207645829768 0.1616624404898655 0.10396225217871559 0.07096963696918404 0.048313006316791834 0.06274667663354007 0.28970329007891527 0.25850237381040553 0.25139335610216396 0.25516888114192626 0.0650367392726044 0.0498282432089877 0.304098484616998 0.2836345490419727 0.30705902781050026 0.31446869154814855 );
}

}
