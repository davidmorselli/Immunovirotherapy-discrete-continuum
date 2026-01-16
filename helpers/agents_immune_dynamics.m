for i=Tstart+1:Tend+1
   P=U_temp+I_temp;
   U_temp=randomwalk(U_temp,theta_1);
   I_temp=randomwalk(I_temp,theta_2);
   Tc_temp=chemotaxisdiffusion(Tc_temp,c_temp,theta_T,nu,cstar);

   U_temp=birth_death(U_temp, P, K*delta^2, p*tau, 0);
   I_temp=birth_death(I_temp, P, K*delta^2, 0, q*tau);
   Tc_temp=birth_death(Tc_temp, P, K*delta^2, 0, qT*tau);
   Tc_temp=inflow(Tc_temp,(S_z+alphaz*sum(I_temp,'all'))*delta^2*tau,vessel);

   [U_temp,I_temp] = infection(U_temp, I_temp, beta*tau/delta^2);

   U_temp=T_kill(U_temp, Tc_temp, zU*tau/delta^2);
   I_temp=T_kill(I_temp, Tc_temp, zI*tau/delta^2);
    
   for j=1:iter_c
       c_temp=c_dynamics(c_temp,Dc_ag,I_temp,alphac*tau_c/delta^2,U_temp,gammac*tau_c/delta^2,cstar,qc*tau_c);
   end


    if any(any(isnan(U_temp))) || any(any(isnan(I_temp))) || any(any(isnan(Tc_temp)))
        i
    end
    
    %we only save iterations at integer times
    t=(i-1)*tau;
    if t==floor(t)
        U(:,:,t+1)=U_temp;
        I(:,:,t+1)=I_temp;
        Tcell(:,:,t+1)=Tc_temp;
        c(:,:,t+1)=c_temp;

% % Plotting figures could be helpful when testing the code         
%         figure(1)
%         sgtitle('t='+string(t))
%         subplot(2,2,1)
%         surf(xx,yy,U_temp/delta^2)
%         shading flat
%         axis square
%         colorbar
%         view(2)
% 
%         subplot(2,2,2)
%         surf(xx,yy,I_temp/delta^2)
%         shading flat
%         axis square
%         colorbar
%         view(2)
% 
% 
%         subplot(2,2,3)
%         surf(xx,yy,Tc_temp/delta^2)
%         shading flat
%         axis square
%         colorbar
%         view(2)
% 
% 
%         subplot(2,2,4)
%         surf(xx,yy,c_temp)
%         shading flat
%         axis square
%         colorbar
%         view(2)
    end
end