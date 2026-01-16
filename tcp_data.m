sums_U=zeros(1501,100);
sums_I=sums_U;

for i=1:100
    i
     load('agents_'+string(i)+'.mat')
     su=sum(sum(U));
     sums_U(:,i)=su(:);
     si=sum(sum(I));
     sums_I(:,i)=si(:);
end

fsize=14; %font size
lw=2; %line width

save('agents_sums.mat','sums_U','sums_I','fsize','lw')