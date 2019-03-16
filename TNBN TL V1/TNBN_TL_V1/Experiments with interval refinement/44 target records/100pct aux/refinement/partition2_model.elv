// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/100pct aux/refinement/partition2_model.elv" {

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
states = ("Default" "[39-59]" "[19-39]" "[0-19]");
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
states = ("Default" "[32-40]" "[13-32]" "[4-13]");
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
values= table (0.2064349112724325 0.34364888522974313 0.44991620349782446 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7890843857191816 0.6001096766091562 0.10350283314009708 0.21091561428081845 0.3998903233908438 0.8964971668599029 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.25242187794489046 0.3114119287882517 0.09221509986190407 0.6603842336059909 0.12358684059397818 0.48001731351897275 0.08719388844911856 0.5650012306177701 0.42776758661912323 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.631578947368421 0.06060606060606061 0.15789473684210525 0.09090909090909091 0.05263157894736842 0.09090909090909091 0.15789473684210525 0.7575757575757576 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.803813206070505 0.7986826192544879 0.07869418390251723 0.19352647007764662 0.11013186577016364 0.10540555965324841 0.7982009611725458 0.7958764968055083 0.06887275533108865 0.19352647007764662 0.11013186577016364 0.09558413108181985 0.7841703489276478 0.8155193539483655 0.09047989818823152 0.18959789864907517 0.11406043719873507 0.09137494740835045 0.033314738591801035 0.02720505145209623 0.15444892823466572 0.11419094228989074 0.13965737317892804 0.1589199704408401 0.03517597924515257 0.03581114091131433 0.17436166550749885 0.1088382418700521 0.1289144983190105 0.15401933609299703 0.03475223195232789 0.02532087298747925 0.1461728735054628 0.10040380016737122 0.1449719284583888 0.14130192746996123 0.08513766529015822 0.07254680387225661 0.37714273173581164 0.34078859339639267 0.3473529538040005 0.3464098232081234 0.08331152979115082 0.08594673818715438 0.3846741898825232 0.3461412938162313 0.37421014095379435 0.3241569748003774 0.08047885294223302 0.08138852031689757 0.4114495698672286 0.33886282556487785 0.3436371637532179 0.33984007872522326 0.05182292669835717 0.04715542251696679 0.2334693101221691 0.2158922502668247 0.21127653891171164 0.20891726451211565 0.04628418321730601 0.03581114091131433 0.21390761026177696 0.2123237833202656 0.20590510148175287 0.22923808162678627 0.053042880348289946 0.04702447840531859 0.2273800254529421 0.20797930034669754 0.20582434287302115 0.2504084790606908 );
}

}
