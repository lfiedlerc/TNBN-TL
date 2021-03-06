// Bayesian Network
//   Elvira format 

bnet  "data files/CollisionModel_AuxFixed100pct_TargetVarying25.0pct.elv" { 

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
pos_x =282;
pos_y =173;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =559;
pos_y =166;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =284;
pos_y =272;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[38.0-80.0]" "[15.0-38.0]" "[0.0-15.0]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =560;
pos_y =275;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[23.0-77.0]" "[0.0-23.0]");
}

// Links of the associated graph:

link Colision Signos_Vitales;

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Heridas_Internas Colision;

link Heridas_Internas Signos_Vitales;

link Signos_Vitales Pupilas_Dilatadas;

//Network Relationships: 

relation Colision Herida_Cabeza Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.18335735600791 0.23407411841540365 0.06864404735201315 0.11869348393835559 0.04533530974180227 0.0466756813197146 0.4867298676393089 0.4334772671114406 0.5531955194259717 0.42682069204545703 0.3908027341714209 0.418008654577155 0.32991277635278105 0.3324486144731558 0.37816043322201515 0.45448582401618737 0.5638619560867769 0.5353156641031305 );
}

relation Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.49194773108241696 0.508052268917583 );
}

relation Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.26921432484895563 0.38019683867894544 0.35058883647209904 );
}

relation Pupilas_Dilatadas Herida_Cabeza Signos_Vitales { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5431859873588696 0.4221592065197991 0.3545053220922693 0.453193972554502 0.2901849752332035 0.24198178694629158 0.1496447140285433 0.18998697430823341 0.21253826911741006 0.17287514765087325 0.2004487976861709 0.2165165271151415 0.14928473967535189 0.18962699995504198 0.21217829476421865 0.14903668295798744 0.21675435660098788 0.23282208602995846 0.1578845589372353 0.19822681921692542 0.2207781140261021 0.2248941968366374 0.29261187047963777 0.30867959990860844 );
}

relation Signos_Vitales Colision Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5876742307423519 0.5520899077185027 0.43468177007271785 0.6080748896478169 0.620852098426449 0.6301035452059728 0.4524963807370704 0.4385237692323702 0.5307203799527022 0.22196999354923952 0.2142077375038999 0.2984662238840565 0.20000452275025293 0.18083870958230477 0.19750833415692978 0.25484037193790815 0.29093628499171703 0.2429712593947652 0.19035577570840853 0.2337023547775974 0.26685200604322556 0.19192058760193012 0.19830919199124616 0.17238812063709746 0.29266324732502136 0.27053994577591267 0.2263083606525327 );
}

}
