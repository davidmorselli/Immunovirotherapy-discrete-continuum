function v= passeggiata_dued_smorzata(v,theta)
%Funzione che prende in input una matrice v a valori interi positivi 
%di grandezza almeno 3x3 e restituisce la matrice 
%ottenuta compiendo un passo di una passegiata aleatoria simmetrica con
%probabilità di restare sul posto pari a 1-theta.
%NB: sono adiacenti solo le celle con distanza taxi 1


n=size(v);

prob_u=[zeros(1,n(2)); theta*ones(n(1)-1,n(2))/4];
prob_d=[theta*ones(n(1)-1,n(2))/4; zeros(1,n(2))];
prob_l=[zeros(n(1),1) theta*ones(n(1),n(2)-1)/4];
prob_r=[theta*ones(n(1),n(2)-1)/4 zeros(n(1),1)];

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


% a=v(2:n(1)-1,2:n(2)-1); %cellule centrali
% 
% b=mnrnd(a(:),[theta/4 theta/4 theta/4 theta/4 1-theta]);
% %il risultato è per la matrice srotolata a vettore, quindi deve essere
% %riarrotolato
% b_u=a;
% b_d=a;
% b_l=a;
% b_r=a;
% b_fix=a;
% 
% b_u(:)=b(:,1);
% b_d(:)=b(:,2);
% b_l(:)=b(:,3);
% b_r(:)=b(:,4);
% b_fix(:)=b(:,5);
% 
% w=[zeros(n(1)-2,1) b_u zeros(n(1)-2,1); zeros(2,n(2))]+...
%     [zeros(2,n(2)); zeros(n(1)-2,1) b_d zeros(n(1)-2,1)]+...
%     [zeros(1,n(2)); zeros(n(1)-2,2) b_r; zeros(1,n(2))]+...
%     [zeros(1,n(2)); b_l zeros(n(1)-2,2); zeros(1,n(2))]+...
%     [zeros(1,n(2)); zeros(n(1)-2,1) b_fix zeros(n(1)-2,1); zeros(1,n(2))];
% 
% 
% %riga alta centrale
% b=mnrnd(v(1,2:n(2)-1)',[theta/4 theta/4 theta/4 1-3*theta/4]);
% b_d=b(:,1);
% b_l=b(:,2);
% b_r=b(:,3);
% b_fix=b(:,4);
% 
% w=w+[zeros(1,n(2)); 0 b_d' 0; zeros(n(1)-2,n(2))]+...
%     [b_l' 0 0; zeros(n(1)-1,n(2))]+...
%     [0 0 b_r'; zeros(n(1)-1,n(2))]+...
%     [0 b_fix' 0; zeros(n(1)-1,n(2))];
%     
% 
% %riga bassa centrale
% b=mnrnd(v(n(1),2:n(2)-1)',[theta/4 theta/4 theta/4 1-3*theta/4]);
% b_u=b(:,1);
% b_l=b(:,2);
% b_r=b(:,3);
% b_fix=b(:,4);
% 
% w=w+[zeros(n(1)-2,n(2)); 0 b_u' 0; zeros(1,n(2))]+...
%     [zeros(n(1)-1,n(2)); b_l' 0 0]+...
%     [zeros(n(1)-1,n(2)); 0 0 b_r']+...
%     [zeros(n(1)-1,n(2)); 0 b_fix' 0];
% 
% 
% %colonna destra centrale
% b=mnrnd(v(2:n(1)-1,n(2)), [theta/4 theta/4 theta/4 1-3*theta/4]);
% b_u=b(:,1);
% b_d=b(:,2);
% b_l=b(:,3);
% b_fix=b(:,4);
% 
% w=w+[zeros(n(1)-2,n(2)-1) b_u; zeros(2,n(2))]+...
%     [zeros(2,n(2)); zeros(n(1)-2,n(2)-1) b_d]+...
%     [zeros(1,n(2)); zeros(n(1)-2,n(2)-2) b_l zeros(n(1)-2,1); zeros(1,n(2))]+...
%     [zeros(1,n(2)); zeros(n(1)-2,n(2)-1) b_fix; zeros(1,n(2))];
% 
% 
% %colonna sinistra centrale
% b=mnrnd(v(2:n(1)-1,1), [theta/4 theta/4 theta/4 1-3*theta/4]);
% b_u=b(:,1);
% b_d=b(:,2);
% b_r=b(:,3);
% b_fix=b(:,4);
% 
% w=w+[b_u zeros(n(1)-2,n(2)-1); zeros(2,n(2))]+...
%     [zeros(2,n(2)); b_d zeros(n(1)-2,n(2)-1)]+...
%     [zeros(1,n(2)); zeros(n(1)-2,1) b_r zeros(n(1)-2,n(2)-2); zeros(1,n(2))]+...
%     [zeros(1,n(2)); b_fix zeros(n(1)-2,n(2)-1); zeros(1,n(2))];
% 
% 
% 
% %angolo sinistro alto
% b=mnrnd(v(1,1), [theta/4 theta/4 1-theta/2]);
% w(2,1)=w(2,1)+b(1);
% w(1,2)=w(1,2)+b(2);
% w(1,1)=w(1,1)+b(3);
% 
% %angolo destro alto
% b=mnrnd(v(1,n(2)), [theta/4 theta/4 1-theta/2]);
% w(2,n(2))=w(2,n(2))+b(1);
% w(1,n(2)-1)=w(1,n(2)-1)+b(2);
% w(1,n(2))=w(1,n(2))+b(3);
% 
% %angolo destro basso
% b=mnrnd(v(n(1),n(2)), [theta/4 theta/4 1-theta/2]);
% w(n(1)-1,n(2))=w(n(1)-1,n(2))+b(1);
% w(n(1),n(2)-1)=w(n(1),n(2)-1)+b(2);
% w(n(1),n(2))=w(n(1),n(2))+b(3);
% 
% %angolo sinistro basso
% b=mnrnd(v(n(1),1), [theta/4 theta/4 1-theta/2]);
% w(n(1)-1,1)=w(n(1)-1,1)+b(1);
% w(n(1),2)=w(n(1),2)+b(2);
% w(n(1),1)=w(n(1),1)+b(3);