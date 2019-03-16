// Bayesian Network 
//   Elvira format 

bnet "Network" {

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
states = ("Default" "[37-62]" "[0-37]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[33-48]" "[15-33]" "[0-15]");
}

// Links of the associated graph:

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
values= table (0.43333333333333335 0.5714285714285714 0.023255813953488372 0.26666666666666666 0.2222222222222222 0.0196078431372549 0.5 0.2857142857142857 0.8837209302325582 0.26666666666666666 0.08333333333333333 0.29411764705882354 0.06666666666666667 0.14285714285714285 0.09302325581395349 0.46666666666666673 0.6944444444444444 0.6862745098039216 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.44426271950662954 0.5557372804933705 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.27266937743848446 0.3271518950254026 0.40017872753611305 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6227673112176617 0.09348875553978472 0.15204786945818735 0.35512811638647607 0.2232601627487308 0.5495140327243366 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8383703137007406 0.82095581275077 0.07113751617940724 0.18589903572679245 0.12986891727898983 0.0895978299241392 0.020435937348182234 0.015237803170147233 0.06229058076903383 0.09065712297029037 0.06975734418438477 0.0718738555323048 0.06873906198934022 0.07237956505819935 0.36458310508934505 0.2629056566138421 0.34511528175432465 0.3335684064447992 0.07059687447553863 0.089522093624615 0.5001567220572423 0.45872504222966926 0.453422737198501 0.5031169887261336 );
}

}
