// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/500pct aux/refinement/partition3_model.elv" {

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
states = ("Default" "[50-64]" "[23-50]" "[0-23]");
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
states = ("Default" "[43-51]" "[32-43]" "[20-32]" "[0-20]");
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
values= table (0.22446371629459302 0.41476650893592315 0.3607697747694838 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.79543159443743 0.6366200092888878 0.10423074070948508 0.2045684055625701 0.36337999071111216 0.8957692592905149 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.19565482147490376 0.2689434694417497 0.15340589632157908 0.6897534060883332 0.12964547138195606 0.41691637065994613 0.114591772436763 0.6014110591762942 0.42967773301847484 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6519008598184837 0.07211487049139104 0.6986432029294136 0.07349948663262673 0.6566986156322587 0.06665205057550296 0.0707367236732493 0.20958391015594866 0.07582525861776046 0.1864415817453852 0.08155778744647997 0.18554507428318312 0.143334940074742 0.476327068536247 0.11859848142777918 0.407127535648086 0.14225195484851158 0.41981915797407093 0.1321659837052816 0.24006884254226846 0.10498881962459139 0.3310289308540512 0.11759494934143624 0.3261095244977158 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.850614615710938 0.8387202546941658 0.05898354999038105 0.14856315696018935 0.094789494853877 0.061352979070065344 0.0018442640035686666 0.00375069175129847 0.030587532791899658 0.019800856814879315 0.03794295530552612 0.032743500730114 0.007377056014274666 0.009376729378246176 0.03418606606153491 0.059402570444637946 0.03432934051452363 0.036381667477904445 0.02766396005353 0.03000553401038776 0.1871237300210332 0.1386059977041552 0.16441947299061319 0.1400694197899321 0.11065584021412 0.11627144429025259 0.6873198545003335 0.6318273401838764 0.6667119289399589 0.7276333495580889 );
}

}
