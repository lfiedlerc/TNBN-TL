// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/100 target records/100pct aux/refinement/partition2_model.elv" {

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
states = ("Default" "[32-49]" "[13-32]");
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
states = ("Default" "[23-40]" "[4-23]");
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
values= table (0.23618083153684066 0.42330184949332506 0.34051731896983434 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8057510523858482 0.6035382480377276 0.10885997599723993 0.1942489476141518 0.3964617519622724 0.89114002400276 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.21716385841908858 0.27770941012388217 0.1868535927113333 0.7426529458328621 0.1261793420296989 0.3384049702041334 0.04018319574804931 0.5961112478464189 0.47474143708453337 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6911045442177968 0.07183503621356259 0.09734887091317919 0.22506605334300386 0.09173258989895733 0.284587654227104 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7713037319339211 0.8115116884434178 0.09925125743026977 0.22701936820455748 0.12269065756063391 0.1257351232055721 0.7734081090382983 0.704221858931366 0.06978997796899031 0.218201026052882 0.11828148648479617 0.11030302444013998 0.7018592874894767 0.7703594250689322 0.08381915866483768 0.23936504721690316 0.10866147686478655 0.10122531928400347 0.08060606169542125 0.05577715341980493 0.3021029733310001 0.22085160908441215 0.2644966595040127 0.3094412996756397 0.0798643550110916 0.08477717419164668 0.29521635429726656 0.2581058813509624 0.2901858398910797 0.26354469234021066 0.12592278540817134 0.08420154414139153 0.3084909120925699 0.234901970712427 0.28284646245626816 0.26401506246032397 0.09935165743854248 0.09232080566036678 0.4299870540662087 0.4061423658586224 0.45821252280272623 0.3933259893467469 0.10029477140927781 0.13187560429811707 0.4716034842233063 0.3946401519206744 0.4055161095913806 0.4336338200207721 0.12777459107593855 0.09376990143018603 0.43114392533419404 0.39523188723043273 0.4298521896539338 0.4475148931065066 );
}

}
