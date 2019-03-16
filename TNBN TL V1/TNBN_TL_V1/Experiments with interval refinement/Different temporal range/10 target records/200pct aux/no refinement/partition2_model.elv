// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/200pct aux/no refinement/partition2_model.elv" {

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
states = ("Default" "[50-71]" "[33-50]" "[16-33]" "[0-16]");
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

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

//Network Relationships:

relation Colision {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2587772856069096 0.3903904718020618 0.35083224259102863 );
}

relation Herida_Cabeza Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8575817948222526 0.6101986353597172 0.10030623372144726 0.14241820517774734 0.3898013646402828 0.8996937662785527 );
}

relation Heridas_Internas Colision  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.17164233282245708 0.3543843321953026 0.12428917424229742 0.6959183673469387 0.14061793015507384 0.4560585513943066 0.1324392998306042 0.5049977376496236 0.41965227436339586 );
}

relation Pupilas_Dilatadas Herida_Cabeza  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6376671776972396 0.08644289719845781 0.07598051796298144 0.20910998308763237 0.08778049167163494 0.2354257178853016 0.09382460782607879 0.2189309392614118 0.1047472048420652 0.2500904625671965 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7666862297866286 0.7538122040776887 0.12312231554718206 0.16468354430379745 0.1854808482656584 0.14342091266886503 0.7336003574583652 0.7571415558043763 0.062294461499642545 0.14013671557896973 0.17900959799693977 0.09575008552856654 0.6117791069689804 0.5527305605786619 0.13497335109926717 0.18324059378689625 0.11438255832928089 0.09502950273700347 0.049658090017028804 0.047688424002319076 0.12322573472745364 0.20632911392405062 0.18889363800756206 0.16398468248058717 0.03908701184430409 0.045585941206611885 0.10664620042894991 0.14281224281851312 0.14324245374878286 0.1238627551602235 0.08603839198775907 0.1057142857142857 0.15985676215856096 0.09543388063041629 0.10843281252311318 0.096273678593662 0.06384757661851473 0.05582701227171708 0.24398227865932748 0.22620253164556958 0.1686141706394871 0.22648016168492713 0.047122723622448445 0.0680803901846545 0.27846587324950584 0.16386375469574904 0.23552510780358882 0.24164927585813661 0.08603839198775907 0.1103254972875226 0.2584910059960027 0.18011873680094867 0.22188678869736417 0.23656727065506164 0.05858954351238035 0.07397284761812736 0.275704215040569 0.20518987341772155 0.21895775110964985 0.263069886182321 0.07641239080424553 0.07019831856223788 0.33320492871861723 0.2877744248932085 0.20070107108081792 0.2461061694605998 0.11057587981638614 0.14748643761301988 0.2527948034643571 0.24027496469535115 0.2719953040571493 0.255745851840746 0.061218560065447535 0.06869951203014786 0.23396545602546776 0.19759493670886075 0.23805359197764267 0.20304435698329965 0.1037775162706368 0.05899379424211945 0.2193885361032844 0.26541286201355957 0.24152176936987063 0.29263171399247345 0.10556822923911531 0.08374321880650994 0.19388407728181214 0.30093182408638774 0.2833025363930924 0.31638369617352685 );
}

}
