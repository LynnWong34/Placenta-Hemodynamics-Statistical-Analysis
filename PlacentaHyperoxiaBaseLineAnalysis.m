% This program will process the baseline data for all the visits (all trimesters)
% We read in all the 10 frames baseline data to prepare for stability test

% We define the last 4-frame-window during baseline as hyperoxia baseline
% for further statistical analysis
% Here, 'HyperBase' is the mean of StO2/HbT/HbO2 in the final 4-frame-window during baseline
% HyperBase matrix also contains other information and clinical data 

% Note! Now we only have third trimester, but the program is designed to
% process all the trimesters.

% create folder for saving figures
sdir_bl_all=[sdir '\\Baseline_AllT'];
mkdir(sdir_bl_all);

%Plact_Base array which have the information of baseline raw data 
Placenta_Base=zeros(Num_Sub*10,10);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1 SubjectNo(not ID)    2 SubjectID 
% 3 VisitNo              4 Marker
% 5 Frame Situation      6 Placenta StO2
% 7 Placenta HbT         8 Placenta HbO2
% 9 Placenta layer A     10 Placenta layer b
% 11 Placenta layer curve 12 Placenta Depth
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Placenta_Base(:,1:5)=table2array(BaseData(:,2:6));
Placenta_Base(:,6:8)=table2array(BaseData(:,7:9));
Placenta_Base(:,9)=table2array(BaseData(:,10));
Placenta_Base(:,10)=table2array(BaseData(:,11));
Placenta_Base(:,11)=table2array(BaseData(:,15));
Placenta_Base(:,12)=table2array(BaseData(:,16));

% Placenta_HyerBase array is the hyperoxia basewindow data
% Here hyperoxia basewindow is define as the last 4-frame-window of baseline 
% Note, the total baseline measurement have 10 frames data, 
% But only the hyperoxia basewindow data is used for calculating baseline mean (s.d.)
% of maternal hyperoxia experiment
% The full 10 frames are used for stability test
Placenta_HyperBase=zeros(Num_Sub,22);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1 SubjectNo(not ID)     2 SubjectID 
% 3 VisitNo               4 Marker
% 5 Mean(StO2_Plact)      6 SD(StO2_Plact)
% 7 Mean(THC_Plact)       8 SD(THC_Plact)
% 9 Mean(HbO2_Plact)      10 SD(HbO2_Plact)
% 11 Placenta layer A     12 Placenta layer b
% 13 mean of artery uterin doppler PI
% 14 standard devation of artery uterin doppler PI
% 15 Pregnancy Outcome    16 Pathology Outcome
% 17 measurement GA       18 First Prenatal BMI
% 19 maternal age         20 delivery GA
% 21 Fetal birthweight    22 Nulliparity, 1 means first pregnancy, 0 means not 
% 23 Placenta layer curve 24 Placenta Depth
% 25 Placenta_mua_785    26 Placenta_mua_808
% 27 Placenta_mua_830    28 Placenta_musp_785
% 29 Placenta_musp_808    30 Placenta_musp_830   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Get extinction coefficients of water
WaterFraction = [0.23 0.76 0.76];
LipidFraction = [0.716 0 0];
lambdas=[786 808 830];
num_lambdas=length(lambdas);
load newwater.dat;
for i = 1:length(lambdas)
    indW = newwater(:,1) == lambdas(i);   
    MuaB(i) = newwater(indW,2);
end
%Get extinction coefficients of lipid
num_lambdas=length(lambdas);
load LipidAbsorption.mat;
for i = 1:length(lambdas)
    indL = LipidAbsorption(:,1) == lambdas(i);   
    MuaL(i) = LipidAbsorption(indL,2);
end
%Get extinction coefficients of blood in units of 1/(cm*M).
[eHBO2,eHB]=getextinctioncoef(lambdas);
eHBO2=eHBO2*1e-6;
eHB=eHB*1e-6;


