// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/500pct aux/no refinement/partition4_model.elv" {

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
states = ("Default" "[52-72]" "[34-52]" "[17-34]" "[0-17]");
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
states = ("Default" "[33-52]" "[19-33]" "[10-19]" "[0-10]");
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
values= table (0.6318338207432903 0.11265285769083237 0.6687034556101596 0.07987507173264725 0.33357182168409466 0.06713969059655078 0.08685550482092594 0.1382132719601074 0.07213620950964564 0.19670917340793861 0.13121629058888276 0.15885402562720924 0.08451041824506093 0.29443421557345606 0.08817067440340015 0.19808159922705235 0.21931755641166756 0.21890340468491984 0.08514362877320301 0.22483697736862293 0.09372429200088 0.24527376405531257 0.15429829389102917 0.25323092217225324 0.11165662741751987 0.22986267740698121 0.07726536847591457 0.2800603915770492 0.16159603742432582 0.3018719569190669 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8037076066266494 0.7803012540012967 0.07005216206809048 0.1797389576043901 0.12823452260704846 0.08214826479316821 0.02924449601456302 0.03838480144517693 0.10565894688747703 0.11894885707149809 0.10653213310941707 0.10965840954515173 0.05751266049127624 0.06065419930659584 0.21717021646012638 0.1821779364497674 0.22820096218496425 0.22456907516201324 0.03815579652686517 0.05429828847017014 0.2928184111685169 0.21007479278366636 0.2101846830223783 0.22168433165768275 0.07137944034064618 0.06636145677676045 0.3143002634157892 0.30905945609067803 0.32684769907619193 0.3619399188419842 );
}

}
