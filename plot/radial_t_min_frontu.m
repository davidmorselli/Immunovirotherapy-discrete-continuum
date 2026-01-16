[~,a]=max(u3(i,:));
[~,b]=min(u3(i,1:a));

ff=interp1(x,u3(i,:),r);
ff(ff<toll_pde)=NaN;
ff(r_mid,r_mid)=ff(r_mid,r_mid+1);
pcolor(xx,yy,ff)
hold on
viscircles([0 0],x(b),'EnhanceVisibility',false,'LineStyle',':','Color',"#77AC30",'LineWidth',2)
hold on
viscircles([0 0],Ru+(i-1)*vu,'EnhanceVisibility',false,'LineStyle','--','Color',"#4DBEEE")
colorbar
colormap(plasma(512))
shading flat
grid off
axis square
axis([-L_plot L_plot -L_plot L_plot])
caxis([minCol,maxColT])
% title('Uninfected (PDE)')
set(gca,'FontSize',12)
set(gca,'fontname',"Lucida Bright") 