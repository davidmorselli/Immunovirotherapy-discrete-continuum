mycolors=[0 0.4470 0.7410
    0.3843 0.7333 0.2745];
% mycolors=[0 0 1
%     0.3843 0.7333 0.2745];

colororder(mycolors)

yyaxis left
plot(0:i-1,U_sum(1:i),'LineWidth',lw)
hold on
plot(0:i-1,u1_sum(1:i),'k:','LineWidth',lw)
axis([0 T_pde 0 maxSum])
% title('$t=\,$'+string(i-1)+'$\;$h','FontSize',20,'FontName',"Lucida Bright",'interpreter','latex')
ylabel('Tumour cells','FontSize',16,'interpreter','latex')


yyaxis right
plot(0:i-1,T_sum(1:i),'Color',mycolors(2,:),'LineWidth',lw)
hold on
plot(0:i-1,u3_sum(1:i),'k:','LineWidth',lw)
ylabel('Immune cells','FontSize',16,'interpreter','latex')
xlabel("h",'FontSize',16,'interpreter','latex')

axis([0 T_pde 0 5.5*maxTSum])
axis square

set(gca,'FontSize',14)
set(gca,'fontname',"Times New Roman") 
set(gcf,'color','w');