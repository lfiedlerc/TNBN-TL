// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/44 target records/500pct aux/refinement/partition2_model.elv" {

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
states = ("Default" "[57-65]" "[44-57]" "[29-44]" "[0-29]");
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
states = ("Default" "[24-36]" "[0-24]");
}

// Links of the associated graph:

link Colision Pupilas_Dilatadas;

link Herida_Cabeza Colision;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Colision;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.37500000000000006 0.5 0.12500000000000003 0.25 0.11764705882352941 0.058823529411764705 0.5 0.125 0.625 0.25 0.11764705882352941 0.29411764705882354 0.125 0.37500000000000006 0.25000000000000006 0.5 0.7647058823529412 0.6470588235294118 );
}

relation Herida_Cabeza {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.42655239620295343 0.5734476037970466 );
}

relation Heridas_Internas {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.26116276513958825 0.35524564748059034 0.3835915873798214 );
}

relation Pupilas_Dilatadas Colision Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6327128182770515 0.09863157659315967 0.6734828505471981 0.09422396895458751 0.5449797119543537 0.06085786770172816 0.05085514823856209 0.094588044431582 0.03437022625818967 0.09731478019496166 0.04421249762386847 0.10183468904439093 0.062156292291575904 0.1965947590146606 0.06301208147334772 0.15907223685714889 0.07921405824276434 0.17915361961513218 0.0904091524241104 0.27820013068112354 0.08592556564547417 0.2208296935193361 0.12711093066862184 0.21875599868795087 0.16198306475986446 0.3301308217415999 0.1412998190614464 0.42668788239329347 0.20264061410939715 0.43751199737590174 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8494280967485999 0.8327313377460555 0.06974851788807133 0.17066459576075516 0.11394120150545707 0.08211046601790178 0.02848657629080543 0.028558064287258822 0.10681384450136967 0.11175441617408265 0.11643088888903794 0.12015292183027468 0.12005057151125145 0.1366707362318815 0.8214955677105341 0.7156203842726345 0.7676545047090807 0.7957668921218191 );
}

}
