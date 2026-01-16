pcolor(xx,yy,Tcell_plot(:,:,i)/delta^2)
hold on
[~,a]=max(u3(i,:));
[~,b]=min(u3(i,1:a));
viscircles([0 0],x(b),'EnhanceVisibility',false,'LineStyle',':','Color',"#77AC30",'LineWidth',2)
hold on
viscircles([0 0],Ru+(i-1)*vu,'EnhanceVisibility',false,'LineStyle','--','Color',"#4DBEEE",'LineWidth',3)
% hold on
% ind_pde=find(u3(i,:)>1/delta^2,1,'last');
% viscircles([0 0],ind_pde/length(x)*L,'EnhanceVisibility',false,'LineStyle','--')
colormap(plasma(512))
shading flat
grid off
axis square
axis([-L_plot L_plot -L_plot L_plot])
caxis([minCol,maxColT])
% c=colorbar;
colorbar('Location','southoutside')
colormap(plasma(512))
% title('Immune cells')
set(gca,'FontSize',fsize)
set(gca,'fontname',"Times New Roman") 

set(gcf,'color','w');
% set(c, 'YTickLabel', cellstr(num2str(reshape(get(c, 'YTick'),[],1),'%0.f')) )