// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/200pct aux/no refinement/partition2_model.elv" {

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
states = ("Default" "[51-71]" "[35-51]" "[18-35]" "[0-18]");
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
states = ("Default" "[32-52]" "[17-32]" "[8-17]" "[0-8]");
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
values= table (0.23235124581756872 0.3709504493317111 0.39669830485072016 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8050743889131466 0.6002671869049321 0.08724467030143997 0.19492561108685338 0.399732813095068 0.9127553296985601 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.18240165631469982 0.332803394896686 0.09553035982008994 0.7299654934437543 0.16015452538631347 0.5081605402655814 0.0876328502415459 0.5070420797170005 0.39630909991432844 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6212734064740153 0.11265285769083239 0.6578428736374091 0.0858392341525059 0.3510718216840947 0.07309732828807132 0.09019586690134862 0.17276332949750675 0.07706761919980656 0.213951372072829 0.11034259768849751 0.14560112480290752 0.09358232514618764 0.2543045646336786 0.09762115597133172 0.19736789342520497 0.1605200880572372 0.22382945684030478 0.07724305975176521 0.3012696586114308 0.07780817044695104 0.19736789342520494 0.23126719867914142 0.2524197566994011 0.11770534172668326 0.15900958956655162 0.08966018074450155 0.3054736069242554 0.1467982938910292 0.30505233336931525 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7998614527804955 0.7774441111441538 0.0823598543757828 0.1749411982562161 0.13500143990028154 0.08214826479316821 0.03155218832225533 0.03409908715946264 0.11027433150286166 0.12311552373816476 0.1078902753003374 0.10709345284961541 0.059820352798968544 0.05940645970442585 0.27522997280231015 0.20571308639324148 0.2337397777825536 0.2742395978438617 0.05410531539830005 0.049466421432358 0.2768399951782307 0.25788814791818876 0.2447866583567944 0.2322839319241718 0.05466069069998052 0.07958392055959969 0.25529584614081485 0.23834204369418893 0.2785818486600331 0.30423475258918303 );
}

}
