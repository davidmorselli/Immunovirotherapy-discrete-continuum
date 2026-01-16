% sgtitle('$t=\,$'+string(i-1),'FontSize',20,'FontName',"Lucida Bright",'interpreter','latex')
% set(gca,'fontname',"Lucida Bright") 
% subplot(1,2,1)
plot(-L/2:delta:L/2,U_plot(:,i)/delta,'LineWidth',1.5,'Color',"#0072BD")
hold on
plot(-L/2:delta:L/2,I_plot(:,i)/delta,'LineWidth',1.5)
hold on
plot(-L/2:xstep:L/2,u1(i,:),'k:','LineWidth',lw)
hold on
plot(-L/2:xstep:L/2,u2(i,:),'k:','LineWidth',lw)
hold on
yline(q/beta,'LineWidth',1)
hold on
xline(Ru+(i-1)*vu,'--','LineWidth',1,'Color',"#4DBEEE")
hold on
xline(-Ru-(i-1)*vu,'--','LineWidth',1,'Color',"#4DBEEE")
hold on
yline(q/beta+Du*p/Di/beta,'--','LineWidth',1,'Color',"#EDB120")
hold on
yline(p*(beta*K-q)/beta/(beta*K+p),'LineWidth',1)
hold on
xline(Ri+(i-1)*vi,'--','LineWidth',1,'Color',"#A2142F")
hold on
xline(-Ri-(i-1)*vi,'--','LineWidth',1,'Color',"#A2142F")
axis([-L/2 L/2 minAx maxAx])
axis square
% xlabel("mm")
set(gca,'FontSize',fsize)
set(gca,'fontname',"Times New Roman") 
ylabel('cells/mm','FontSize',16)
xlabel("mm",'FontSize',16,'interpreter','latex')


set(gcf,'color','w');
