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
num-states = 4;
states = ("Default" "[47-66]" "[27-47]" "[0-27]");
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
states = ("Default" "[30-50]" "[0-30]");
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
values= table (0.24182307996819608 0.3755232420156525 0.38265367801615147 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.803422840231592 0.5818075902862073 0.07897327245753326 0.19657715976840795 0.4181924097137928 0.9210267275424668 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.26071592538099575 0.3496188842047721 0.38966519041423214 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6238524772298478 0.07390126580204842 0.10604158886605355 0.20601364773218467 0.11404472764839721 0.33116212532650247 0.1540604215601155 0.3869975999455058 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8128131735932498 0.8123861523715492 0.07571156552737271 0.1854519761537248 0.13355861359446144 0.10625910087518023 0.8176578980024831 0.7903545282106013 0.07315363841811881 0.187662366170022 0.12472971892639204 0.08047042394167828 0.7669963363001338 0.7355630378829978 0.09081809258889273 0.17841357171553135 0.12035133965077893 0.08251986975427603 0.03509752995126567 0.029938379940710233 0.1054685972945944 0.13925528276528826 0.1582197314305766 0.13415561065087148 0.030390350332919484 0.0359392237353255 0.10128424157492721 0.13822994701535757 0.125038611581944 0.12643531670801922 0.05199255305699495 0.048079447657636755 0.12250029910381234 0.1416528324628394 0.12349279248963146 0.11563282633262223 0.15013943368041424 0.15567957569169322 0.8169022263181311 0.6733851344677637 0.7063380867436455 0.7576957728309782 0.15005235476878995 0.17170962451322183 0.8236510965810119 0.6722141258966018 0.7483371450737557 0.7911785727335143 0.17908546052964927 0.2143542041402972 0.7847675411337979 0.6780448913887914 0.7542559787443646 0.7999516838092882 );
}

}
