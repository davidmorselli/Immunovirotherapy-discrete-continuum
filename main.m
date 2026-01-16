clearvars

nameDir="./"; %Change if results should be in a different directory
addpath(genpath('./helpers'))

L=10;
T_pde=1500; %total time
T_second=200; %time of second viral injection or parameter variation

parameters_immunoviro

cell_uninf=Ru; 
cell_inf=Ri; 
h_uninf=0.9*K;
h_inf=0.1*K;

%Discretisation for agents
delta=0.1; %mm
tau=0.02;

%Discretisation for PDE
dx=0.01;
dt=1e-4;

iter_c=1; %if greater than 1, multiple iterations are performed for c

save(nameDir+"parameters")

%%
%AGENT-BASED MODEL

tic
seed=1; %Spanning from 1 to 5 or 10, occasionaly up to 100
rng(seed)
agents_immune_initial

Tstart=0;
%Tend=T_pde/tau;
Tend=T_second/tau;
agents_immune_dynamics

%Change of parameters
zU=zU*10;
zI=zI*10;

%Second viral injection
%I_temp=I_temp+floor(0.3*U_temp);
%U_temp=ceil(0.7*U_temp);

%Additional immune inflow
%Tc_temp=inflow(Tc_temp,0.5,vessel);

Tstart=Tend+1;
Tend=T_pde/tau;
agents_immune_dynamics

time_agents=toc
save(nameDir+"agents_"+string(seed),'time_agents','seed','U','I','Tcell','c')

save(nameDir+"Ufinal_"+string(seed),'seed','U_temp')
%%
%PDE

tic
pde_immune_initial


Tstart=0;
Tend=200/dt;
pde_immune_dynamics

%Change of parameters
zU=zU*10;
zI=zI*10;

%Second viral injection
%i=i+0.3*u;
%u=0.7*u;

Tstart=Tend+1;
Tend=T_pde/dt;
pde_immune_dynamics

t=0:T_pde;
u1=u1';
u2=u2';
u3=u3';
u4=u4';

time_pde=toc
save(nameDir+"pde",'t','x','u1','u2','u3','u4','time_pde','dx','dt')



