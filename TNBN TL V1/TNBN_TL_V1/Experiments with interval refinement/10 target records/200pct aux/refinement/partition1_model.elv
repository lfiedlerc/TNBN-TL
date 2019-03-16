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
num-states = 3;
states = ("Default" "[35-54]" "[5-35]");
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
values= table (0.6257719987508454 0.10043583535654513 0.7145468729029151 0.07861473510847859 0.6588930478135573 0.06979913522065234 0.12318059432888093 0.35950324142561013 0.09191692822446385 0.32314770980907676 0.12898488693788426 0.2922534135303157 0.19882954628085672 0.3901335624439356 0.1485990339628832 0.4722928066440353 0.15404830098742572 0.46927548115439255 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8271880927899369 0.8080689891209363 0.0391207645829768 0.1616624404898655 0.10396225217871559 0.07096963696918404 0.04359219280974565 0.07201720156862536 0.25313485234104377 0.24060590606879315 0.2815199387230247 0.2628067873798885 0.0619631883509956 0.04410622871188538 0.346123165445917 0.33291383229644333 0.31691101673391925 0.3197203591691637 );
}

}
