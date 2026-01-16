function [U,I] = infezione_dued(U, I, beta)
%Funzione che prende in input due matrici U, I a valori interi positivi, una
%probabilità di infezione beta e restituisce la matrice ottenuta dopo
%l'infezione

% prob_max=0.9;
prob_max=1;

A=binornd(U,min(prob_max, beta*I));
U=U-A;
I=I+A;