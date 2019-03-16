// Bayesian Network 
//   Elvira format 

bnet "Network" {

// Network Properties

kindofgraph = "directed";
visualprecision = "0.00";
version = 1.0;
default node states = (present , absent);

// Variables

node IDV(finite-states) {
title = "IDV";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node NFV(finite-states) {
title = "NFV";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node SQV(finite-states) {
title = "SQV";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node LPV(finite-states) {
title = "LPV";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node TPV(finite-states) {
title = "TPV";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 2;
states = ("false" "true");
}

node L63P(finite-states) {
title = "L63P";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 5;
states = ("Default" "[179-244]" "[129-179]" "[79-129]" "[1-79]");
}

node L10I(finite-states) {
title = "L10I";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 5;
states = ("Default" "[147-276]" "[73-147]" "[47-73]" "[11-47]");
}

node I93L(finite-states) {
title = "I93L";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[148-260]" "[38-148]" "[10-38]");
}

node L90M(finite-states) {
title = "L90M";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 5;
states = ("Default" "[80-104]" "[50-80]" "[27-50]" "[2-27]");
}

node I62V(finite-states) {
title = "I62V";
kind-of-node = chance;
type-of-variable = finite-states;
pos_x =397;
pos_y =94;
relevance = 7.0;
purpose = "";
num-states = 4;
states = ("Default" "[209-367]" "[115-209]" "[4-115]");
}

// Links of the associated graph:

link IDV TPV;

link IDV L63P;

link NFV L10I;

link TPV I62V;

link L63P I93L;

link L63P L90M;

link L10I L63P;

link L10I I93L;

link L10I L90M;

link I93L L90M;

link I62V L63P;

link I62V L10I;

link I62V I93L;

link I62V L90M;

//Network Relationships:

relation IDV {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6716417910447762 0.3283582089552239 );
}

relation NFV {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7701492537313432 0.2298507462686567 );
}

relation SQV {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7492537313432835 0.2507462686567164 );
}

relation LPV {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8477611940298507 0.15223880597014924 );
}

relation TPV IDV  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.7433628318584071 0.990990990990991 0.25663716814159293 0.009009009009009009 );
}

relation L63P IDV L10I I62V  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.2857142857142857 0.42857142857142855 0.125 0.11666666666666667 0.2857142857142857 0.16666666666666666 0.3333333333333333 0.2 0.125 0.2 0.2 0.16666666666666666 0.1 0.2 0.2 0.09090909090909091 0.11428571428571428 0.2 0.2 0.18518518518518517 0.3 0.2 0.1111111111111111 0.17647058823529413 0.125 0.2 0.16666666666666666 0.2 0.3333333333333333 0.2 0.2 0.42857142857142855 0.2727272727272727 0.2 0.2 0.14285714285714285 0.3888888888888889 0.2 0.2 0.21428571428571427 0.04081632653061224 0.14285714285714285 0.125 0.016666666666666666 0.2857142857142857 0.3333333333333333 0.16666666666666666 0.2 0.125 0.2 0.2 0.16666666666666666 0.1 0.2 0.2 0.09090909090909091 0.02857142857142857 0.2 0.2 0.037037037037037035 0.04 0.2 0.1111111111111111 0.058823529411764705 0.375 0.2 0.3333333333333333 0.2 0.16666666666666666 0.2 0.2 0.14285714285714285 0.045454545454545456 0.2 0.2 0.14285714285714285 0.05555555555555555 0.2 0.2 0.07142857142857142 0.05102040816326531 0.14285714285714285 0.25 0.016666666666666666 0.14285714285714285 0.16666666666666666 0.16666666666666666 0.2 0.125 0.2 0.2 0.16666666666666666 0.1 0.2 0.2 0.09090909090909091 0.02857142857142857 0.2 0.2 0.037037037037037035 0.06 0.2 0.4444444444444444 0.058823529411764705 0.25 0.2 0.16666666666666666 0.2 0.16666666666666666 0.2 0.2 0.14285714285714285 0.045454545454545456 0.2 0.2 0.14285714285714285 0.05555555555555555 0.2 0.2 0.07142857142857142 0.04081632653061224 0.14285714285714285 0.375 0.05 0.14285714285714285 0.16666666666666666 0.16666666666666666 0.2 0.5 0.2 0.2 0.3333333333333333 0.1 0.2 0.2 0.09090909090909091 0.02857142857142857 0.2 0.2 0.037037037037037035 0.06 0.2 0.2222222222222222 0.17647058823529413 0.125 0.2 0.16666666666666666 0.2 0.16666666666666666 0.2 0.2 0.14285714285714285 0.045454545454545456 0.2 0.2 0.14285714285714285 0.05555555555555555 0.2 0.2 0.07142857142857142 0.5816326530612245 0.14285714285714285 0.125 0.8 0.14285714285714285 0.16666666666666666 0.16666666666666666 0.2 0.125 0.2 0.2 0.16666666666666666 0.6 0.2 0.2 0.6363636363636364 0.8 0.2 0.2 0.7037037037037037 0.54 0.2 0.1111111111111111 0.5294117647058824 0.125 0.2 0.16666666666666666 0.2 0.16666666666666666 0.2 0.2 0.14285714285714285 0.5909090909090909 0.2 0.2 0.42857142857142855 0.4444444444444444 0.2 0.2 0.5714285714285714 );
}

