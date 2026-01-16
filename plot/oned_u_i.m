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



plot(-L:delta:L,U_sec(:,i)/delta^2,'LineWidth',1.5,'Color',"#0072BD")
hold on
plot(x,u1(i,:),'k:','LineWidth',lw)
hold on
plot(-x(end:-1:1),u1(i,end:-1:1),'k:','LineWidth',lw)
hold on
yline(ustar,'LineWidth',1)
hold on
xline(Ru+(i-1)*vu,'--','LineWidth',1,'Color',"#4DBEEE")
hold on
xline(-Ru-(i-1)*vu,'--','LineWidth',1,'Color',"#4DBEEE")
hold on
xline(Ri+(i-1)*vi,'--','LineWidth',1,'Color',"#D95319")
hold on
xline(-Ri-(i-1)*vi,'--','LineWidth',1,'Color',"#D95319")
hold on
yline(ubar,'--','LineWidth',1,'Color',"#EDB120")
hold on
yline(istar,'LineWidth',1)
plot(-L:delta:L,I_sec(:,i)/delta^2,'LineWidth',lw,'Color','Red')
hold on
plot(x,u2(i,:),'k:','LineWidth',lw)
hold on
plot(-x(end:-1:1),u2(i,end:-1:1),'k:','LineWidth',lw)
% hold on
% plot(-L:delta:L,Tcell_sec(:,i)/delta^2,'LineWidth',lw,'Color',"#62BB46")
% hold on
% plot(x,u3(i,:),'k:','LineWidth',lw)
% hold on
% plot(-x(end:-1:1),u3(i,end:-1:1),'k:','LineWidth',lw)

% title('$t=\,$'+string(i-1)+'$\;$h','FontSize',20,'FontName',"Lucida Bright",'interpreter','latex')
ylabel('Cells/mm$^2$','FontSize',16,'interpreter','latex')
xlabel("mm",'FontSize',16,'interpreter','latex')

axis([-L L 0 maxplot])

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