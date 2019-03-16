// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/44 target records/500pct aux/refinement/partition3_model.elv" {

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
states = ("Default" "[18-41]" "[3-18]");
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
states = ("Default" "[32-41]" "[13-32]" "[5-13]");
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
values= table (0.22962034716425309 0.4236301326553943 0.3467495201803527 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8699055070941667 0.6047496018440576 0.12246768486210909 0.13009449290583325 0.39525039815594254 0.8775323151378909 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.16471889578223436 0.27802073143665074 0.12494696748902852 0.7675299379598903 0.12569358246130324 0.47075899339155625 0.06775116625787524 0.596285686102046 0.40429403911941525 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.630546224509816 0.09207437859901248 0.6916145232498623 0.0768580442460802 0.6300161663326991 0.0639634747494419 0.13199515497764205 0.35860617003270606 0.11349914314861441 0.33358618079121966 0.14040753399964118 0.3562652483897995 0.10480017329883136 0.20212347765479793 0.07806526431197382 0.2526667606983001 0.08983420421777989 0.23695000010831002 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8468430569471811 0.8553970257097983 0.06547758969584483 0.1807764627290003 0.11488089219532756 0.061268334802728155 0.027447480833838512 0.025701426310107668 0.18690448206083105 0.14094168383156985 0.17924455050524726 0.15981990715724162 0.06065893264278312 0.05685467032235939 0.36045864397445987 0.36997192005787083 0.3283506367662494 0.37010925867992794 0.035956199892328455 0.03997999648238971 0.21360512235523546 0.1761771047894623 0.22683159931195007 0.21365398114704934 );
}

}
