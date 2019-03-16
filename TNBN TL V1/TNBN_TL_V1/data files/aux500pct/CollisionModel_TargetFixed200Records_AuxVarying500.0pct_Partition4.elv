// Bayesian Network
//   Elvira format 

bnet  "data files/aux500pct/CollisionModel_TargetFixed200Records_AuxVarying500.0pct_Partition4.elv" { 

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
pos_x =266;
pos_y =165;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node Heridas_Internas(finite-states) {
title = "Heridas Internas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =580;
pos_y =170;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Falso" "Ligeras" "Graves");
}

node Pupilas_Dilatadas(finite-states) {
title = "Pupilas Dilatadas";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =264;
pos_y =284;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[40.0-77.0]" "[16.0-40.0]" "[0.0-16.0]");
}

node Signos_Vitales(finite-states) {
title = "Signos Vitales";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =581;
pos_y =290;
relevance = 7.0;
purpose = "";
num-states = 3;
states = ("Default" "[21.0-68.0]" "[0.0-21.0]");
}

// Links of the associated graph:

link Colision Herida_Cabeza;

link Colision Heridas_Internas;

link Colision Signos_Vitales;

link Herida_Cabeza Pupilas_Dilatadas;

link Herida_Cabeza Signos_Vitales;

link Heridas_Internas Signos_Vitales;

link Pupilas_Dilatadas Heridas_Internas;

//Network Relationships: 

relation Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2411912626006514 0.37515963954676507 0.3836490978525835 );
}

relation Herida_Cabeza Colision { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.528190953088838 0.5122759305668924 0.3707573360761938 0.47180904691116193 0.4877240694331076 0.6292426639238061 );
}

relation Heridas_Internas Colision Pupilas_Dilatadas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.3337774247641918 0.3550283272715423 0.3999794182574505 0.32148261948929135 0.3266852077677409 0.34672433354262394 0.32551772931909784 0.2859648165184509 0.2383622365957162 0.31847553677617657 0.3002272925940796 0.2224371345612593 0.45704270752997017 0.3857727646434707 0.36804410474016713 0.4528641802079726 0.2541644153556492 0.2619210730687542 0.2643133214726042 0.22133581980059572 0.4686693810486254 0.3425669952366166 0.3748850032161976 0.3798498960920746 0.2091798677058379 0.25919890808498697 0.23197647700238236 0.22565320030273606 0.41915037687660983 0.39135459338862183 0.41016894920829794 0.4926993636809534 0.2929683823556584 0.3389574679872069 0.32488770418972285 0.39771296934666606 );
}

relation Pupilas_Dilatadas Herida_Cabeza { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.4828585078243229 0.17034968446771245 0.16563631470642948 0.16414060766783978 0.16101062751276976 0.24927269410594274 0.1904945499564779 0.4162370137585049 );
}

relation Signos_Vitales Colision Herida_Cabeza Heridas_Internas { 
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6628482343353873 0.70736053128443 0.46429914052312926 0.4731797110428759 0.44363479385153204 0.4830763520161727 0.4502980934190787 0.37603703468721633 0.2273825994961928 0.3362809989569948 0.3444013197555973 0.2749979529300417 0.34247269138775704 0.33701685085119587 0.24223748153000757 0.2787168627949468 0.21231873969351692 0.1900183087003548 0.1572153224678161 0.11551725208125613 0.22489674626688227 0.2310468041595651 0.26066422421518215 0.2409434451328619 0.2004599913572916 0.23212561732862758 0.23622746687488597 0.2514464796383043 0.2525630237481121 0.2267048772050624 0.28074240238758874 0.29355728364788325 0.2733833616638552 0.25925223097004935 0.21414457396245526 0.21001843595666533 0.1799364431967966 0.17712221663431393 0.3108041132099884 0.29577348479755894 0.2957009819332857 0.2759802028509654 0.3492419152236297 0.3918373479841561 0.5363899336289213 0.4122725214047009 0.4030356564962906 0.4982971698648959 0.3767849062246543 0.36942586550092077 0.48437915680613713 0.46203090623500387 0.5735366863440277 0.5999632553429798 );
}

}
