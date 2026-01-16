pcolor(xx,yy,c_plot(:,:,i))
hold on
ind_pde=find(u2(i,:)>1/delta^2,1,'last');
if isempty(ind_pde)==0
    viscircles([0 0],ind_pde/length(x)*L,'EnhanceVisibility',false,'LineStyle','--')
    hold on
end
viscircles([0 0],Ru+(i-1)*vu,'EnhanceVisibility',false,'LineStyle','--','Color',"#4DBEEE")
colorbar
colormap(plasma(512))
shading flat
grid off
axis square
axis([-L_plot L_plot -L_plot L_plot])
caxis([minCol,cstar])
% title('Uninfected (PDE)')
set(gca,'FontSize',12)
set(gca,'fontname',"Lucida Bright") 