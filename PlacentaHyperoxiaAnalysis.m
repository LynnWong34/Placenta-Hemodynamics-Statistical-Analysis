% This program will process the hyperoxia data (include HyperBase) 
% for all the visits (all trimesters).

% We use a moving 4-frame-window to get a smoothed/averaged StO2/HbT/HbO2 
% of each window during hyperoxia.

% The relative StO2/HbT/HbO2 were obtained by normalizing their time series
% values to the HyperBase (the mean of final 4-frame-window during baseline)

% The delta StO2/HbT/HbO2 were defined as the difference between 
% these mean HyperBase values and the “peak” values of the 4-frame window 
% during maternal hyperoxia wherein maximum StO2 occurred.  

% Note! Now we only have third trimester, but the program is designed to
% process all the trimesters.

sdir_hyper_allT=[sdir '\\Hyperoxia_AllT'];
mkdir(sdir_hyper_allT);

TTIME=0.37230463;
%Plact_Base array which have the information of baseline raw data 
Placenta_Hyper=zeros(Num_Sub*40,10);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1 SubjectNo(not ID)    2 SubjectID 
% 3 VisitNo              4 FrameNo.
% 5 Frame Situation      6 Placenta StO2
% 7 Placenta HbT         8 Placenta HbO2
% 9 Placenta layer curve 10 Placenta Depth
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Placenta_Hyper(:,1:3)=table2array(HyperData(:,2:4));
Placenta_Hyper(:,4)=rem(table2array(HyperData(:,1))-1,43)-2;
Placenta_Hyper(:,5:8)=table2array(HyperData(:,6:9));
Placenta_Hyper(:,9)=table2array(HyperData(:,15));
Placenta_Hyper(:,10)=table2array(HyperData(:,16));

% Placenta_Hyper_Relat is StO2/THC/HbO2 normalized by deviding the
% HyperBase mean values 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1 SubjectNo(not ID)        2 SubjectID 
% 3 VisitNo                  4 FrameNo.
% 5 Frame Situation          6 Placenta Relative StO2
% 7 Placenta Relative HbT    8 Placenta Relative HbO2
% 9 Placenta layer curve     10 Placenta Depth
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Placenta_Hyper_Relat=Placenta_Hyper;
for measnum=1:1:Num_Sub
    measind=(measnum-1)*40+1:(measnum-1)*40+40;
    Placenta_Hyper_Relat(measind,6)=Placenta_Hyper(measind,6)./Placenta_HyperBase(measnum,5);
    Placenta_Hyper_Relat(measind,7)=Placenta_Hyper(measind,7)./Placenta_HyperBase(measnum,7);
    Placenta_Hyper_Relat(measind,8)=Placenta_Hyper(measind,8)./Placenta_HyperBase(measnum,9);
end

% Placenta_Hp is mean/std of StO2/THC/HbO2 in every 4-frames-window during hyperoxia
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1 SubjectNo(not ID)    2 SubjectID 
% 3 VisitNo              4 Placenta Depth (average)
% frome column 5 to 4+40*6 are the mean(S.D.) of a moving 4-frame-window
% every frame have 6 colums information, so each patient has 40*6+4 columns
% for frame k=1:40 calculate the mean(S.D.) of StO2/THC/HbO2 in every 4-frame-window 
% Placenta_Hp(:,4+(k-1)*6+1) = mean StO2 of frame k-2:k+1
% Placenta_Hp(:,4+(k-1)*6+2) = S.D. StO2 of frame k-2:k+1
% Placenta_Hp(:,4+(k-1)*6+3) = mean HbT of frame k-2:k+1
% Placenta_Hp(:,4+(k-1)*6+4) = S.D. HbT of frame k-2:k+1
% Placenta_Hp(:,4+(k-1)*6+5) = mean HbO2 of frame k-2:k+1
% Placenta_Hp(:,4+(k-1)*6+6) = S.D. HbO2 of frame k-2:k+1
% from column 4+40*6+1 to 4+40*6+6 are the mean(S.D.) of StO2/HbT/HbO2 of
% the window where maximum StO2 occurs
% the 4+40*6+6+1 column is the window number where the maximum StO2 occurs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Placenta_HyperHp=zeros(Num_Sub,4+40*6+6+1);
% Placenta_HyperCg is the difference between Placenta_HyperBase and Placenta_Hp
% It has the same size as PlacentaHyperHp, and all the information matches 
% from column 4+40*6+1 to 4+40*6+6 are the mean(S.D.) of delta StO2/HbT/HbO2 of
% the window where maximum StO2 occurs
% the 4+40*6+6+1 column is the window number where the maximum StO2 occurs
Placenta_HyperCg=zeros(Num_Sub,4+40*6+6+1);

