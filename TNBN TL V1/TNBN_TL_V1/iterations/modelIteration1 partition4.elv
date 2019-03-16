// Bayesian Network 
//   Elvira format 

bnet "Network" {

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
states = ("Default" "[36-63]" "[0-36]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[30-49]" "[0-30]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.24528321876191092 0.37920175780240795 0.3755150234356811 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8130214093821804 0.6193350872981086 0.08948329624145904 0.18697859061781966 0.38066491270189134 0.910516703758541 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.25770982119443686 0.35994314541655903 0.3823470333890041 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6179260578353657 0.07831958883805887 0.1598472615178572 0.3866371216314922 0.2202773237989983 0.5330905767949362 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8120616132700992 0.8295874242585942 0.07651480319897028 0.18414405562683 0.14105841566663635 0.10795480743300168 0.8287602360556702 0.7984367032882481 0.06623626341931083 0.17347234073834294 0.12861880022397304 0.09470594056749829 0.7693225613885651 0.7495490389899893 0.08413437025287278 0.17831678426949538 0.1254562349693912 0.09031347216338884 0.02605086548731298 0.01340323629426787 0.08628986928359522 0.10515476616365302 0.10574442830885901 0.09932049566725341 0.020699312125138772 0.026128575499671538 0.08119684665919037 0.10582473341539979 0.09065324583657182 0.10038542997739434 0.04194135247480634 0.050463999606494704 0.08580411195186936 0.09860198588766056 0.09186384086455975 0.09517846971328729 0.16002674513635118 0.15509459140509965 0.835359372851826 0.7088881649997989 0.7513419906155773 0.7908854284614624 0.14865869617145117 0.17356839439067526 0.8507215070428809 0.7188783614770262 0.7788778876978926 0.8030834398191548 0.18682966102413734 0.1981179243810533 0.8281962110136954 0.7212552671412207 0.7808426473487579 0.81267770293653 );
}

}
