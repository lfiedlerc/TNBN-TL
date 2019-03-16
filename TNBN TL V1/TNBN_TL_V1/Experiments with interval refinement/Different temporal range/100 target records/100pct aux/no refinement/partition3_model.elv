// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/100pct aux/no refinement/partition3_model.elv" {

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
states = ("Default" "[43-73]" "[24-43]" "[11-24]" "[0-11]");
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
states = ("Default" "[32-52]" "[17-32]" "[8-17]" "[0-8]");
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
values= table (0.23661470281184155 0.38440286737244955 0.37898242981570884 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8371451893289417 0.5807427272771772 0.08836652683200669 0.16285481067105834 0.4192572727228228 0.9116334731679933 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.19489009186351708 0.2888893217529235 0.10995207630296212 0.7238139763779528 0.16650904183912174 0.47541347370641174 0.08129593175853018 0.5446016364079548 0.41463444999062615 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6216148952227445 0.1233207299030084 0.6440629402246195 0.09385510428066923 0.3258790436005626 0.0658606775474944 0.12231299368326569 0.2831826401446655 0.12638956888832292 0.29007417021900206 0.16059875426964035 0.2544556759616296 0.09287728435663024 0.27800263028111133 0.08985410064960217 0.19067531637423693 0.21605384769941735 0.25129749340991603 0.11491460197373574 0.1835525234259412 0.08598094148595861 0.24319229345633014 0.1411894715692184 0.21162622187251537 0.04828022476362394 0.13194147624527375 0.053712448751496854 0.18220311566976163 0.15627888286116134 0.21675993120844478 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7836037069028333 0.797287672179533 0.08419320760582794 0.2205950803532132 0.11592667612272822 0.07710876731529631 0.03566614516675522 0.037523148908481255 0.10223450891134198 0.1234507982524518 0.11894420846931539 0.11442602478578497 0.07298877898772411 0.0505828905829988 0.2821814384409086 0.19086381163049457 0.25102779022894106 0.24305729802065582 0.048117018617790115 0.05978617040080868 0.23667755873759633 0.2105352610205359 0.2165339062232961 0.21457981836063117 0.05962435032489731 0.054820117928178196 0.29471328630432514 0.25455504874330465 0.2975674189557192 0.35082809151763183 );
}

}