for measnum=1:1:Num_Sub
    % use a matrix for each subject's data
    measind=(measnum-1)*40+1:(measnum-1)*40+40;
    tem_Plact_Hyper=Placenta_Hyper(measind,:);
    [rhoindnonzero,~]=find(tem_Plact_Hyper(:,6)>0 & tem_Plact_Hyper(:,5)<5);
    
    % column 1~4 follow the information from Placenta_Hyper
    Placenta_HyperHp(measnum,1:3)=tem_Plact_Hyper(1,1:3);
    Placenta_HyperHp(measnum,4)=mean(tem_Plact_Hyper(:,10));
    Placenta_HyperCg(measnum,1:4)=Placenta_HyperHp(measnum,1:4);
    
    % calculate the mean(S.D.) of StO2/THC/HbO2 in every 4-frame-window
    % for frame 1, use 1:3 to smooth
    k=1;
    [rhoindnonzeroh,~]=find(tem_Plact_Hyper(k:k+1,6)>0 & tem_Plact_Hyper(k:k+1,5)<5);
    len_hyper(measnum,k)=length(rhoindnonzeroh);
    Placenta_HyperHp(measnum,5)=mean(tem_Plact_Hyper(rhoindnonzeroh,6));
    Placenta_HyperHp(measnum,6)=std(tem_Plact_Hyper(rhoindnonzeroh,6));
    Placenta_HyperHp(measnum,7)=mean(tem_Plact_Hyper(rhoindnonzeroh,7));
    Placenta_HyperHp(measnum,8)=std(tem_Plact_Hyper(rhoindnonzeroh,7));
    Placenta_HyperHp(measnum,9)=mean(tem_Plact_Hyper(rhoindnonzeroh,8));
    Placenta_HyperHp(measnum,10)=std(tem_Plact_Hyper(rhoindnonzeroh,8));
 
    % for frame 2, use 1:4 to smooth
    k=2;
    [rhoindnonzeroh,~]=find(tem_Plact_Hyper(k-1:k+1,6)>0 & tem_Plact_Hyper(k-1:k+1,5)<5);
    len_hyper(measnum,k)=length(rhoindnonzeroh);
    Placenta_HyperHp(measnum,11)=mean(tem_Plact_Hyper(rhoindnonzeroh,6));
    Placenta_HyperHp(measnum,12)=std(tem_Plact_Hyper(rhoindnonzeroh,6));
    Placenta_HyperHp(measnum,13)=mean(tem_Plact_Hyper(rhoindnonzeroh,7));
    Placenta_HyperHp(measnum,14)=std(tem_Plact_Hyper(rhoindnonzeroh,7));
    Placenta_HyperHp(measnum,15)=mean(tem_Plact_Hyper(rhoindnonzeroh,8));
    Placenta_HyperHp(measnum,16)=std(tem_Plact_Hyper(rhoindnonzeroh,8));

    % for frame 3 to 38, use k-2:k+1 to smooth data
    for k=3:1:38
        [rhoindnonzeroh,~]=find(tem_Plact_Hyper(k-2:k+1,6)>0 & tem_Plact_Hyper(k-2:k+1,5)<5);
        len_hyper(measnum,k)=length(rhoindnonzeroh);
        rhoindnonzeroh=rhoindnonzeroh+(k-2)-1;
        Placenta_HyperHp(measnum,16+(k-3)*6+1)=mean(tem_Plact_Hyper(rhoindnonzeroh,6));
        Placenta_HyperHp(measnum,16+(k-3)*6+2)=std(tem_Plact_Hyper(rhoindnonzeroh,6));
        Placenta_HyperHp(measnum,16+(k-3)*6+3)=mean(tem_Plact_Hyper(rhoindnonzeroh,7));
        Placenta_HyperHp(measnum,16+(k-3)*6+4)=std(tem_Plact_Hyper(rhoindnonzeroh,7));
        Placenta_HyperHp(measnum,16+(k-3)*6+5)=mean(tem_Plact_Hyper(rhoindnonzeroh,8));
        Placenta_HyperHp(measnum,16+(k-3)*6+6)=std(tem_Plact_Hyper(rhoindnonzeroh,8));
    end
    
    
    % for frame 39, use k-2:k+1 to smooth
    k=39;
    [rhoindnonzeroh,~]=find(tem_Plact_Hyper(k-2:k+1,6)>0 & tem_Plact_Hyper(k-2:k+1,5)<5);
    len_hyper(measnum,k)=length(rhoindnonzeroh);
    rhoindnonzeroh=rhoindnonzeroh+(k-2)-1;
    Placenta_HyperHp(measnum,16+(k-3)*6+1)=mean(tem_Plact_Hyper(rhoindnonzeroh,6));     
    Placenta_HyperHp(measnum,16+(k-3)*6+2)=std(tem_Plact_Hyper(rhoindnonzeroh,6));
    Placenta_HyperHp(measnum,16+(k-3)*6+3)=mean(tem_Plact_Hyper(rhoindnonzeroh,7));
    Placenta_HyperHp(measnum,16+(k-3)*6+4)=std(tem_Plact_Hyper(rhoindnonzeroh,7));
    Placenta_HyperHp(measnum,16+(k-3)*6+5)=mean(tem_Plact_Hyper(rhoindnonzeroh,8));
    Placenta_HyperHp(measnum,16+(k-3)*6+6)=std(tem_Plact_Hyper(rhoindnonzeroh,8));

    % for frame 40, use k-2:k to smooth
    k=40;
    [rhoindnonzeroh,~]=find(tem_Plact_Hyper(k-2:k,6)>0 & tem_Plact_Hyper(k-2:k,5)<5);
    len_hyper(measnum,k)=length(rhoindnonzeroh);
    rhoindnonzeroh=rhoindnonzeroh+(k-2)-1;
    Placenta_HyperHp(measnum,16+(k-3)*6+1)=mean(tem_Plact_Hyper(rhoindnonzeroh,6));
    Placenta_HyperHp(measnum,16+(k-3)*6+2)=std(tem_Plact_Hyper(rhoindnonzeroh,6));
    Placenta_HyperHp(measnum,16+(k-3)*6+3)=mean(tem_Plact_Hyper(rhoindnonzeroh,7));
    Placenta_HyperHp(measnum,16+(k-3)*6+4)=std(tem_Plact_Hyper(rhoindnonzeroh,7));
    Placenta_HyperHp(measnum,16+(k-3)*6+5)=mean(tem_Plact_Hyper(rhoindnonzeroh,8));
    Placenta_HyperHp(measnum,16+(k-3)*6+6)=std(tem_Plact_Hyper(rhoindnonzeroh,8));
    
    % for the DeltaHbO2/StO2/THC, also calculate within each window
    for k=1:1:40
        Placenta_HyperCg(measnum,4+(k-1)*6+1)=Placenta_HyperHp(measnum,4+(k-1)*6+1)-Placenta_HyperBase(measnum,5);
        Placenta_HyperCg(measnum,4+(k-1)*6+2)=sqrt(Placenta_HyperHp(measnum,4+(k-1)*6+2)^2/len_hyper(measnum,k)+Placenta_HyperBase(measnum,6)^2/len_base(measnum));
        Placenta_HyperCg(measnum,4+(k-1)*6+3)=Placenta_HyperHp(measnum,4+(k-1)*6+3)-Placenta_HyperBase(measnum,7);
        Placenta_HyperCg(measnum,4+(k-1)*6+4)=sqrt(Placenta_HyperHp(measnum,4+(k-1)*6+4)^2/len_hyper(measnum,k)+Placenta_HyperBase(measnum,8)^2/len_base(measnum));
        Placenta_HyperCg(measnum,4+(k-1)*6+5)=Placenta_HyperHp(measnum,4+(k-1)*6+5)-Placenta_HyperBase(measnum,9);
        Placenta_HyperCg(measnum,4+(k-1)*6+6)=sqrt(Placenta_HyperHp(measnum,4+(k-1)*6+6)^2/len_hyper(measnum,k)+Placenta_HyperBase(measnum,10)^2/len_base(measnum));
    end

    
    %find the maxmum StO2 change compare to baseline
    %use this window's data as the peak values
    % only compare from frame 16 to frame 30 
    sortsto2=(4+15*6+1):6:(4+30*6);
    [Placenta_HyperCg(measnum,4+40*6+1),indStO2]=max(Placenta_HyperCg(measnum,sortsto2)); %MEAN STO2
    Placenta_HyperCg(measnum,4+40*6+2)=Placenta_HyperCg(measnum,sortsto2(indStO2)+1);     %std STO2
    Placenta_HyperCg(measnum,4+40*6+3)=Placenta_HyperCg(measnum,sortsto2(indStO2)+2);     %mean THC
    Placenta_HyperCg(measnum,4+40*6+4)=Placenta_HyperCg(measnum,sortsto2(indStO2)+3);     %std STO2
    Placenta_HyperCg(measnum,4+40*6+5)=Placenta_HyperCg(measnum,sortsto2(indStO2)+4);     %MEAN HBO2
    Placenta_HyperCg(measnum,4+40*6+6)=Placenta_HyperCg(measnum,sortsto2(indStO2)+5);     %std HBO2
    Placenta_HyperCg(measnum,4+40*6+6+1)=indStO2+15;                                      %WHERE THE PEAK IS
   
    Placenta_HyperHp(measnum,4+40*6+1)=Placenta_HyperHp(measnum,sortsto2(indStO2)+0);     %mean STO2
    Placenta_HyperHp(measnum,4+40*6+2)=Placenta_HyperHp(measnum,sortsto2(indStO2)+1);     %std STO2
    Placenta_HyperHp(measnum,4+40*6+3)=Placenta_HyperHp(measnum,sortsto2(indStO2)+2);     %mean THC
    Placenta_HyperHp(measnum,4+40*6+4)=Placenta_HyperHp(measnum,sortsto2(indStO2)+3);     %std STO2
    Placenta_HyperHp(measnum,4+40*6+5)=Placenta_HyperHp(measnum,sortsto2(indStO2)+4);     %MEAN HBO2
    Placenta_HyperHp(measnum,4+40*6+6)=Placenta_HyperHp(measnum,sortsto2(indStO2)+5);     %std HBO2
    Placenta_HyperHp(measnum,4+40*6+6+1)=Placenta_HyperCg(measnum,251);                   %WHERE THE PEAK IS
    
       %relative values
    Placenta_HyperCg(measnum,252)=Placenta_HyperCg(measnum,245)/Placenta_HyperBase(measnum,5);  
    Placenta_HyperCg(measnum,253)=Placenta_HyperCg(measnum,246)/Placenta_HyperBase(measnum,5);  
    Placenta_HyperCg(measnum,254)=Placenta_HyperCg(measnum,247)/Placenta_HyperBase(measnum,7);
    Placenta_HyperCg(measnum,255)=Placenta_HyperCg(measnum,248)/Placenta_HyperBase(measnum,7);
    Placenta_HyperCg(measnum,256)=Placenta_HyperCg(measnum,249)/Placenta_HyperBase(measnum,9);
    Placenta_HyperCg(measnum,257)=Placenta_HyperCg(measnum,250)/Placenta_HyperBase(measnum,9);
