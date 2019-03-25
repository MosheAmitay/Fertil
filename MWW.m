% Mann Whitney testing for yes/no
function [R] = MWW(X,Y)
R=zeros(2,24);
for i=1:24
    t=Y(find(X),i);
    f=Y(find(1-X),i);
    [p,h] = ranksum(t,f);
    R(1,i)=p;
    R(2,i)=h; 
end
end