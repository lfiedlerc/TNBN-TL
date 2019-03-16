// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/200pct aux/no refinement/partition0_model.elv" {

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
states = ("Default" "[52-72]" "[33-52]" "[16-33]" "[0-16]");
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
states = ("Default" "[31-52]" "[17-31]" "[8-17]" "[0-8]");
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
values= table (0.6217177768937354 0.11598619102416571 0.6765465928650616 0.086950345263617 0.34690515501742797 0.08095447114521417 0.08468687289735127 0.15385040276179518 0.09199295751237203 0.20212437334437802 0.12788295725554943 0.16673769562908783 0.09096669366025573 0.3220437284234753 0.08721352005925 0.22920609370869527 0.18134470739313888 0.23910861425281793 0.09167953550706562 0.22850172612197928 0.08021560890225604 0.2539415275689253 0.18742065676022746 0.2633045698352049 0.11094912104159188 0.17961795166858457 0.06403132066106032 0.22777766011438452 0.15644652357365618 0.2498946491376752 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.783194786113829 0.800602005880996 0.07613734588095437 0.1749411982562161 0.11516543313556057 0.08085357236589748 0.04377441054447755 0.029362245054199484 0.09588558575027586 0.13018667170848341 0.12003294941503018 0.13659156521914684 0.07405639369236619 0.05117422059110747 0.2762336578357124 0.20885651907681846 0.2767705645367935 0.2644311872892819 0.03737739808024553 0.05099631229844047 0.2567203909171737 0.23225821259816176 0.21524099434124147 0.23571982314820422 0.061597011569081844 0.06786521617525669 0.29502301961588384 0.2537573983603203 0.2727900585713743 0.28240385197746953 );
}

}
