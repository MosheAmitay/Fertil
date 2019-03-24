%this script cleans the data of the chemicals sa,ples and return a new file
%with the cleaned data, per patient.

%read the data from the file, choose aspecific sheet phenols or phtalates
[numData,txtData,rowData]= xlsread('F.xlsx','sheet name');
clientID=rowData(:,2);%read the clientID
numLines=size(clientID,1);
idNumbers=zeros(130,1);
for id=3:numLines
    idNumbers(id)=str2num(clientID{id,:}(1:4));
end
 [~, indUnique] = unique(idNumbers(:, 1), 'rows');%find the indices of duplicates
 numUnique=size(indUnique,1);
cleanedData=zeros(numUnique,13);
 for newId=2:numUnique-1%for each patient id 
   if indUnique(newId)~= indUnique(newId+1)-1%for repetative samples
       numRows=indUnique(newId+1)-indUnique(newId);
       fixedID=idNumbers(indUnique(newId));
       avgData=mean(numData(newId:newId+numRows-1,3:14));
       cleaned=[fixedID,avgData];
       cleanedData(newId,1)=fixedID;
       cleanedData(newId,2:13)=avgData;
   else
       fixedID=idNumbers(indUnique(newId));%for non repetative samles
       avgData=numData(newId,3:14);
       cleaned=[fixedID,avgData];
       cleanedData(newId,1)=fixedID;
       cleanedData(newId,2:13)=avgData;
   end
 end
 last=indUnique(numUnique);
  if indUnique(numUnique)==numLines%for the last patient
      fixedID=idNumbers(130);
      dataLast=rowData(130,3:14);
      cleanedData(numUnique,1)=fixedID;
      cleanedData(numUnique,2:13)=avgData;
 end
xlswrite('fixedDataPht',cleanedData);%write to a new file
