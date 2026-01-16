for k=Tstart+1:Tend+1
    rho=(u+i);

    % DIFFUSION
    u_destra=[u(2:Nx);0];
    Fu=-Du*(u_destra-u)/dx.*xmezzi(:);
    u=u+dt/dx*([0; Fu(1:Nx-1)]-[Fu(1:Nx-1); 0])./x(:);


    i_destra=[i(2:Nx);0];
    Fi=-Di*(i_destra-i)/dx.*xmezzi(:);
    i=i+dt/dx*([0; Fi(1:Nx-1)]-[Fi(1:Nx-1); 0])./x(:);

    c_destra=[c(2:Nx);0];
    Fc=-Dc*(c_destra-c)/dx.*xmezzi(:);
    c=c+dt/dx*([0; Fc(1:Nx-1)]-[Fc(1:Nx-1); 0])./x(:);
    
    % CHEMOTAXIS AND DIFFUSION
    c_destra=[c(2:Nx);0];
    z_destra=[z(2:Nx);0];
    w=chiT*(c_destra-c)/dx.*xmezzi(:);
    Fz=max(w,0).*z-max(-w,0).*z_destra-DT*(z_destra-z)/dx;
    z=z+(dt/dx)*([0; Fz(1:Nx-1)]-[Fz(1:Nx-1); 0])./x(:);


    % REACTION
    i_int=trapz(x,i.*x')*2*pi;
    
    u=u+dt*(p*(1-rho./K).*u-beta*u.*i-zU*u.*z);
    i=i+dt*(beta*u.*i-q*i-zI*i.*z);
    z=z+dt*(-qT*z+alphaz*i_int+S_z);

    c=c+dt*((alphac*i+gammac*u).*(cstar-c)-qc*c);
    


    if (mod(k,1/dt)==0)
        ind=round(k*dt+1);
        u1(:,ind)=u;
        u2(:,ind)=i;
        u3(:,ind)=z;
        u4(:,ind)=c;
        
    end

end