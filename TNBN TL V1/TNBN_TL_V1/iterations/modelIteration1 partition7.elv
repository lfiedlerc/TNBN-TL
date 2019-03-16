// Bayesian Network 
//   Elvira format 

bnet "Network" {

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
num-states = 3;
states = ("Default" "[37-64]" "[0-37]");
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
states = ("Default" "[30-49]" "[0-30]");
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
values= table (0.2526105664838379 0.3719274131771052 0.3754620203390569 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8172226977814496 0.5922466007252177 0.09454340430673487 0.18277730221855037 0.4077533992747823 0.9054565956932652 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.225314826730398 0.2904575421617186 0.1224721941354904 0.7024309832398811 0.1568982501408057 0.44321916076845297 0.07225419002972086 0.5526442076974758 0.4343086450960566 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6128625340642443 0.07323569173764802 0.15402243268411786 0.3311314739760909 0.2310336490261768 0.5936137399327482 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8147853838987934 0.8242443830343991 0.07806840367749841 0.1882067576456197 0.14421632496419812 0.10523514549891647 0.8188217602774566 0.7903814831532865 0.07557400408895745 0.17487481961958887 0.12765673018673662 0.08829723109264764 0.7604808922846897 0.7448492520849423 0.0858446838254382 0.1782105342773851 0.11886421939957909 0.08191967910383649 0.03590895618288699 0.02764695098335296 0.10050407339364797 0.13433930724540571 0.1346176567472048 0.1327715590549995 0.028911421232320763 0.03194186923378491 0.09761019832601071 0.13240380801453108 0.11462862565474953 0.13188153260923965 0.04948741894944427 0.04906745152212647 0.11450797279848374 0.13475069761271513 0.1247795767734801 0.1152402076438699 0.1474157148560624 0.14613388376915135 0.8194947522866681 0.675534802148326 0.7192429089064941 0.7600690699525333 0.15033939040806796 0.17568028078581704 0.8249018721276591 0.6908024765975536 0.755771786096569 0.7779099097385586 0.18805219200788822 0.20412059833204613 0.7977388771627701 0.6851408709604249 0.7544365180304259 0.8009194431248958 );
}

}
