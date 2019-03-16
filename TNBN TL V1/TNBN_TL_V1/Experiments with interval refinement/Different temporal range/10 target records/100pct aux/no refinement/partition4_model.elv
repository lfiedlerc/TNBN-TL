// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/100pct aux/no refinement/partition4_model.elv" {

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
states = ("Default" "[52-73]" "[35-52]" "[18-35]" "[0-18]");
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
states = ("Default" "[33-52]" "[18-33]" "[8-18]" "[0-8]");
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
values= table (0.24822685956552293 0.38944472101747224 0.36232841941700494 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8100743889131466 0.5859814726192177 0.09795895601572568 0.18992561108685338 0.41401852738078226 0.9020410439842743 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.1824016563146998 0.29804666611821806 0.12767857142857142 0.716335403726708 0.15811001192875654 0.479396350931677 0.10126293995859212 0.5438433219530254 0.3929250776397515 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6056974571069267 0.11598619102416571 0.650700016494552 0.0852322145897901 0.3335718216840947 0.07666350012036031 0.09641649446419406 0.15385040276179518 0.0974271603247611 0.2009162742592501 0.10995046780407267 0.1643807290446556 0.07809757388951842 0.2433325661680092 0.0913512215577977 0.20263180653314225 0.20594386351128235 0.22364891892991534 0.0855107072645712 0.31951668584579973 0.08490926046750062 0.2721362789187205 0.1755641166758393 0.24656722160800798 0.13427776727478968 0.16731415420023016 0.07561234115538867 0.23908342569909702 0.17496973032471105 0.28873963029706073 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7831947861138289 0.7803012540012967 0.07392348957557796 0.17827453158954942 0.1273776335489602 0.10180553031985412 0.038218854988921996 0.03838480144517693 0.10456004578857593 0.11584213511602014 0.11605594263322659 0.1240525171771008 0.06648701946563522 0.06323475166562922 0.24846255034642667 0.2113677561814774 0.2603067689640598 0.23902644028560086 0.05555741404119293 0.04813360867549461 0.30082307326114627 0.20806466596797046 0.22617272499337357 0.2615241690724703 0.05654192539042097 0.0699455842124026 0.2722308410282732 0.2864509111449826 0.2700869298603798 0.2735913431449741 );
}

}
