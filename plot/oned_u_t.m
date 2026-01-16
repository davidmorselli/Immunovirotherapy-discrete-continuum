mycolors=[0 0.4470 0.7411
    0.3843 0.7333 0.2745];

colororder(mycolors)

yyaxis left
plot(-L:delta:L,U_sec(:,i)/delta^2,'LineWidth',1.5)
hold on
plot(x,u1(i,:),'k:','LineWidth',lw)
hold on
plot(-x(end:-1:1),u1(i,end:-1:1),'k:','LineWidth',lw)
hold on
yline(K*(1-zU/p*u3(i,1)))
hold on
xline(Ru+(i-1)*vu,'--','LineWidth',1,'Color',"#4DBEEE")
hold on
xline(-Ru-(i-1)*vu,'--','LineWidth',1,'Color',"#4DBEEE")
% title('$t=\,$'+string(i-1)+'$\;$h','FontSize',20,'FontName',"Lucida Bright",'interpreter','latex')
ylabel('Tumour cells/mm$^2$','FontSize',16,'interpreter','latex')
axis([-L L 0 maxColU])

yyaxis right
plot(-L:delta:L,Tcell_sec(:,i)/delta^2,'LineWidth',1.5)
hold on
plot(x,u3(i,:),'k:','LineWidth',lw)
hold on
plot(-x(end:-1:1),u3(i,end:-1:1),'k:','LineWidth',lw)
hold on
% yline(S_z/qT, 'Color', "#77AC30", 'LineWidth',lw)
yline(S_z/qT)
ylabel('Immune cells/mm$^2$','FontSize',16,'interpreter','latex')
xlabel("mm",'FontSize',16,'interpreter','latex')

axis([-L L 0 maxColT])
axis square

set(gca,'FontSize',14)
set(gca,'fontname',"Times New Roman") 
set(gcf,'color','w');

