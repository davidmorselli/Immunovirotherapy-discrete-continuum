for i=1:length(dir)

    load(dir(i)+'\agents_sums.mat')
    
    isext=(sums_U==0);
    numext=sum(isext,2);
    plot(0:1500,numext/100,'Color',cols(i,:),'Linewidth',2,'LineStyle',linestyle(i))
    max(numext)
    hold on
    % plot(0:1500,exp(-avg_sum_U),'--',Color=a(i,:))

    load(dir(i)+"\c_pde.mat")
    u1_sum=trapz(x,u1'.*x')*2*pi;
    plot(0:1500,exp(-u1_sum),':','Color',cols(i,:),'Linewidth',2)


end

axis square

xlabel("h",'FontSize',16,'interpreter','latex')
ylabel('TCP','FontSize',16,'interpreter','latex')

set(gca,'FontSize',14)
set(gca,'fontname',"Times New Roman") 
set(gcf,'color','w');