% Define a hyperoxia basewindow which is the last 4-frame-window of baseline 
Ind_Baseline=7:10;
Ind_Start=6;
%len_base is how many frames valuable in each subject's hyperoxia basewindow
len_base=zeros(Num_Sub);
for measnum=1:1:Num_Sub
    measind=(measnum-1)*10+1:(measnum-1)*10+10;
    Placenta_HyperBase(measnum,1:4)=Placenta_Base(10*measnum,1:4);
    tem_Plact_HyperBase=Placenta_Base(measind,:);
    % use the frames who has situation code <5 in the basewindow
    [inindoutcome100,rhoind]=find(tem_Plact_HyperBase(Ind_Baseline,6)>0 & tem_Plact_HyperBase(Ind_Baseline,5)<5);
    if isempty(inindoutcome100)
        Placenta_HyperBase(measnum,5:10)=0;
    else
        inindoutcome100=inindoutcome100+Ind_Start;
        len_base(measnum)=length(inindoutcome100);
        Placenta_HyperBase(measnum,5)=mean(tem_Plact_HyperBase(inindoutcome100,6));
        Placenta_HyperBase(measnum,6)=std(tem_Plact_HyperBase(inindoutcome100,6));
        Placenta_HyperBase(measnum,7)=mean(tem_Plact_HyperBase(inindoutcome100,7));
        Placenta_HyperBase(measnum,8)=std(tem_Plact_HyperBase(inindoutcome100,7));
        Placenta_HyperBase(measnum,9)=mean(tem_Plact_HyperBase(inindoutcome100,8));
        Placenta_HyperBase(measnum,10)=std(tem_Plact_HyperBase(inindoutcome100,8));
        Placenta_HyperBase(measnum,11)=mean(tem_Plact_HyperBase(inindoutcome100,9));
        Placenta_HyperBase(measnum,12)=mean(tem_Plact_HyperBase(inindoutcome100,10));
        Placenta_HyperBase(measnum,23)=mean(tem_Plact_HyperBase(inindoutcome100,11));
        Placenta_HyperBase(measnum,24)=mean(tem_Plact_HyperBase(inindoutcome100,12));
    end
    % find the corresponding clinical data by matching SubjectID
    SubId=Placenta_HyperBase(measnum,2);
    Placenta_HyperBase(measnum,13:14)=table2array(PlacentaClinicalData(PlacentaClinicalData.SubjectID==SubId,7:8));
    Placenta_HyperBase(measnum,15:16)=table2array(PlacentaClinicalData(PlacentaClinicalData.SubjectID==SubId,14:15));
    Placenta_HyperBase(measnum,17)=table2array(PlacentaClinicalData(PlacentaClinicalData.SubjectID==SubId,3));
    Placenta_HyperBase(measnum,18:22)=table2array(PlacentaClinicalData(PlacentaClinicalData.SubjectID==SubId,9:13));
    Placenta_HyperBase(measnum,25)=eHBO2(1)*Placenta_HyperBase(measnum,9)+eHB(1)*(Placenta_HyperBase(measnum,7)-Placenta_HyperBase(measnum,9))+ WaterFraction(3)*MuaB(1)+LipidFraction(3)*MuaL(1);
    Placenta_HyperBase(measnum,26)=eHBO2(2)*Placenta_HyperBase(measnum,9)+eHB(2)*(Placenta_HyperBase(measnum,7)-Placenta_HyperBase(measnum,9))+ WaterFraction(3)*MuaB(2)+LipidFraction(3)*MuaL(2);
    Placenta_HyperBase(measnum,27)=eHBO2(3)*Placenta_HyperBase(measnum,9)+eHB(3)*(Placenta_HyperBase(measnum,7)-Placenta_HyperBase(measnum,9))+ WaterFraction(3)*MuaB(3)+LipidFraction(3)*MuaL(3);
    Placenta_HyperBase(measnum,28)=Placenta_HyperBase(measnum,11)*((785/700)^(-Placenta_HyperBase(measnum,12)));
    Placenta_HyperBase(measnum,29)=Placenta_HyperBase(measnum,11)*((808/700)^(-Placenta_HyperBase(measnum,12)));
    Placenta_HyperBase(measnum,30)=Placenta_HyperBase(measnum,11)*((830/700)^(-Placenta_HyperBase(measnum,12)));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pregnancy outcome coding
