// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/100pct aux/refinement/partition0_model.elv" {

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
states = ("Default" "[43-55]" "[19-43]" "[5-19]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[20-34]" "[6-20]");
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
values= table (0.27452001765541123 0.36067016182548783 0.36480982051910105 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8640843857191816 0.6465382480377276 0.0908044204416844 0.13591561428081844 0.35346175196227236 0.9091955795583156 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.1487218205160612 0.2517843957666749 0.11621102966621576 0.7986509768444298 0.19099187792271716 0.4164280995375467 0.05262720263950881 0.5572237263106078 0.46736087079623745 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6699720750502376 0.09358391302782859 0.08836813291004568 0.18883668478586904 0.1388642088586432 0.35968892340165526 0.06312009493574691 0.19962735248791869 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7907179679752668 0.825340782519794 0.07869418390251723 0.19352647007764662 0.11406043719873507 0.10540555965324841 0.7907179679752668 0.8155193539483655 0.06690846961680294 0.19352647007764662 0.11013186577016364 0.09698719230630963 0.7841703489276478 0.7958764968055083 0.0747656124739458 0.18959789864907517 0.10156043719873507 0.0929055596532484 0.06166345586443031 0.04596295196847525 0.25911726077741704 0.20921818847209608 0.24827741780116092 0.2200702323253009 0.06166345586443031 0.054796231500485494 0.2869662540250064 0.2127945677622174 0.25117245724229254 0.21004472862855225 0.06271972766205107 0.07406251000862088 0.23130859688151356 0.20484665089579918 0.23577340415460632 0.22185347258973806 0.06353204543607971 0.06250961467712635 0.3400914047703598 0.3379678429164629 0.29829013505607105 0.31668643188275003 0.07287499329432673 0.07488818305066351 0.3284770958022086 0.3504851704318875 0.3175537495134698 0.3410982772600421 0.06271972766205107 0.07586891269175798 0.3596125842142281 0.32703588125469696 0.3286538360942997 0.3202562225287348 );
}

}
