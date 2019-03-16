// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/200pct aux/no refinement/partition4_model.elv" {

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
states = ("Default" "[48-72]" "[31-48]" "[14-31]" "[0-14]");
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
states = ("Default" "[32-51]" "[17-32]" "[8-17]" "[0-8]");
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
values= table (0.2344789053920368 0.3900993855019239 0.3754217091060393 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8078521666909244 0.5996460688925097 0.07851451157128123 0.19214783330907562 0.4003539311074903 0.9214854884287188 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.27236024844720497 0.31849180069378746 0.10443568159529257 0.6427329192546584 0.15811001192875654 0.49747415413533835 0.08490683229813666 0.523398187377456 0.398090164269369 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6379857194774675 0.11265285769083239 0.6687034556101596 0.07987507173264725 0.33357182168409466 0.07250471856240301 0.09070144034401263 0.214065976217875 0.10576359620512815 0.23998506347267703 0.14640616400660428 0.19969687917643048 0.08208131281646522 0.2821304181051017 0.07509523446066202 0.21246665503479975 0.22720968629609245 0.23417866668498513 0.10821524665481946 0.24505331799002686 0.07069191595013155 0.24204602185110066 0.12332416070445788 0.24593070974445558 0.08101628070723521 0.1460974299961642 0.07974579777391863 0.22562718790877523 0.16948816730875071 0.24768902583172575 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8037076066266494 0.7803012540012967 0.08366255749768609 0.18681010557470876 0.12175883972896717 0.09294106958997034 0.02924449601456302 0.03838480144517693 0.09204855145788142 0.12084213511602013 0.11948349886557963 0.10426200714675067 0.052814989248958485 0.06102289120351985 0.30373646062154863 0.21556056949187358 0.2651662025623471 0.2661449942462601 0.0522816650629411 0.05338344382114828 0.2425120305172999 0.18418086233739558 0.23499164121000746 0.24111198594876143 0.061951243046888 0.0669076095288583 0.278040399905584 0.292606327480002 0.25859981763309864 0.29553994306825754 );
}

}
