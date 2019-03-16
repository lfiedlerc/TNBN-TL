// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/200pct aux/no refinement/partition3_model.elv" {

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
states = ("Default" "[47-72]" "[28-47]" "[12-28]" "[0-12]");
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
states = ("Default" "[31-50]" "[16-31]" "[7-16]" "[0-7]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2433926702222942 0.4057750871866772 0.35083224259102863 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8325817948222527 0.6451192702803521 0.12030623372144728 0.16741820517774736 0.35488072971964785 0.8796937662785528 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.15528622516200158 0.2869153880959236 0.12428917424229742 0.7286305826678496 0.134484389782403 0.4560585513943066 0.1160831921701487 0.5786002221216734 0.41965227436339586 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.653202980626006 0.0796343576367537 0.09924553695145424 0.2466847812211335 0.09928327871753187 0.27877208345625054 0.07993740292671943 0.20409402944560798 0.06833080077828838 0.19081474824025443 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7533528964532953 0.7576571407865494 0.13300022200198053 0.16468354430379745 0.1854808482656584 0.12532709286246146 0.7250289288869366 0.7571415558043763 0.06330765495911213 0.15478409351748695 0.18340381137849493 0.11238681719694378 0.6117791069689804 0.5527305605786619 0.18020763935154344 0.19133519738449783 0.14081414362162567 0.11407712178462252 0.052991423350362145 0.04384348729345831 0.12328678150005443 0.20632911392405062 0.18889363800756206 0.18207850228699074 0.04480129755858981 0.045585941206611885 0.11153447082796508 0.12816486487999595 0.1388482403672277 0.12387273349298665 0.08603839198775907 0.1057142857142857 0.1408116811014879 0.09543388063041626 0.1011091235538546 0.10971919704327844 0.07506795961104962 0.05373985409218282 0.33090833169935213 0.20556962025316455 0.18987999342429726 0.2499159663865546 0.085535186228637 0.07996811720721918 0.34891848804713094 0.2512592725297981 0.2518834330226735 0.25269243927471774 0.11057587981638614 0.1103254972875226 0.22952476127026428 0.20956744409775724 0.2838905089584516 0.26834893156236583 0.05403582718651213 0.07594489805778337 0.1535745281634922 0.20556962025316455 0.2480355087950025 0.22648016168492713 0.06504326460848202 0.06381037329436548 0.26987479403140285 0.26049009343910784 0.21266518291834746 0.23846732808758125 0.08603839198775907 0.12090415913200722 0.23896846546746617 0.2847692400690402 0.23860537994238998 0.26747290277344427 0.06455189339878088 0.06881461977002609 0.25923013663512073 0.21784810126582277 0.18771001150747987 0.21619827677906606 0.07959132271735465 0.053494012487427176 0.206364592134389 0.20530167563361124 0.21319933231325638 0.2725806819477705 0.10556822923911531 0.1103254972875226 0.21048745280923828 0.21889423781828843 0.2355808439236781 0.24038184683628902 );
}

}
