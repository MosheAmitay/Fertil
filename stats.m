[numData,txtData,rowData]= xlsread('fixedDataPhenols.xls');%read the data from the filec
numData(1,:) = [];%delete empty cells
%mean 
meanMatrix=zeros(1,13);
for m=2:13
    meanMatrix(1,m)=mean(numData(:,m));
end
%geometric mean
geoMatrix=zeros(1,13);
for g=2:13
    vals=abs(numData(:,g));
    geoMatrix(1,g)=geomean(vals);
end
%std
stdMatrix=zeros(1,13);
for s=2:13
   stdMatrix(1,s)=std(numData(:,s));
end
%range
rangeMatrix=zeros(1,13);
for r=2:13
   rangeMatrix(1,r)=range(numData(:,r));
end
%distance from the average
distMatrix=zeros(108,13);
dist=numData(:,3)-meanMatrix(1,3);
for d=2:13
    distMatrix(:,d)=numData(:,d)-meanMatrix(1,d);
end



