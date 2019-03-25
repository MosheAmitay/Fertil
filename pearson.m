function [R] = pearson(X,Y)
R=zeros(3,24);
%Deletion of NaNs in data
A=find(isnan(X)==1);
for j=size(A):-1:1
        X(A(j),:)=[];
        Y(A(j),:)=[];    
end
%Pearson and Spearman testing 
for i=1:24
    R(1,i)=corr2(X,Y(:,i));
    [rho,pval] = corr(X,Y(:,i), 'type', 'Spearman');
    R(2,i)=rho;
    R(3,i)=pval;
end
end
