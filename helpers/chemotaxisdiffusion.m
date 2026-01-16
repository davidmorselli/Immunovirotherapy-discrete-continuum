function v = passeggiata_dued_chemotaxisdiffusion(v,c,theta,chi,cmax)
%Funzione che prende in input una matrice a valori interi positivi 
%di lunghezza almeno 3, una matrice di concentrazione chimica della stessa 
%dimensione, la probabilità di moto unbiased, la probabilità massima di moto per chemotassi e il valore che normalizza la 
%concentrazione e restituisce la matrice ottenuta compiendo un passo di 
%un passegiata secondo chemotassis

n=size(v);

prob_u=[zeros(1,n(2)); theta/4+chi*subplus(c(1:n(1)-1,:)-c(2:n(1),:))/(4*cmax)];
prob_d=[theta/4+chi*subplus(c(2:n(1),:)-c(1:n(1)-1,:))/(4*cmax); zeros(1,n(2))];
prob_l=[zeros(n(1),1) theta/4+chi*subplus(c(:,1:n(2)-1)-c(:,2:n(2)))/(4*cmax)];
prob_r=[theta/4+chi*subplus(c(:,2:n(2))-c(:,1:n(2)-1))/(4*cmax) zeros(n(1),1)];

b=mnrnd(v(:),[prob_u(:) prob_d(:) prob_l(:) prob_r(:) 1-prob_u(:)-prob_d(:)-prob_l(:)-prob_r(:)]);
%il risultato è per la matrice srotolata a vettore, quindi deve essere
%riarrotolato
b_u=v;
b_d=v;
b_l=v;
b_r=v;
b_fix=v;

b_u(:)=b(:,1);
b_d(:)=b(:,2);
b_l(:)=b(:,3);
b_r(:)=b(:,4);
b_fix(:)=b(:,5);

v=[b_u(2:n(1),:); zeros(1,n(2))]+...
    [zeros(1,n(2)); b_d(1:n(1)-1,:)]+...
    [b_l(:,2:n(2)) zeros(n(1),1)]+...
    [zeros(n(1),1) b_r(:,1:n(2)-1)]+...
    b_fix;
