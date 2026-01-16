T=T_pde/dt;
x=dx/2:dx:L-dx/2;
xmezzi=x+dx/2;
Nx=L/dx;

Nx_u=Ru/dx; 
Nx_i=Ri/dx;

u1=zeros(Nx,T_pde+1);
u2=u1;
u3=u1;
u4=u1;

u=[h_uninf*ones(Nx_u,1) 
      zeros((Nx-Nx_u),1)];
i=[h_inf*ones(Nx_i,1) 
      zeros((Nx-Nx_i),1)];
z=zeros(Nx,1);
c=zeros(Nx,1);

u1(:,1)=u;
u2(:,1)=i;
u3(:,1)=z;
u4(:,1)=c;