relation L10I NFV I62V  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.588957055214724 0.375 0.45454545454545453 0.5157894736842106 0.7457627118644068 0.2 0.5 0.8333333333333334 0.018404907975460124 0.25 0.2727272727272727 0.010526315789473684 0.06779661016949153 0.2 0.125 0.041666666666666664 0.03067484662576687 0.125 0.09090909090909091 0.042105263157894736 0.01694915254237288 0.2 0.125 0.041666666666666664 0.1411042944785276 0.125 0.09090909090909091 0.09473684210526316 0.01694915254237288 0.2 0.125 0.041666666666666664 0.22085889570552147 0.125 0.09090909090909091 0.3368421052631579 0.15254237288135594 0.2 0.125 0.041666666666666664 );
}

relation I93L L63P L10I I62V  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8444444444444444 0.5 0.25 0.6666666666666666 0.4 0.25 0.2 0.25 0.2 0.25 0.25 0.16666666666666666 0.6666666666666666 0.25 0.25 0.25 0.3076923076923077 0.25 0.25 0.5 0.5 0.25 0.25 0.25 0.42857142857142855 0.2 0.2 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.5 0.25 0.375 0.25 0.2 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.5555555555555556 0.25 0.2857142857142857 0.375 0.25 0.25 0.25 0.25 0.5714285714285714 0.25 0.25 0.2 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.6976744186046512 0.25 0.25 0.5423728813559322 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.38095238095238093 0.25 0.25 0.5833333333333334 0.42105263157894735 0.25 0.25 0.3448275862068966 0.06666666666666667 0.16666666666666666 0.25 0.08333333333333333 0.2 0.25 0.4 0.25 0.2 0.25 0.25 0.16666666666666666 0.1111111111111111 0.25 0.25 0.25 0.07692307692307693 0.25 0.25 0.1 0.25 0.25 0.25 0.25 0.2857142857142857 0.4 0.4 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.2 0.25 0.25 0.25 0.4 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.1111111111111111 0.25 0.14285714285714285 0.125 0.25 0.25 0.25 0.25 0.14285714285714285 0.25 0.25 0.2 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.011627906976744186 0.25 0.25 0.01694915254237288 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.047619047619047616 0.25 0.25 0.08333333333333333 0.02631578947368421 0.25 0.25 0.034482758620689655 0.044444444444444446 0.16666666666666666 0.25 0.16666666666666666 0.2 0.25 0.2 0.25 0.4 0.25 0.25 0.5 0.1111111111111111 0.25 0.25 0.25 0.23076923076923078 0.25 0.25 0.1 0.125 0.25 0.25 0.25 0.14285714285714285 0.2 0.2 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.2 0.25 0.25 0.25 0.2 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.2222222222222222 0.25 0.42857142857142855 0.375 0.25 0.25 0.25 0.25 0.14285714285714285 0.25 0.25 0.4 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.11627906976744186 0.25 0.25 0.13559322033898305 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.5238095238095238 0.25 0.25 0.25 0.07894736842105263 0.25 0.25 0.06896551724137931 0.044444444444444446 0.16666666666666666 0.25 0.08333333333333333 0.2 0.25 0.2 0.25 0.2 0.25 0.25 0.16666666666666666 0.1111111111111111 0.25 0.25 0.25 0.38461538461538464 0.25 0.25 0.3 0.125 0.25 0.25 0.25 0.14285714285714285 0.2 0.2 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.1 0.25 0.125 0.25 0.2 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.1111111111111111 0.25 0.14285714285714285 0.125 0.25 0.25 0.25 0.25 0.14285714285714285 0.25 0.25 0.2 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.1744186046511628 0.25 0.25 0.3050847457627119 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.047619047619047616 0.25 0.25 0.08333333333333333 0.47368421052631576 0.25 0.25 0.5517241379310345 );
}

