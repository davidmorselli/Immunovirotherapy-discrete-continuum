function v = nascitamorte_pressione(v, P, K, p, q)
%Funzione che prende in input una matrice v a valori interi positivi, una
%matrice pressione P delle stesse dimensioni, una carrying capacity K, una 
%probabilità di nascita p e una di morte q e restituisce la matrice 
%ottenuta dopo riproduzione e morte. Se la pressione è superiore a K, le
%cellule muoiono prima a tasso p per riequilibrare.
%NB: le nascite precedono le morti, muoiono anche i neonati


v=v+binornd(v,p*(1-P/K).*(P<K));
v=v-binornd(v,p*(P/K-1).*(P>=K)); %muoiono le eventuali cellule in eccesso
v=binornd(v,1-q);