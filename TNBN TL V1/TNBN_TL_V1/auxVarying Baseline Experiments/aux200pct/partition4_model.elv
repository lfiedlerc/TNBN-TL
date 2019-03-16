// Bayesian Network
//   Elvira format 

bnet  "auxVarying Baseline Experiments/aux200pct/partition4_model.elv" { 

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
pos_x =248;
pos_y =128;
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
pos_y =132;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =248;
pos_y =208;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[31-69]" "[10-31]" "[0-10]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =555;
pos_y =209;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[18-73]" "[0-18]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Colision;

link Heridas_Internas Signos_Vitales;

link Pupilas_Dilatadas Signos_Vitales;

//Network Relationships: 

relation Colision Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.34883720930232553 0.43478260869565216 0.04123711340206186 0.44186046511627913 0.15942028985507245 0.5670103092783506 0.20930232558139536 0.4057971014492754 0.3917525773195877 );
}

relation Herida_Cabeza Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8903345420963331 0.6025870322313818 0.11201545450227349 0.109665457903667 0.3974129677686183 0.8879845454977265 );
}

relation Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.20478163188193538 0.3260743100705244 0.4691440580475402 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.679725783397314 0.13446680956691576 0.09508837158996856 0.08534512260601909 0.12244641089917066 0.23654263320700109 0.10273943411354676 0.5436454346200641 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas Pupilas_Dilatadas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8533754894319805 0.7455494024754588 0.6655494024754588 0.7722160691421255 0.802390438534372 0.562390438534372 0.6601682163121497 0.7490571052010386 0.30683388208036094 0.35350054874702763 0.29350054874702763 0.38683388208036096 0.3596928751190529 0.3596928751190529 0.3930262084523862 0.4051474205735983 0.2122005566065273 0.16934341374938444 0.17373901814498888 0.16934341374938444 0.1520190314885168 0.16868569815518347 0.13838266785215317 0.12487617434565965 0.06592580118391508 0.11114319248826293 0.11114319248826293 0.09780985915492958 0.07173552862800642 0.11973552862800643 0.1286244175168953 0.10640219529467307 0.1631147491006646 0.20978141576733125 0.14978141576733126 0.24311474910066458 0.19991011902133804 0.19991011902133804 0.1665767856880047 0.1726373917486108 0.23993930359566035 0.25422501788137464 0.23224699590335263 0.17803454169089844 0.22339864273677407 0.2567319760701074 0.19612591546404678 0.15768435702248834 0.08069870938410437 0.1433074050362783 0.22330740503627833 0.12997407170294498 0.12587403283762166 0.31787403283762167 0.21120736617095492 0.14454069950428827 0.5300513688189744 0.43671803548564114 0.5567180354856411 0.37005136881897444 0.44039700585960906 0.44039700585960906 0.44039700585960906 0.42221518767779087 0.5478601397978123 0.5764315683692409 0.5940139859516586 0.6526220445597172 0.6245823257747092 0.5745823257747091 0.6654914166838001 0.717439468631852 );
}

}
