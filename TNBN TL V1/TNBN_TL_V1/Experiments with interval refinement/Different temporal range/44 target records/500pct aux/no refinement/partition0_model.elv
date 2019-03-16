// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/500pct aux/no refinement/partition0_model.elv" {

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
states = ("Default" "[53-73]" "[38-53]" "[20-38]" "[0-20]");
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
states = ("Default" "[32-53]" "[18-32]" "[9-18]" "[0-9]");
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
values= table (0.24937252241331342 0.37520576848064735 0.37542170910603934 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8238243889131467 0.6118743297620749 0.08407006712683679 0.17617561108685337 0.3881256702379251 0.9159299328731633 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.14391669711362806 0.31067454335606975 0.10443568159529257 0.7812787723785166 0.18516974886701013 0.48456143756129455 0.07480453050785531 0.5041557077769202 0.41100288084341285 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6155658781595582 0.11598619102416569 0.6745095403040757 0.08384332570090122 0.34690515501742797 0.07737778583464602 0.07711814406868307 0.17787802071346373 0.07947505765511155 0.20706764782248202 0.10113557145477892 0.16451068460745952 0.0855276367728884 0.22427617951668583 0.07177181416696722 0.16038783423267386 0.17771234635846633 0.18348388286770229 0.10325685771825935 0.2776340621403912 0.0933246777422075 0.2478482110849898 0.22509814712896714 0.2904954146624343 0.11853148328061092 0.2042255466052934 0.08091891013163795 0.30085298115895304 0.14914878004035956 0.2841322320277578 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.783194786113829 0.800602005880996 0.067971108623197 0.17140562427105677 0.11516543313556057 0.08085357236589748 0.04377441054447755 0.029362245054199484 0.09860766483619497 0.13018667170848341 0.11679510797598953 0.13659156521914684 0.06043099453318497 0.0546696175991627 0.2911998262097044 0.21708308338215648 0.23115003628680963 0.22997234167120909 0.05570046848174453 0.03506950252436408 0.2236469361022227 0.18748267848070144 0.21576350323936236 0.22182544970019985 0.056899340326764095 0.08029662894127784 0.3185744642286809 0.2938419421576019 0.3211259193622779 0.3307570710435468 );
}

}
