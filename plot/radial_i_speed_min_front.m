[~,a]=max(u2(i,:));
[~,b]=min(u2(i,1:a));

ff=interp1(x,u2(i,:),r);
ff(ff<toll_pde)=NaN;
ff(r_mid,r_mid)=ff(r_mid,r_mid+1);
pcolor(xx,yy,ff)
hold on
viscircles([0 0],x(b),'EnhanceVisibility',false,'LineStyle',':','Color',"#77AC30",'LineWidth',2)
hold on
viscircles([0 0],Ri+(i-1)*vi,'EnhanceVisibility',false,'LineStyle','--','Color',"#D95319")
hold on
ind_pde=find(u2(i,:)>1/delta^2,1,'last');
if isempty(ind_pde)==0
    viscircles([0 0],ind_pde/length(x)*L,'EnhanceVisibility',false,'LineStyle','--')
end
colorbar
colormap(plasma(512))
shading flat
grid off
axis square
axis([-L_plot L_plot -L_plot L_plot])
caxis([minCol,maxColI])
% title('Uninfected (PDE)')
set(gca,'FontSize',12)
set(gca,'fontname',"Lucida Bright") 