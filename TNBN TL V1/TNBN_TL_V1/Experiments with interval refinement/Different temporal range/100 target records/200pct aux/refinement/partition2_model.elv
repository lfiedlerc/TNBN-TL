// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/100 target records/200pct aux/refinement/partition2_model.elv" {

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
states = ("Default" "[46-64]" "[27-46]" "[14-27]" "[0-14]");
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
states = ("Default" "[32-49]" "[21-32]" "[11-21]" "[0-11]");
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
values= table (0.23834840600185545 0.3982724928925605 0.363379101105584 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8077067835318402 0.5992801422431636 0.09449130906197184 0.19229321646815983 0.40071985775683644 0.9055086909380281 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.1903543307086614 0.3004126547631098 0.1461371838463374 0.7451968503937008 0.15658124724573044 0.42660565422930086 0.06444881889763779 0.5430060979911598 0.4272571619243617 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6396970031141731 0.10116380868771901 0.6808229325453792 0.09255055645379694 0.5221211228935989 0.060611392622246844 0.096855644324147 0.23792722711207437 0.08982827646926454 0.20998830098589827 0.10363638298693034 0.2192536789855521 0.09879275721062997 0.33989603873153484 0.09938447609365439 0.26436027177688975 0.16313134359053852 0.2627263911982046 0.06973606391338585 0.1623947740606222 0.05160347797170516 0.181864867818144 0.10171719070939461 0.21169320729639513 0.09298141855118114 0.15672984008176327 0.07644959699511875 0.24936110742075412 0.10747476754200185 0.24382521197531223 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8460833147225255 0.8277536078445527 0.06890916939614067 0.1791203587819011 0.11583782610038149 0.08533809364800127 0.016491073422586554 0.016669005692462647 0.060603545187233446 0.10103134045761218 0.08237535781673463 0.0905605847873266 0.031149805353774603 0.029633787897711376 0.20201181729077816 0.12989743773121568 0.17573409667570056 0.1684426877044275 0.05680258623335369 0.0425985701029601 0.28465301527336917 0.2182998606316263 0.24895663695724243 0.2807378128407125 0.04764087877636116 0.08149291671870627 0.3819859817861987 0.3698468713180446 0.3752655189429022 0.3731096093237856 );
}

}
