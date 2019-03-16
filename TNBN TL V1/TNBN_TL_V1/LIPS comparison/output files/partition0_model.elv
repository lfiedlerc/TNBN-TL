// Bayesian Network
//   Elvira format 

bnet  "LIPS comparison/output files/partition0_model.elv" { 

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
pos_x =333;
pos_y =150;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =496;
pos_y =145;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =285;
pos_y =207;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[39-55]" "[24-39]" "[3-24]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =521;
pos_y =210;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[29-41]" "[17-29]" "[1-17]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships: 

relation Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.23967280981570552 0.3920582382528524 0.36826895193144205 );
}

relation Herida_Cabeza Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8978680796028203 0.601280350948786 0.09986695267316517 0.10213192039717969 0.39871964905121404 0.9001330473268349 );
}

relation Heridas_Internas Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3498122653316646 0.19895942258155017 0.10192777626934564 0.6 0.15203142135734143 0.4019277762693456 0.05018773466833542 0.6490091560611084 0.4961444474613087 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7285699641209636 0.18899927780922451 0.0597027165556125 0.05767766869010208 0.06404920553562275 0.08182226299455429 0.14767811378780113 0.6715007905061191 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.9073602039190696 0.8183436231158574 0.12630136986301368 0.2628872953592207 0.1728977405078034 0.12482195067096484 0.01601083320057352 0.01846598809722454 0.09315068493150686 0.06967933973751861 0.0683088749126485 0.05281505360221906 0.019436036323084275 0.019967740141275933 0.0976986301369863 0.0748207279123258 0.07564640111809923 0.05697578529125122 0.05719292655727258 0.14322264864564213 0.6828493150684931 0.5926126369909349 0.6831469834614489 0.7653872104355649 );
}

}
