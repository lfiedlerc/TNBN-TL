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
states = ("Default" "[32-59]" "[0-32]");
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
values= table (0.3846153846153846 0.7297297297297297 0.2571428571428571 0.19999999999999998 0.013157894736842105 0.0594059405940594 0.30769230769230765 0.14864864864864866 0.5142857142857142 0.44444444444444436 0.25 0.5247524752475248 0.30769230769230765 0.12162162162162163 0.22857142857142854 0.3555555555555555 0.7368421052631579 0.41584158415841577 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.46226803693474067 0.5377319630652593 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.23584526545890983 0.35774058439686846 0.4064141501442217 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6103982763628018 0.0967504730071785 0.18552463030342775 0.4146430831108486 0.20175803545497764 0.48636512991921155 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8204024489900652 0.8095300636812611 0.07226724868966246 0.17810719342502243 0.13861581191021838 0.09411779610060775 0.025354948377873148 0.019261004796276966 0.04973858573458686 0.08070265284198747 0.07752457692808036 0.07655342568163877 0.0781777574984422 0.08132424247316941 0.37195811940647566 0.2952018090799015 0.3574744380572594 0.33811096342723795 0.07395193276879668 0.08774457740526173 0.5038734989634235 0.44386459063093103 0.4242317126342175 0.48909133074380334 );
}

}
