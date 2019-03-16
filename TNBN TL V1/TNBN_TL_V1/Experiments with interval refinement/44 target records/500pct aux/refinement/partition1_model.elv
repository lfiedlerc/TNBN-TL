// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/500pct aux/refinement/partition1_model.elv" {

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
states = ("Default" "[41-54]" "[15-41]" "[6-15]");
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
values= table (0.24664162375999776 0.4066088560596496 0.3467495201803527 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8447306819193415 0.6088903885935399 0.09746768486210908 0.15526931808065841 0.3911096114064601 0.902532315137891 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.33786095595358334 0.2629960072069056 0.1249469674890285 0.5550374095677805 0.1332059445761758 0.5096465149273671 0.10710163447863637 0.6037980482169186 0.36540651758360426 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6111192229399574 0.08814580717044106 0.6895924644263329 0.08459613948417544 0.6352542615707942 0.06367460920322342 0.09235918455176012 0.2768128799661161 0.07052192668668286 0.22967121948425703 0.09216693390415415 0.2261250943784702 0.1687464800456971 0.3517151886628299 0.13937798108942834 0.3855195469914315 0.14838222692370917 0.37520015659835054 0.061804266354185344 0.12375164045544013 0.049976168518121714 0.13944324040115608 0.060790956404867626 0.1775500741045766 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8520811521852764 0.8441725359138799 0.06497392669218183 0.16244312939566696 0.11268308999752537 0.06267139602721794 0.03177318211182692 0.04175951825329478 0.2614051387742287 0.2676573123295714 0.23968667873054322 0.25287642193510307 0.058740336677327074 0.0675439187855305 0.32172940156828156 0.3413382578584984 0.32222778663775015 0.33716856258013744 );
}

}
