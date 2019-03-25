%Mann Whitney testing (for non-normal distribution) for =/>0
function [R] = Mann(X,Y)
R=zeros(2,24);
for i=1:24
    t=Y(find(X),i); 
    f=Y(find(X==0),i);
    [pt,ht] = ranksum(t,f);
    R(1,i)=pt;
    R(2,i)=ht;
end
end