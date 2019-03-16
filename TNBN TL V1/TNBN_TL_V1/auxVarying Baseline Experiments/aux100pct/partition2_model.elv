// Bayesian Network
//   Elvira format 

bnet  "auxVarying Baseline Experiments/aux100pct/partition2_model.elv" { 

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
pos_x =262;
pos_y =130;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =555;
pos_y =125;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =267;
pos_y =193;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[31-78]" "[11-31]" "[0-11]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =553;
pos_y =199;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[19-62]" "[0-19]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Signos_Vitales Herida_Cabeza;

link Signos_Vitales Heridas_Internas;

//Network Relationships: 

relation Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.24484026649034987 0.3732609689379226 0.38189876457172756 );
}

relation Herida_Cabeza Colision Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.9285931236024879 0.6196132926542914 0.7443936089987554 0.6669809785677747 0.6021911989273799 0.605249540014254 0.31427193021321004 0.1360143354354044 0.09744056082774809 0.07140687639751206 0.38038670734570856 0.2556063910012446 0.3330190214322253 0.39780880107262007 0.3947504599857459 0.6857280697867899 0.8639856645645957 0.9025594391722519 );
}

relation Heridas_Internas Colision Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3722074479871515 0.3283536273891448 0.30637560541112285 0.2575572579542064 0.1852883503911812 0.153161653558602 0.21488002185804062 0.21942547640349516 0.10168354091962417 0.589441733589329 0.5283121654830167 0.5722682094390606 0.2029074145471632 0.1356805237908607 0.12708323872298738 0.4760303637470825 0.35784854556526435 0.40623564233945786 0.038350818423519555 0.14333420712783848 0.12135618514981651 0.5395353274986304 0.6790311258179582 0.7197551077184106 0.3090896143948769 0.42272597803124057 0.49208081674091797 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6773079127507903 0.12378367439258879 0.11262426321569372 0.11409816556001047 0.10944163727965214 0.2613201503792423 0.10062618675386387 0.5007980096681585 );
}

relation Signos_Vitales Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5297301196985568 0.304348483790605 0.29001082145294266 0.13737309924960303 0.18020745787343534 0.13428537995135742 0.3328967810518403 0.5154440583359597 0.5757037985957 );
}

}
