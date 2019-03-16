// Bayesian Network 
//   Elvira format 

bnet "Experiments with interval refinement/Different temporal range/10 target records/500pct aux/no refinement/partition3_model.elv" {

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
states = ("Default" "[51-72]" "[33-51]" "[17-33]" "[0-17]");
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
states = ("Default" "[32-52]" "[17-32]" "[9-17]" "[0-9]");
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
values= table (0.6204916367516372 0.09006239750717361 0.6988654676379012 0.08263335519602037 0.6009876119806282 0.07631527451955288 0.09565234409741129 0.2354151797843916 0.0834827584430815 0.19271230946688092 0.06717860780278938 0.18808541204313425 0.09185548897021306 0.3041578778897623 0.08015006872588668 0.24932528601862805 0.13248467086529067 0.24033147033989888 0.09102918494229163 0.19090990613781808 0.07154265693209338 0.22138003820561625 0.09063779593024462 0.22427025380828822 0.1009713452384469 0.1794546386808545 0.06595904826103716 0.25394901111285445 0.10871131342104715 0.27099758928912576 );
}

relation Signos_Vitales Herida_Cabeza Heridas_Internas  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7847615712950874 0.772405078631309 0.06452579411008179 0.17037437961415886 0.13603459729736989 0.08941269663155127 0.030908740784543722 0.03982462703482667 0.11717337078122717 0.1250598168360858 0.10469474449879532 0.10978911410334949 0.05616327233058356 0.057443951259899394 0.30297948837371436 0.2270525282587043 0.2494483275861955 0.26258138121704167 0.05276480817685626 0.05581706181224961 0.22714308785457324 0.17429227087067672 0.19854652580107277 0.2117608000707683 0.07540160741292909 0.07450928126171531 0.28817825888040327 0.3032210044203743 0.31127580481656647 0.32645600797728935 );
}

}
