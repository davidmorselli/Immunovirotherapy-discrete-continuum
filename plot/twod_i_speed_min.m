pcolor(xx,yy,I_plot(:,:,i)/delta^2)
hold on
[~,a]=max(u2(i,:));
[~,b]=min(u2(i,1:a));
viscircles([0 0],x(b),'EnhanceVisibility',false,'LineStyle',':','Color',"#77AC30",'LineWidth',2)
hold on
viscircles([0 0],Ri+(i-1)*vi,'EnhanceVisibility',false,'LineStyle','--','Color',"#4DBEEE")
colormap(plasma(512))
shading flat
grid off
axis square
axis([-L_plot L_plot -L_plot L_plot])
caxis([minCol,maxColI])
colorbar
colormap(plasma(512))
title('Infected cells')
set(gca,'FontSize',fsize)
set(gca,'fontname',"Times New Roman") 

set(gcf,'color','w');