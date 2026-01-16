function v = inflow(v,p_inflow,vessel)
%Funzione che prende in input un vettore colonna a valori interi positivi,
%una probabilità di ingresso dai vasi sanguigni e la posizione dei vasi
%stessi e restituisce il vettore ottenuto a seguito dell'ingresso. Vessel
%vale 1 nei punti del vaso e 0 altrimenti.

a=v(:);
b=vessel(:);

a(b==1)=a(b==1)+(rand(sum(b),1)<p_inflow);

v(:)=a;
