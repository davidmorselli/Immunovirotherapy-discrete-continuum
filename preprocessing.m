clearvars

fsize=14; %font size
lw=2; %line width

load('parameters.mat')
load('pde.mat')

load('agents_1.mat')
U_plot=U;
I_plot=I;
Tcell_plot=Tcell;
c_plot=c;
% UI_plot=U_plot+I_plot;

U_sum=sum(U_plot,[1 2]);
I_sum=sum(I_plot,[1 2]);
T_sum=sum(Tcell_plot,[1 2]);
c_sum=sum(c_plot,[1 2])*delta^2;

U_sum=U_sum(:);
I_sum=I_sum(:);
T_sum=T_sum(:);

n=size(U_plot(:,:,1));
n_mid=(n(1)+1)/2;

U_sec=U_plot(:,n_mid,:);
I_sec=I_plot(:,n_mid,:);
Tcell_sec=Tcell_plot(:,n_mid,:);

minCol=0;
maxColU=max(max(max(U_plot)))/delta^2;
maxColI=max(max(max(I_plot)))/delta^2;
maxColT=max(max(max(Tcell_plot)))/delta^2;
maxSum=max(U_sum);
maxTSum=max(T_sum);

u1_sum=trapz(x,u1'.*x')*2*pi;
u2_sum=trapz(x,u2'.*x')*2*pi;
u3_sum=trapz(x,u3'.*x')*2*pi;

lw=2;

toll=1;
toll_pde=toll/delta^2;
U_plot(U_plot<toll)=NaN;
I_plot(I_plot<toll)=NaN;
Tcell_plot(Tcell_plot<toll)=NaN;
% UI_plot(UI_plot<toll)=NaN;

[xx,yy]=meshgrid(-L:delta:L);
r=sqrt(xx.^2+yy.^2);

vu=2*sqrt(Du*p);
vi=2*sqrt(Di*(beta*K-q));

clear U
clear I
clear Tcell
clear c
save('data_single')

%%
clearvars

fsize=14; %font size
lw=2; %line width

load('parameters.mat')
load('pde.mat')

load('agents_1.mat')
U_plot=U;
I_plot=I;
Tcell_plot=Tcell;
c_plot=c;

for k=2:5
    load('agents_'+string(k)+'.mat')
    U_plot=U_plot+U;
    I_plot=I_plot+I;
    Tcell_plot=Tcell_plot+Tcell;
    c_plot=c_plot+c;
end

U_plot=U_plot/5;
I_plot=I_plot/5;
Tcell_plot=Tcell_plot/5;
c_plot=c_plot/5;

n=size(U_plot(:,:,1));
n_mid=(n(1)+1)/2;
   
U_sec=U_plot(:,n_mid,:);
I_sec=I_plot(:,n_mid,:);
Tcell_sec=Tcell_plot(:,n_mid,:);

U_sum=sum(U_plot,[1 2]);
I_sum=sum(I_plot,[1 2]);
T_sum=sum(Tcell_plot,[1 2]);
c_sum=sum(c_plot,[1 2])*delta^2;

U_sum=U_sum(:);
I_sum=I_sum(:);
T_sum=T_sum(:);

minCol=0;
maxColU=max(max(max(U_plot)))/delta^2;
maxColI=max(max(max(I_plot)))/delta^2;
maxColT=max(max(max(Tcell_plot)))/delta^2;
maxSum=max(U_sum);
maxTSum=max(T_sum);

u1_sum=trapz(x,u1'.*x')*2*pi;
u2_sum=trapz(x,u2'.*x')*2*pi;
u3_sum=trapz(x,u3'.*x')*2*pi;

lw=2;

vu=2*sqrt(Du*p);
vi=2*sqrt(Di*(beta*K-q));

clear U
clear I
clear Tcell
clear c
clear U_plot
clear I_plot
clear Tcell_plot
clear c_plot
save('data_multiple')
