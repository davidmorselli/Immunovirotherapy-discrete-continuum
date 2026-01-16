% mycolors=[0 0.4470 0.7411
%     0.3843 0.7333 0.2745];
% 
% colororder(mycolors)
% 
% yyaxis left
plot(0:i-1,U_sum(1:i),'LineWidth',lw)
hold on
plot(0:i-1,u1_sum(1:i),'k:','LineWidth',lw)
hold on
plot(0:i-1,I_sum(1:i),'r','LineWidth',lw)
hold on
plot(0:i-1,u2_sum(1:i),'k:','LineWidth',lw)
hold on
plot(0:i-1,T_sum(1:i),'Color',"#62BB46",'LineWidth',lw)
hold on
plot(0:i-1,u3_sum(1:i),'k:','LineWidth',lw)
axis([0 T_pde 0 maxSum])
% title('$t=\,$'+string(i-1)+'$\;$h','FontSize',20,'FontName',"Lucida Bright",'interpreter','latex')
ylabel('Cell number','FontSize',16,'interpreter','latex')
xlabel("h",'FontSize',16,'interpreter','latex')



% ylabel('Immune cells','FontSize',16,'interpreter','latex')
axis square

set(gca,'FontSize',14)
set(gca,'fontname',"Times New Roman") 
set(gcf,'color','w');