relation L90M L63P L10I I93L I62V  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.8571428571428571 0.42857142857142855 0.2 0.5833333333333334 0.42857142857142855 0.2 0.2 0.2 0.3333333333333333 0.2 0.2 0.3333333333333333 0.3333333333333333 0.2 0.2 0.2 0.3333333333333333 0.2 0.2 0.2 0.2 0.2 0.3333333333333333 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.3333333333333333 0.2 0.2 0.42857142857142855 0.2 0.2 0.2 0.2 0.6 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.5 0.2 0.2 0.5555555555555556 0.2 0.2 0.2 0.2 0.2857142857142857 0.2 0.2 0.2 0.5555555555555556 0.2 0.2 0.42857142857142855 0.5 0.2 0.2 0.2 0.3333333333333333 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.42857142857142855 0.2 0.2 0.2 0.3333333333333333 0.3333333333333333 0.3333333333333333 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.5555555555555556 0.2 0.42857142857142855 0.2 0.3333333333333333 0.2 0.3333333333333333 0.2 0.3333333333333333 0.2 0.3333333333333333 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.3333333333333333 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.3333333333333333 0.2 0.3333333333333333 0.14285714285714285 0.2 0.2 0.2 0.2 0.16666666666666666 0.2 0.42857142857142855 0.42857142857142855 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.125 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.3333333333333333 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.625 0.2 0.2 0.5277777777777778 0.2 0.2 0.2 0.2 0.5 0.2 0.2 0.4166666666666667 0.5789473684210527 0.2 0.2 0.45454545454545453 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.3333333333333333 0.2 0.2 0.45454545454545453 0.2 0.2 0.2 0.2 0.5333333333333333 0.2 0.2 0.42857142857142855 0.2 0.2 0.2 0.2 0.6 0.2 0.2 0.21428571428571427 0.2 0.2 0.2 0.2 0.2857142857142857 0.2 0.2 0.16666666666666666 0.18181818181818182 0.2 0.2 0.3 0.023809523809523808 0.14285714285714285 0.2 0.08333333333333333 0.14285714285714285 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.16666666666666666 0.16666666666666666 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.14285714285714285 0.2 0.2 0.2 0.2 0.1 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.125 0.2 0.2 0.1111111111111111 0.2 0.2 0.2 0.2 0.14285714285714285 0.2 0.2 0.2 0.1111111111111111 0.2 0.2 0.14285714285714285 0.125 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.14285714285714285 0.2 0.2 0.2 0.16666666666666666 0.16666666666666666 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.1111111111111111 0.2 0.14285714285714285 0.2 0.16666666666666666 0.2 0.16666666666666666 0.2 0.16666666666666666 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.3333333333333333 0.2 0.16666666666666666 0.42857142857142855 0.2 0.2 0.2 0.2 0.3333333333333333 0.2 0.14285714285714285 0.14285714285714285 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.5 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.015625 0.2 0.2 0.027777777777777776 0.2 0.2 0.2 0.2 0.07142857142857142 0.2 0.2 0.08333333333333333 0.05263157894736842 0.2 0.2 0.045454545454545456 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.08333333333333333 0.2 0.2 0.09090909090909091 0.2 0.2 0.2 0.2 0.06666666666666667 0.2 0.2 0.14285714285714285 0.2 0.2 0.2 0.2 0.05 0.2 0.2 0.07142857142857142 0.2 0.2 0.2 0.2 0.14285714285714285 0.2 0.2 0.16666666666666666 0.045454545454545456 0.2 0.2 0.05 0.023809523809523808 0.14285714285714285 0.2 0.08333333333333333 0.14285714285714285 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.16666666666666666 0.16666666666666666 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.14285714285714285 0.2 0.2 0.2 0.2 0.1 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.125 0.2 0.2 0.1111111111111111 0.2 0.2 0.2 0.2 0.14285714285714285 0.2 0.2 0.2 0.1111111111111111 0.2 0.2 0.14285714285714285 0.125 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.14285714285714285 0.2 0.2 0.2 0.16666666666666666 0.16666666666666666 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.1111111111111111 0.2 0.14285714285714285 0.2 0.16666666666666666 0.2 0.16666666666666666 0.2 0.16666666666666666 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.1111111111111111 0.2 0.16666666666666666 0.14285714285714285 0.2 0.2 0.2 0.2 0.16666666666666666 0.2 0.14285714285714285 0.14285714285714285 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.125 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.078125 0.2 0.2 0.05555555555555555 0.2 0.2 0.2 0.2 0.21428571428571427 0.2 0.2 0.25 0.05263157894736842 0.2 0.2 0.045454545454545456 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.3333333333333333 0.2 0.2 0.09090909090909091 0.2 0.2 0.2 0.2 0.26666666666666666 0.2 0.2 0.14285714285714285 0.2 0.2 0.2 0.2 0.05 0.2 0.2 0.07142857142857142 0.2 0.2 0.2 0.2 0.14285714285714285 0.2 0.2 0.16666666666666666 0.045454545454545456 0.2 0.2 0.05 0.07142857142857142 0.14285714285714285 0.2 0.16666666666666666 0.14285714285714285 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.16666666666666666 0.16666666666666666 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.14285714285714285 0.2 0.2 0.2 0.2 0.1 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.125 0.2 0.2 0.1111111111111111 0.2 0.2 0.2 0.2 0.2857142857142857 0.2 0.2 0.2 0.1111111111111111 0.2 0.2 0.14285714285714285 0.125 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.14285714285714285 0.2 0.2 0.2 0.16666666666666666 0.16666666666666666 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.1111111111111111 0.2 0.14285714285714285 0.2 0.16666666666666666 0.2 0.16666666666666666 0.2 0.16666666666666666 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.1111111111111111 0.2 0.16666666666666666 0.14285714285714285 0.2 0.2 0.2 0.2 0.16666666666666666 0.2 0.14285714285714285 0.14285714285714285 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.125 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.0625 0.2 0.2 0.1388888888888889 0.2 0.2 0.2 0.2 0.14285714285714285 0.2 0.2 0.16666666666666666 0.10526315789473684 0.2 0.2 0.13636363636363635 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.2727272727272727 0.2 0.2 0.2 0.2 0.06666666666666667 0.2 0.2 0.14285714285714285 0.2 0.2 0.2 0.2 0.15 0.2 0.2 0.42857142857142855 0.2 0.2 0.2 0.2 0.2857142857142857 0.2 0.2 0.3333333333333333 0.18181818181818182 0.2 0.2 0.3 0.023809523809523808 0.14285714285714285 0.2 0.08333333333333333 0.14285714285714285 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.16666666666666666 0.16666666666666666 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.14285714285714285 0.2 0.2 0.2 0.2 0.1 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.125 0.2 0.2 0.1111111111111111 0.2 0.2 0.2 0.2 0.14285714285714285 0.2 0.2 0.2 0.1111111111111111 0.2 0.2 0.14285714285714285 0.125 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.14285714285714285 0.2 0.2 0.2 0.16666666666666666 0.16666666666666666 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.1111111111111111 0.2 0.14285714285714285 0.2 0.16666666666666666 0.2 0.16666666666666666 0.2 0.16666666666666666 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.1111111111111111 0.2 0.16666666666666666 0.14285714285714285 0.2 0.2 0.2 0.2 0.16666666666666666 0.2 0.14285714285714285 0.14285714285714285 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.125 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.16666666666666666 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.21875 0.2 0.2 0.25 0.2 0.2 0.2 0.2 0.07142857142857142 0.2 0.2 0.08333333333333333 0.21052631578947367 0.2 0.2 0.3181818181818182 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.08333333333333333 0.2 0.2 0.09090909090909091 0.2 0.2 0.2 0.2 0.06666666666666667 0.2 0.2 0.14285714285714285 0.2 0.2 0.2 0.2 0.15 0.2 0.2 0.21428571428571427 0.2 0.2 0.2 0.2 0.14285714285714285 0.2 0.2 0.16666666666666666 0.5454545454545454 0.2 0.2 0.3 );
}

relation I62V TPV  {
comment = "";
kind-of-relation = potential;
deterministic=false;
values= table (0.6857142857142857 0.36065573770491804 0.010714285714285714 0.03278688524590164 0.03571428571428571 0.01639344262295082 0.26785714285714285 0.5901639344262295 );
}

}