// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/500pct aux/refinement/partition4_model.elv" {

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
states = ("Default" "[50-65]" "[24-50]" "[0-24]");
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
states = ("Default" "[32-46]" "[21-32]" "[0-21]");
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
values= table (0.2475406393715161 0.39938189355130777 0.35307746707717613 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.82543159443743 0.6016993743682528 0.0892307407094851 0.17456840556257014 0.3983006256317471 0.9107692592905149 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.19565482147490376 0.2750770098144205 0.16158395015180682 0.7306436752394719 0.1357790117546269 0.4332724783204016 0.07370150328562428 0.5891439784309527 0.40514357152779157 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.652182284360448 0.07229745653648759 0.6985016015582477 0.07333591127147031 0.6568147641745203 0.06656222458995413 0.06115476318937178 0.20150915903100886 0.08257599447767738 0.18571182146297732 0.07353969339117421 0.20122011925006977 0.15288690797342944 0.4619502419295769 0.11138157394663462 0.3865837916168099 0.15650755260172974 0.3968507907431932 0.1318649581270829 0.2623421127007474 0.10562045805284317 0.3524734570623855 0.11125235666869945 0.33350371616446745 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8508824728537951 0.8391666832655943 0.05911883137566244 0.14856315696018935 0.09443235199673414 0.06120416954625582 0.009319845446637805 0.009573411710381292 0.05125422708459427 0.07125758986813867 0.04814879110037814 0.055440698648843156 0.014911752714620488 0.02489087044699136 0.1610847136944391 0.10414570826881805 0.13148323723564798 0.12566558360404448 0.12302195989561901 0.12445435223495678 0.7267117197351401 0.6742064272139274 0.724083743086456 0.7558415249125616 );
}

}
