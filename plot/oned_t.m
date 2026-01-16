beta=beta*K;
zU=zU*K;
zI=zI*K;
% alphazbis=alphaz*50*pi;
radius=find(u2(i,:)>1/delta^2,1,'last')/length(x)*L;
alphazbis=alphaz*radius^2*pi;


istar=((beta-q)*p*qT*K-S_z*(beta*zU+p*zI))/(beta*((p*zI/beta+zU)*alphazbis+qT*(beta+p)));
zstar=istar*alphazbis/qT+S_z/qT;
ustar=1/beta*(K*q+zI*zstar);

ubar=(q+p)/beta*K;
ustarbis=q*K/beta;
istarbis=p*K*(beta-q)/beta/(beta+p);

% u_star=K-zU*S_z/p/qT;
% z_star=S_z/qT;

beta=beta/K;
zU=zU/K;
zI=zI/K;


plot(-L:delta:L,Tcell_sec(:,i)/delta^2,'LineWidth',1.5,'Color',"#62BB46")
hold on
plot(x,u3(i,:),'k:','LineWidth',lw)
hold on
plot(-x(end:-1:1),u3(i,end:-1:1),'k:','LineWidth',lw)
hold on
yline(zstar)
maxplot=3500*(i<401)+1700*(i>400);
axis([-L L 0 maxplot])

ylabel('Cells/mm$^2$','FontSize',16,'interpreter','latex')
xlabel("mm",'FontSize',16,'interpreter','latex')

% plot(-L:delta:L,Tcell_sec(:,i)/delta^2,'LineWidth',lw)
% hold on
% plot(x,u3(i,:),'k:','LineWidth',lw)
% hold on
% plot(-x(end:-1:1),u3(i,end:-1:1),'k:','LineWidth',lw)
% hold on
% % yline(S_z/qT, 'Color', "#77AC30", 'LineWidth',lw)
% yline(S_z/qT)
% ylabel('Immune cells/mm$^2$','FontSize',16,'interpreter','latex')
% axis([-L L 0 100])
axis square

set(gca,'FontSize',fsize)
set(gca,'fontname',"Times New Roman") 
set(gcf,'color','w');