end

%mean(S.D.), median (iqr) of delta StO2/HbT/StO2 across all these Subjects 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Avg_Placenta_****_****=
% [mean_StO2    S.D._StO2    mean_HbT    S.D._HbT    mean_HbO2    S.D._HbO2
%  median_StO2  IQR_StO2     median_HbT  IQR_HbT     median_HbO2  IQR_HbO2
%  25%_StO2     75%_StO2     25%_HbT     75%_HbT     25%_HbO2     75%_HbO2]    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Avg_Placenta_HyperCg(1,1)=mean(Placenta_HyperCg(:,245));
Avg_Placenta_HyperCg(1,2)=std(Placenta_HyperCg(:,245));
Avg_Placenta_HyperCg(1,3)=median(Placenta_HyperCg(:,245));
Avg_Placenta_HyperCg(1,4)=iqr(Placenta_HyperCg(:,245));
Avg_Placenta_HyperCg(1,5:6)=quantile(Placenta_HyperCg(:,245),[0.25,0.75]);

Avg_Placenta_HyperCg(2,1)=mean(Placenta_HyperCg(:,247));
Avg_Placenta_HyperCg(2,2)=std(Placenta_HyperCg(:,247));
Avg_Placenta_HyperCg(2,3)=median(Placenta_HyperCg(:,247));
Avg_Placenta_HyperCg(2,4)=iqr(Placenta_HyperCg(:,247));
Avg_Placenta_HyperCg(2,5:6)=quantile(Placenta_HyperCg(:,247),[0.25,0.75]);

Avg_Placenta_HyperCg(3,1)=mean(Placenta_HyperCg(:,249));
Avg_Placenta_HyperCg(3,2)=std(Placenta_HyperCg(:,249));
Avg_Placenta_HyperCg(3,3)=median(Placenta_HyperCg(:,249));
Avg_Placenta_HyperCg(3,4)=iqr(Placenta_HyperCg(:,249));
Avg_Placenta_HyperCg(3,5:6)=quantile(Placenta_HyperCg(:,249),[0.25,0.75]);

save([sdir '\\FinalResult.mat']);
Ttable=table(Placenta_HyperCg);
exlfilename=[sdir '\\PlacentaHyperoxia_CG.xlsx'];
writetable(Ttable,exlfilename);
Ttable=table(Placenta_HyperHp);
exlfilename=[sdir '\\PlacentaHyperoxia_HP.xlsx'];
writetable(Ttable,exlfilename);