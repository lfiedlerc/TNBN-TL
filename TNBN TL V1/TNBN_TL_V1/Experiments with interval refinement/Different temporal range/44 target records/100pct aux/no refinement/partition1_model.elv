// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/100pct aux/no refinement/partition1_model.elv" {

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
states = ("Default" "[48-69]" "[30-48]" "[14-30]" "[1-14]");
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
states = ("Default" "[32-53]" "[19-32]" "[10-19]" "[0-10]");
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
values= table (0.24298954368990916 0.38584406635298774 0.3711663899571031 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8146897735285313 0.6050290916668368 0.08545895601572567 0.18531022647146875 0.3949709083331632 0.9145410439842744 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.20576752440106477 0.323138422188235 0.10747396784800876 0.6988110026619343 0.16089798482542508 0.5111464422725612 0.09542147293700089 0.51596359298634 0.38137958987943005 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.5900324753721548 0.11265285769083239 0.6689322603519406 0.10689095662691998 0.3602788479178132 0.09942846906491537 0.11249749862696697 0.214065976217875 0.10553479146334711 0.23052364916541354 0.14307283067327095 0.20088261516427272 0.08474393701716999 0.2674652857690833 0.08286684771715157 0.24392039130138068 0.18742065676022746 0.2328823676767377 0.11522997675117053 0.2418350594553126 0.08086294600851689 0.20490156280518945 0.20019996330948447 0.2572067922296755 0.09749611223253776 0.16398082086689686 0.06180315445904373 0.2137634401010964 0.10902770133920381 0.20959975586439863 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8113999143189571 0.7828986565986993 0.06678063243272082 0.1690246718901044 0.12175883972896719 0.08752023903256416 0.02924449601456302 0.03318999625037174 0.11000420396041417 0.13134129331269034 0.1201506731303555 0.1138933640199463 0.052814989248958485 0.051417844351637564 0.21864108398402904 0.18245201020767818 0.19650415790394732 0.18444451173964832 0.04285346776918292 0.04597677816423373 0.2842823084813316 0.17568267098911308 0.22520667450578266 0.2507057920981972 0.06368713264833849 0.08651672463505775 0.3202917711415044 0.341499353600414 0.33637965473094744 0.3634360931096441 );
}

}
