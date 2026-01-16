pcolor(xx,yy,U_plot(:,:,i)/delta^2)
hold on
[~,a]=max(u1(i,:));
[~,b]=min(u1(i,1:a));
viscircles([0 0],x(b),'EnhanceVisibility',false,'LineStyle',':','Color',"#77AC30",'LineWidth',2)
hold on
viscircles([0 0],Ru+(i-1)*vu,'EnhanceVisibility',false,'LineStyle','--','Color',"#4DBEEE")
colorbar('Location','southoutside')
colormap(plasma(512))
shading flat
grid off
axis square
axis([-L_plot L_plot -L_plot L_plot])
caxis([minCol,maxColU])
view(2)
% title('Uninfected cells')
set(gca,'FontSize',fsize)
set(gca,'fontname',"Times New Roman") 

set(gcf,'color','w');