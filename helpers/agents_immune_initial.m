theta_1=4*Du*tau/delta^2;
theta_2=4*Di*tau/delta^2;

theta_T=4*DT*tau/delta^2;
nu=4*chiT*tau*cstar/delta^2;

tau_c=tau/iter_c;
Dc_ag=Dc*tau_c/delta^2;

grid=2*[L/delta, L/delta]+1;

grid_uninf=2*[cell_uninf/delta, cell_uninf/delta]+1; 
grid_inf=2*[cell_inf/delta, cell_inf/delta]+1; 
n_uninf=floor(h_uninf*delta^2); 
n_inf=floor(h_inf*delta^2); 

[xx,yy]=meshgrid(-L:delta:L);
r=sqrt(xx.^2+yy.^2);

U=zeros(grid(1),grid(2),T_pde+1);
I=U;
Tcell=U;
c=U;

U(:,:,1)=n_uninf*(r<cell_uninf);
I(:,:,1)=n_inf*(r<cell_inf);

U_temp=U(:,:,1);
I_temp=I(:,:,1);
Tc_temp=Tcell(:,:,1);
c_temp=c(:,:,1);

vessel=(r<L);