% 101 healthy outcome     102 GHTN   
% 103 Pre-eclampsia       104 IUGR    
% Pathology outcome coding
% 301 healthy pathog      
% 303 mild MVM            305 severe MVM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[Index101,~]=find(Placenta_HyperBase(:,15)==101);
[Index102,~]=find(Placenta_HyperBase(:,15)==102);
[Index103,~]=find(Placenta_HyperBase(:,15)==103);
[Index104,~]=find(Placenta_HyperBase(:,15)==104);
[Index301,~]=find(Placenta_HyperBase(:,16)==301);
[Index303,~]=find(Placenta_HyperBase(:,16)==303);
[Index305,~]=find(Placenta_HyperBase(:,16)==305);


%mean(S.D.), median (iqr) of delta StO2/HbT/StO2 across all these Subjects 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Avg_Placenta_****_****=
% mean_StO2     S.D._StO2   median_StO2     IQR_StO2    25%_StO2    75%_StO2     
% mean_HbT      S.D._HbT    median_HbT      IQR_HbT     25%_HbT     75%_HbT    
% mean_HbO2     S.D._HbO2   median_HbO2     IQR_HbO2    25%_HbO2    75%_HbO2     
% mean_A        S.D._A      median_A        IQR_A       25%_A       75%_A     
% mean_b        S.D._b      median_b        IQR_b       25%_b       75%_b     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Avg_Placenta_HyperBase(1,1)=mean(Placenta_HyperBase(:,5));
Avg_Placenta_HyperBase(1,2)=std(Placenta_HyperBase(:,5));
Avg_Placenta_HyperBase(1,3)=median(Placenta_HyperBase(:,5));
Avg_Placenta_HyperBase(1,4)=iqr(Placenta_HyperBase(:,5));
Avg_Placenta_HyperBase(1,5:6)=quantile(Placenta_HyperBase(:,5),[0.25,0.75]);
Avg_Placenta_HyperBase(2,1)=mean(Placenta_HyperBase(:,7));
Avg_Placenta_HyperBase(2,2)=std(Placenta_HyperBase(:,7));
Avg_Placenta_HyperBase(2,3)=median(Placenta_HyperBase(:,7));
Avg_Placenta_HyperBase(2,4)=iqr(Placenta_HyperBase(:,7));
Avg_Placenta_HyperBase(2,5:6)=quantile(Placenta_HyperBase(:,7),[0.25,0.75]);
Avg_Placenta_HyperBase(3,1)=mean(Placenta_HyperBase(:,9));
Avg_Placenta_HyperBase(3,2)=std(Placenta_HyperBase(:,9));
Avg_Placenta_HyperBase(3,3)=median(Placenta_HyperBase(:,9));
Avg_Placenta_HyperBase(3,4)=iqr(Placenta_HyperBase(:,9));
Avg_Placenta_HyperBase(3,5:6)=quantile(Placenta_HyperBase(:,9),[0.25,0.75]);
Avg_Placenta_HyperBase(4,1)=mean(Placenta_HyperBase(:,11));
Avg_Placenta_HyperBase(4,2)=std(Placenta_HyperBase(:,11));
Avg_Placenta_HyperBase(4,3)=median(Placenta_HyperBase(:,11));
Avg_Placenta_HyperBase(4,4)=iqr(Placenta_HyperBase(:,11));
Avg_Placenta_HyperBase(4,5:6)=quantile(Placenta_HyperBase(:,11),[0.25,0.75]);
Avg_Placenta_HyperBase(5,1)=mean(Placenta_HyperBase(:,12));
Avg_Placenta_HyperBase(5,2)=std(Placenta_HyperBase(:,12));
Avg_Placenta_HyperBase(5,3)=median(Placenta_HyperBase(:,12));
Avg_Placenta_HyperBase(5,4)=iqr(Placenta_HyperBase(:,12));
Avg_Placenta_HyperBase(5,5:6)=quantile(Placenta_HyperBase(:,12),[0.25,0.75]);
Avg_Placenta_HyperBase(6,1)=mean(Placenta_HyperBase(:,25));
Avg_Placenta_HyperBase(6,2)=std(Placenta_HyperBase(:,25));
Avg_Placenta_HyperBase(6,3)=median(Placenta_HyperBase(:,25));
Avg_Placenta_HyperBase(6,4)=iqr(Placenta_HyperBase(:,25));
Avg_Placenta_HyperBase(6,5:6)=quantile(Placenta_HyperBase(:,25),[0.25,0.75]);
Avg_Placenta_HyperBase(7,1)=mean(Placenta_HyperBase(:,26));
Avg_Placenta_HyperBase(7,2)=std(Placenta_HyperBase(:,26));
Avg_Placenta_HyperBase(7,3)=median(Placenta_HyperBase(:,26));
Avg_Placenta_HyperBase(7,4)=iqr(Placenta_HyperBase(:,26));
Avg_Placenta_HyperBase(7,5:6)=quantile(Placenta_HyperBase(:,26),[0.25,0.75]);
Avg_Placenta_HyperBase(8,1)=mean(Placenta_HyperBase(:,27));
Avg_Placenta_HyperBase(8,2)=std(Placenta_HyperBase(:,27));
Avg_Placenta_HyperBase(8,3)=median(Placenta_HyperBase(:,27));
Avg_Placenta_HyperBase(8,4)=iqr(Placenta_HyperBase(:,27));
Avg_Placenta_HyperBase(8,5:6)=quantile(Placenta_HyperBase(:,27),[0.25,0.75]);
Avg_Placenta_HyperBase(9,1)=mean(Placenta_HyperBase(:,28));
Avg_Placenta_HyperBase(9,2)=std(Placenta_HyperBase(:,28));
Avg_Placenta_HyperBase(9,3)=median(Placenta_HyperBase(:,28));
Avg_Placenta_HyperBase(9,4)=iqr(Placenta_HyperBase(:,28));
Avg_Placenta_HyperBase(9,5:6)=quantile(Placenta_HyperBase(:,28),[0.25,0.75]);
Avg_Placenta_HyperBase(10,1)=mean(Placenta_HyperBase(:,29));
Avg_Placenta_HyperBase(10,2)=std(Placenta_HyperBase(:,29));
Avg_Placenta_HyperBase(10,3)=median(Placenta_HyperBase(:,29));
Avg_Placenta_HyperBase(10,4)=iqr(Placenta_HyperBase(:,29));
Avg_Placenta_HyperBase(10,5:6)=quantile(Placenta_HyperBase(:,29),[0.25,0.75]);
Avg_Placenta_HyperBase(11,1)=mean(Placenta_HyperBase(:,30));
Avg_Placenta_HyperBase(11,2)=std(Placenta_HyperBase(:,30));
Avg_Placenta_HyperBase(11,3)=median(Placenta_HyperBase(:,30));
Avg_Placenta_HyperBase(11,4)=iqr(Placenta_HyperBase(:,30));
Avg_Placenta_HyperBase(11,5:6)=quantile(Placenta_HyperBase(:,30),[0.25,0.75]);

save([sdir '\\FinalResult.mat']);
Ttable=table(Placenta_HyperBase);
exlfilename=[sdir '\\PlacentaHyperoxia_BS.xlsx'];
writetable(Ttable,exlfilename);
