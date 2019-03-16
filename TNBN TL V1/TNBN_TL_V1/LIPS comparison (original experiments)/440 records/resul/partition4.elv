// Bayesian Network
//   Elvira format 

bnet  "" { 

// Network Properties

kindofgraph = "directed";
visualprecision = "0.00";
version = 1.0;
default node states = ("present" , "absent");

// Variables 

node Colision(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Leve" "Moderado" "Severo");
}

node Herida_Cabeza(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("[2.0-25.0]" "[26.0-47.0]" "Default");
}

node Signos_Vitales(finite-states) {
kind-of-node = chance;
type-of-variable = finite-states;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("[2.0-10.0]" "[11.0-25.0]" "[26.0-44.0]" "Default");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships: 

relation Colision { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.24545454545454545 0.38636363636363635 0.36818181818181817 );
}

relation Herida_Cabeza Colision { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.8703703703703705 0.5823529411764706 0.11728395061728396 0.12962962962962962 0.4176470588235294 0.8827160493827161 );
}

relation Heridas_Internas Colision { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.3148148148148148 0.21176470588235294 0.08641975308641975 0.6574074074074074 0.1764705882352941 0.4444444444444445 0.027777777777777776 0.611764705882353 0.46913580246913583 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.17924528301886794 0.7982456140350878 0.0660377358490566 0.12719298245614033 0.7547169811320755 0.07456140350877193 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas { 
comment = "new";
kind-of-relation = potential;
deterministic=false;
values= table (0.05555555555555555 0.13333333333333333 0.7058823529411764 0.5666666666666667 0.746987951807229 0.7913043478260869 0.018518518518518517 0.03333333333333333 0.14705882352941177 0.0 0.03614457831325302 0.10434782608695652 0.018518518518518517 0.03333333333333333 0.08823529411764705 0.16666666666666669 0.13253012048192775 0.08695652173913045 0.9074074074074073 0.8 0.058823529411764705 0.26666666666666666 0.08433734939759037 0.017391304347826087 );
}

}
