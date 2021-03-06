// Bayesian Network
//   Elvira format 

bnet  "auxVarying Baseline Experiments/aux200pct/partition2_model.elv" { 

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
pos_x =261;
pos_y =126;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =576;
pos_y =129;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =262;
pos_y =203;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[33-83]" "[10-33]" "[0-10]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =577;
pos_y =206;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[17-53]" "[0-17]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Signos_Vitales Heridas_Internas;

//Network Relationships: 

relation Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.23620741666467168 0.37966162463982767 0.38413095869550073 );
}

relation Herida_Cabeza Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8725087826185525 0.6129072087711495 0.11201545450227349 0.12749121738144759 0.3870927912288506 0.8879845454977265 );
}

relation Heridas_Internas Colision Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.393244716730657 0.34939089613265034 0.32741287415462833 0.2744530820344242 0.21159593917728137 0.16424900040177115 0.2027867165462584 0.20733217109171295 0.08959023560784196 0.5634086809953383 0.502279112889026 0.5462351568450698 0.19804799524331662 0.12376228095760236 0.1245786074882146 0.4450057564052786 0.32682393822346045 0.375211034997654 0.0433466022740048 0.14832999097832375 0.12635196900030177 0.5274989227222592 0.6646417798651163 0.7111723921100144 0.352207527048463 0.4658438906848266 0.535198729394504 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6741252233413084 0.12753891794383423 0.10648951170397997 0.10839236602537947 0.11720588684676542 0.2612361082991729 0.10217937810794621 0.5028326077316134 );
}

relation Signos_Vitales Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.49027329004430137 0.23749320635971435 0.14139267262604188 0.17006581004954185 0.3683340373296568 0.5924409835907438 );
}

}
