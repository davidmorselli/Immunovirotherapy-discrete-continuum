function c=dinamicac_dued(c,D,I,alphac,U,gammac,cstar,qc)
%Funzione che prende in input una matrice a valori interi positivi 
%di dimensione almeno 3x3 e restituisce il vettore ottenuto a seguito di
%diffusione, decadimento e produzione della popolazione I. 
%Condizioni al bordo di Neumann omogenee

n=size(c);

c_vert=[c(1,:); c; c(n(1),:)];
c_hor=[c(:,1) c c(:,n(2))];

c=c+D*(c_vert(3:n(1)+2,:)+c_vert(1:n(1),:)+c_hor(:,3:n(2)+2)+c_hor(:,1:n(2))-4*c)...
+(alphac*I+gammac*U).*(cstar-c)-qc*c;
