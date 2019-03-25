
%Checking correlations between different phthalates
[numDataPht,txtDataPht,rowDataPht]= xlsread('fixedDataPht.xls');%read the data from the file
numDataPht(:,1)=[];
matPht=zeros(12,12);
for i=1:12
    for j=1:12
        matPht(i,j)=corr2(numDataPht(:,i),numDataPht(:,j));
    end
end

%Checking correlations betwrrn different phenoles
[numDataPhn,txtDataPhn,rowDataPhn]= xlsread('fixedDataPhenols.xls');%read the data from the file
numDataPhn(:,1)=[];
matPhn=zeros(12,12);
for i=1:12
    for j=1:12
        matPhn(i,j)=corr2(numDataPhn(:,i),numDataPhn(:,j));
    end
end

%Checking correlations betwrrn phthalates and phenoles
mattn=zeros(12,12);
for i=1:12
    for j=1:12
        mattn(i,j)=corr2(numDataPht(:,i),numDataPhn(:,j));
    end
end

[numDataC,txtDataC,rowDataC]= xlsread('clinical_data.xlsx','dataset');%read the data from the file
tn=[numDataPht,numDataPhn];

filen = 'peardata.xlsx';
de={'Age';'BMI';'G';'P';'yrs_infert';'Day_3_E2';'Peak_E2';'day_of_simulation';'top_quality_embryos';
    'slow_embryos';'accelerated_embryos';'fol_15mm';'max_end';'nu_cells_day2';'nu_cells_day3';'nu_of_gestational_sacs';
    'week_of_abortion';'nu_of_newborns';'non_fret';'Yrs_Infert';'nu_MII';'nu_MI';'nu_GV';'nu_At';};
%Pearson
Age=pearson(numDataC(:,7),tn);
de(1,2:25)=num2cell(Age(3,:));
BMI=pearson(numDataC(:,8),tn);
de(2,2:25)=num2cell(BMI(3,:));
G=pearson(numDataC(:,11),tn);
de(3,2:25)=num2cell(G(3,:));
P=pearson(numDataC(:,12),tn);
de(4,2:25)=num2cell(P(3,:));
yrs_infert=pearson(numDataC(:,16),tn);
de(5,2:25)=num2cell(yrs_infert(3,:));
Day_3_E2=pearson(numDataC(:,18),tn);
de(6,2:25)=num2cell(Day_3_E2(3,:));
Peak_E2=pearson(numDataC(:,19),tn);
de(7,2:25)=num2cell(Peak_E2(3,:));
day_of_simulation=pearson(numDataC(:,21),tn);
de(8,2:25)=num2cell(day_of_simulation(3,:));
top_quality_embryos=pearson(numDataC(:,22),tn);
de(9,2:25)=num2cell(top_quality_embryos(3,:));
slow_embryos=pearson(numDataC(:,23),tn);
de(10,2:25)=num2cell(slow_embryos(3,:));
accelerated_embryos=pearson(numDataC(:,24),tn);
de(11,2:25)=num2cell(accelerated_embryos(3,:));
fol_15mm=pearson(numDataC(:,28),tn);
de(12,2:25)=num2cell(fol_15mm(3,:));
max_end=pearson(numDataC(:,29),tn);
de(13,2:25)=num2cell(max_end(3,:));
nu_cells_day2=pearson(numDataC(:,34),tn);
de(14,2:25)=num2cell(nu_cells_day2(3,:));
nu_cells_day3=pearson(numDataC(:,35),tn);
de(15,2:25)=num2cell(nu_cells_day3(3,:));
nu_of_gestational_sacs=pearson(numDataC(:,48),tn);
de(16,2:25)=num2cell(nu_of_gestational_sacs(3,:));
week_of_abortion=pearson(numDataC(:,50),tn);
de(17,2:25)=num2cell(week_of_abortion(3,:));
nu_of_newborns=pearson(numDataC(:,52),tn);
de(18,2:25)=num2cell(nu_of_newborns(3,:));
non_fret=pearson((numDataC(:,38)-numDataC(:,39)),tn);
de(19,2:25)=num2cell(non_fret(3,:));


filename = 'testdata.xlsx';
dep={'MA';'positive_beta';'delivery';'smoking';'pregnancy';'clinical_pregnancy';'missed_abortion'};

%MWW
MA=Mann(numDataC(:,14),tn);
dep(1,2:25)=num2cell(MA(2,:));
positive_beta=MWW(numDataC(:,46),tn);
dep(2,2:25)=num2cell(positive_beta(2,:));
delivery=MWW(numDataC(:,51),tn);
dep(3,2:25)=num2cell(delivery(2,:));
smoking=MWW(numDataC(:,9),tn);
dep(4,2:25)=num2cell(smoking(2,:));
pregnancy=MWW(numDataC(:,45),tn);
dep(5,2:25)=num2cell(pregnancy(2,:));
clinical_pregnancy=MWW(numDataC(:,47),tn);
dep(6,2:25)=num2cell(clinical_pregnancy(2,:));
missed_abortion=MWW(numDataC(:,49),tn);
dep(7,2:25)=num2cell(missed_abortion(2,:));

xlswrite(filename,dep);

%Day_1=chi2(numDataC(:,33),tn);

%percent
yrs_infert_p=per(numDataC(:,16),numDataC(:,7));
nu_MII_p=per(numDataC(:,40),numDataC(:,38));
nu_MI_p=per(numDataC(:,41),numDataC(:,38));
nu_GV_p=per(numDataC(:,42),numDataC(:,38));
nu_At_p=per(numDataC(:,43),numDataC(:,38));

%pearson after percent
Yrs_Infert=pearson(yrs_infert_p,tn);
de(20,2:25)=num2cell(Yrs_Infert(3,:));
nu_MII=pearson(nu_MII_p,tn);
de(21,2:25)=num2cell(nu_MII(3,:));
nu_MI=pearson(nu_MI_p,tn);
de(22,2:25)=num2cell(nu_MI(3,:));
nu_GV=pearson(nu_GV_p,tn);
de(23,2:25)=num2cell(nu_GV(3,:));
nu_At=pearson(nu_At_p,tn);
de(24,2:25)=num2cell(nu_At(3,:));

xlswrite(filen,de);


