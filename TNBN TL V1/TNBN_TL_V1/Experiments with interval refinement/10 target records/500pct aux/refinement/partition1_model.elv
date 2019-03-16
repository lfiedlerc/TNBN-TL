// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/10 target records/500pct aux/refinement/partition1_model.elv" {

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
states = ("Default" "[42-55]" "[18-42]" "[5-18]");
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
states = ("Default" "[32-40]" "[13-32]" "[5-13]");
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
values= table (0.2675908872624527 0.45178070548681815 0.28062840725072913 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8262691434578031 0.6612713409744924 0.18080101819544242 0.1737308565421969 0.33872865902550775 0.8191989818045575 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3850815178184966 0.25965717960029555 0.2124438909446032 0.4920766604145626 0.11651180654312565 0.324930787632265 0.12284182176694079 0.6238310138565788 0.4626253214231317 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6424486575147932 0.08151716224302988 0.696448590821449 0.07837166798928821 0.6468438899667482 0.06641585350356347 0.07905657823793517 0.26011720991164194 0.06286567645709636 0.22190662751325876 0.08828902750831294 0.2347399677371078 0.14014575233088508 0.3677519174612869 0.11136205543828495 0.3489660674603666 0.1405417172581308 0.3673411708863138 0.08624353989592928 0.15965814953197333 0.057477189903630946 0.20759007089950013 0.07747812618076441 0.19890180472380892 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.861092635204215 0.8635751772074571 0.06494173534852243 0.16328634945881185 0.11141674556223206 0.05768309376017601 0.032899112714791186 0.023966522923014287 0.1633211172423886 0.1367531987981297 0.15469263133936853 0.2028224960097145 0.045693212103876654 0.05346378190518572 0.3858685737045445 0.356278070553022 0.3327690325323625 0.40026032398377287 0.03472684119894626 0.031340837668557144 0.20101060583678595 0.17993841947122327 0.21045392868262924 0.1902582705931835 );
}

}
