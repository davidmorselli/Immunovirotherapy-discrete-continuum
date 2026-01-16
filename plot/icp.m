for i=1:length(dir)
    load(dir(i)+'\agents_sums.mat')
    isext=(sums_I==0);
    numext=sum(isext,2);
    plot(0:1500,numext/100,'Color',cols(i,:),'Linewidth',2,'LineStyle',linestyle(i))
    hold on

    load(dir(i)+"\c_pde.mat")
    u2_sum=trapz(x,u2'.*x')*2*pi;
    plot(0:1500,exp(-u2_sum),':','Color',cols(i,:),'Linewidth',2)
end
axis square

xlabel("h",'FontSize',16,'interpreter','latex')
ylabel('ICP','FontSize',16,'interpreter','latex')

set(gca,'FontSize',14)
set(gca,'fontname',"Times New Roman") 
set(gcf,'color','w');