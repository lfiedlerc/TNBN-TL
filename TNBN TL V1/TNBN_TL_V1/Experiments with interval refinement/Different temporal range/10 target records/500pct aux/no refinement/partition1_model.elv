// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/500pct aux/no refinement/partition1_model.elv" {

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
states = ("Default" "[53-73]" "[36-53]" "[18-36]" "[0-18]");
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
states = ("Default" "[32-53]" "[17-32]" "[8-17]" "[0-8]");
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
values= table (0.2475406393715161 0.4070742012436155 0.3453851593848684 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.82543159443743 0.6338422315111101 0.09756407404281843 0.17456840556257014 0.36615776848889 0.9024359259571816 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.23654509062604248 0.2989296668192515 0.17385103089714843 0.6897534060883332 0.13237148932536533 0.3964712360843768 0.07370150328562428 0.5686988438553833 0.42967773301847484 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.648102549864578 0.0858487682371892 0.6930713191680535 0.08075777631364928 0.6043209453139615 0.0768889711031559 0.07327110027675923 0.20099137692609287 0.07630692727917321 0.17699683095240432 0.0822251668017709 0.16813217675659375 0.08375924957560237 0.2959722081568483 0.0712196148441703 0.23063492150918236 0.09295815925671884 0.23039044023839622 0.08689760817042796 0.2419466372689995 0.08283485729455693 0.23768415691554107 0.1003314210887323 0.25469371929045487 0.10796949211263238 0.17524100941087012 0.07656728141404603 0.27392631430922293 0.12016430753881648 0.2698946926113992 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8147615712950874 0.7843773724216828 0.06382792288549956 0.17037437961415886 0.11839923687719937 0.07140821799875231 0.02247945094554414 0.03717181347297311 0.09958534722881832 0.12204418020168521 0.11017909137554727 0.12460608043864731 0.042989066809163465 0.057091616331810514 0.31556137022570235 0.23804882174606123 0.26390286321293327 0.2692577245945992 0.06170348368679143 0.06600738132764772 0.26493631929673017 0.20612112357495066 0.23740219075841681 0.2458639012842668 0.05806642726341356 0.05535181644588586 0.2560890403632496 0.2634114948631441 0.2701166177759034 0.2888640756837344 );
}

}
