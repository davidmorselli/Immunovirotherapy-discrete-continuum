function v = T_kill(v, T_cell, z)
%Funzione che prende in input una matrice v a valori interi positivi, una
%matrice T_cell delle stesse dimensioni, una probabilità z di uccisione da 
%parte del sistema immunitario e  restituisce la matrice 
%ottenuta dopo l'azione del sistema immunitario

prob_max=1;

v=binornd(v,1-min(prob_max,z*T_cell));