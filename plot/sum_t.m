plot(0:i-1,T_sum(1:i),'LineWidth',lw,'Color',"#62BB46")
hold on
plot(0:i-1,u3_sum(1:i),'k:','LineWidth',lw)
axis([0 T_pde 0 maxTSum])

title('Immune cell number')
set(gca,'FontSize',12)
set(gca,'fontname',"Lucida Bright") 