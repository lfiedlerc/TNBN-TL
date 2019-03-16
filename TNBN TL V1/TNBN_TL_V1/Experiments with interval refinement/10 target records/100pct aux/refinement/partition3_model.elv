// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/100pct aux/refinement/partition3_model.elv" {

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
states = ("Default" "[32-54]" "[16-32]" "[7-16]");
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
states = ("Default" "[32-40]" "[12-32]" "[4-12]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.17762967395655688 0.4791644335112489 0.34320589253219436 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6890843857191815 0.6826493591488387 0.20635997599723996 0.3109156142808185 0.31735064085116127 0.79364002400276 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2524218779448905 0.20123061777012058 0.156804144251843 0.5134758189151495 0.10155057839035195 0.3584379358437936 0.23410230313996003 0.6972188038395275 0.48475791990436345 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6691595421751303 0.08770443650475465 0.18185270198320655 0.45946120389106787 0.10735882406237493 0.29379009671880785 0.03943793536985202 0.15683531478973953 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8193078686149838 0.831872301177193 0.06741873096039763 0.1899086823748501 0.10517427312640078 0.09591392256228251 0.8193078686149838 0.831872301177193 0.0647401595318262 0.1899086823748501 0.10517427312640078 0.09502106541942537 0.8193078686149838 0.831872301177193 0.06652587381754049 0.1899086823748501 0.10785284455497221 0.09859249399085393 0.051018954744004565 0.03635193488060691 0.2011860715231502 0.13431565888085384 0.1568706829827791 0.20336410543831296 0.03571821201796831 0.03993032847041666 0.20313335901571195 0.13101207293129108 0.1866902595635567 0.17522876429378773 0.036138426277003234 0.04424413126915973 0.2042661029058088 0.14154821410116866 0.17627967890721033 0.19459665762480324 0.08290580145900742 0.08860784127147935 0.496678114072777 0.44701930221284175 0.4971254038186662 0.4575692372362042 0.10505356475873033 0.07986065694083332 0.5184132599880149 0.4454410479663897 0.47852790669739237 0.49906926539369917 0.0993806722617589 0.07963943628448752 0.49858500386686666 0.4377106312974601 0.4729454799949545 0.4585323541733869 0.044641585401004 0.04089592674068278 0.2326213951986424 0.22665767436144085 0.23862019383295976 0.24094225535626212 0.037819283313142917 0.04623511717627191 0.21159724897469992 0.23145466217861424 0.2274616955601955 0.22846281926911566 0.042914381203941344 0.042031924705701745 0.2284266097011195 0.22865480739419555 0.24077224436106773 0.24604175101986614 );
}

}
