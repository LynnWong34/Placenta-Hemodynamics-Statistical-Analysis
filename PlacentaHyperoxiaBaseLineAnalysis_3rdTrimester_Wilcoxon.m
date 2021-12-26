% This program is to calculate mean (S.D.) and Median (25% 75%) of
% different variables (hyperoxia baseline data and clinical data)
% This program will also run Wicoxon rank sum test to study the
% correlations between different variables and placental dysfunction (APO or MVM)

% Optical data --- HyperBase StO2/HbT/HbO2 data
% Note, all the array of optical variables will contain these information
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Avg_Placenta_****_****=
% [mean_StO2    S.D._StO2    mean_HbT    S.D._HbT    mean_HbO2    S.D._HbO2
%  median_StO2  IQR_StO2     median_HbT  IQR_HbT     median_HbO2  IQR_HbO2
%  25%_StO2     75%_StO2     25%_HbT     75%_HbT     25%_HbO2     75%_HbO2]    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sdir_bl_3rdT_box=[sdir '\\Baseline_3rdT_BoxPlot'];
mkdir(sdir_bl_3rdT_box);

%average of HyperBase across all the NPO subjects
Avg_Placenta_HyperBase_NPO(1,1)=mean(Placenta_HyperBase(ThirdIndex101,5));
Avg_Placenta_HyperBase_NPO(1,2)=std(Placenta_HyperBase(ThirdIndex101,5));
Avg_Placenta_HyperBase_NPO(1,3)=median(Placenta_HyperBase(ThirdIndex101,5));
Avg_Placenta_HyperBase_NPO(1,4)=iqr(Placenta_HyperBase(ThirdIndex101,5));
Avg_Placenta_HyperBase_NPO(1,5:6)=quantile(Placenta_HyperBase(ThirdIndex101,5),[0.25,0.75]);

Avg_Placenta_HyperBase_NPO(2,1)=mean(Placenta_HyperBase(ThirdIndex101,7));
Avg_Placenta_HyperBase_NPO(2,2)=std(Placenta_HyperBase(ThirdIndex101,7));
Avg_Placenta_HyperBase_NPO(2,3)=median(Placenta_HyperBase(ThirdIndex101,7));
Avg_Placenta_HyperBase_NPO(2,4)=iqr(Placenta_HyperBase(ThirdIndex101,7));
Avg_Placenta_HyperBase_NPO(2,5:6)=quantile(Placenta_HyperBase(ThirdIndex101,7),[0.25,0.75]);

Avg_Placenta_HyperBase_NPO(3,1)=mean(Placenta_HyperBase(ThirdIndex101,9));
Avg_Placenta_HyperBase_NPO(3,2)=std(Placenta_HyperBase(ThirdIndex101,9));
Avg_Placenta_HyperBase_NPO(3,3)=median(Placenta_HyperBase(ThirdIndex101,9));
Avg_Placenta_HyperBase_NPO(3,4)=iqr(Placenta_HyperBase(ThirdIndex101,9));
Avg_Placenta_HyperBase_NPO(3,5:6)=quantile(Placenta_HyperBase(ThirdIndex101,9),[0.25,0.75]);

%average of HyperBase across all the APO subjects
Avg_Placenta_HyperBase_APO(1,1)=mean(Placenta_HyperBase(ThirdIndex106,5));
Avg_Placenta_HyperBase_APO(1,2)=std(Placenta_HyperBase(ThirdIndex106,5));
Avg_Placenta_HyperBase_APO(1,3)=median(Placenta_HyperBase(ThirdIndex106,5));
Avg_Placenta_HyperBase_APO(1,4)=iqr(Placenta_HyperBase(ThirdIndex106,5));
Avg_Placenta_HyperBase_APO(1,5:6)=quantile(Placenta_HyperBase(ThirdIndex106,5),[0.25,0.75]);

Avg_Placenta_HyperBase_APO(2,1)=mean(Placenta_HyperBase(ThirdIndex106,7));
Avg_Placenta_HyperBase_APO(2,2)=std(Placenta_HyperBase(ThirdIndex106,7));
Avg_Placenta_HyperBase_APO(2,3)=median(Placenta_HyperBase(ThirdIndex106,7));
Avg_Placenta_HyperBase_APO(2,4)=iqr(Placenta_HyperBase(ThirdIndex106,7));
Avg_Placenta_HyperBase_APO(2,5:6)=quantile(Placenta_HyperBase(ThirdIndex106,7),[0.25,0.75]);

Avg_Placenta_HyperBase_APO(3,1)=mean(Placenta_HyperBase(ThirdIndex106,9));
Avg_Placenta_HyperBase_APO(3,2)=std(Placenta_HyperBase(ThirdIndex106,9));
Avg_Placenta_HyperBase_APO(3,3)=median(Placenta_HyperBase(ThirdIndex106,9));
Avg_Placenta_HyperBase_APO(3,4)=iqr(Placenta_HyperBase(ThirdIndex106,9));
Avg_Placenta_HyperBase_APO(3,5:6)=quantile(Placenta_HyperBase(ThirdIndex106,9),[0.25,0.75]);

%first type of correlation: distinguish NPO and APO
%for sto2
Placenta_HyperBase_G1(1)=ranksum(Placenta_HyperBase(ThirdIndex101,5),Placenta_HyperBase(ThirdIndex106,5));
%for thc
Placenta_HyperBase_G1(2)=ranksum(Placenta_HyperBase(ThirdIndex101,7),Placenta_HyperBase(ThirdIndex106,7));
%for hbo2
Placenta_HyperBase_G1(3)=ranksum(Placenta_HyperBase(ThirdIndex101,9),Placenta_HyperBase(ThirdIndex106,9));
%plot box with P value for StO2/HbO2
Placenta_HyperBase_B1_StO2=[Placenta_HyperBase(ThirdIndex101,5); Placenta_HyperBase(ThirdIndex106,5)];
Placenta_HyperBase_B1_THC=[Placenta_HyperBase(ThirdIndex101,7); Placenta_HyperBase(ThirdIndex106,7)];
Placenta_HyperBase_B1_HbO2=[Placenta_HyperBase(ThirdIndex101,9); Placenta_HyperBase(ThirdIndex106,9)];
G1_1 = repmat({'NPO'},length(Placenta_HyperBase(ThirdIndex101,5)),1);
G1_2 = repmat({'APO'},length(Placenta_HyperBase(ThirdIndex106,5)),1);
G1 = [G1_1; G1_2];
figure;
set(gcf,'Position',[250 250 1450 550]);
subplot(1,3,1);
boxplot(Placenta_HyperBase_B1_StO2,G1);
a = get(get(gca,'children'),'children');   % Get the handles of all the objects
t = get(a,'tag');   % List the names of all the objects 
idx=strcmpi(t,'box');  % Find Box objects
boxes=a(idx);          % Get the children you need
set(boxes,'linewidth',1); % Set width
ylabel('StO_2 (%)','FontSize',12,'FontWeight','bold');
ylim([40 100]);
yticks([40 60 80 100]);
set(gca,'FontSize',12,'FontWeight','bold');
title(['P=' num2str(Placenta_HyperBase_G1(1),'%4.3f')],'FontSize',12,'FontWeight','bold');
subplot(1,3,2);
boxplot(Placenta_HyperBase_B1_THC,G1);
a = get(get(gca,'children'),'children');   % Get the handles of all the objects
t = get(a,'tag');   % List the names of all the objects 
idx=strcmpi(t,'box');  % Find Box objects
boxes=a(idx);          % Get the children you need
set(boxes,'linewidth',1); % Set width
ylabel('Hb_T (\mu M)','FontSize',12,'FontWeight','bold');
ylim([0 100]);
yticks([0 20 40 60 80 100]);
set(gca,'FontSize',12,'FontWeight','bold');
title(['P=' num2str(Placenta_HyperBase_G1(2),'%4.3f')],'FontSize',12,'FontWeight','bold');
subplot(1,3,3);
boxplot(Placenta_HyperBase_B1_HbO2,G1);
a = get(get(gca,'children'),'children');   % Get the handles of all the objects
t = get(a,'tag');   % List the names of all the objects 
idx=strcmpi(t,'box');  % Find Box objects
boxes=a(idx);          % Get the children you need
set(boxes,'linewidth',1); % Set width
ylabel('HbO_2 (\mu M)','FontSize',12,'FontWeight','bold') 
ylim([0 60]);
yticks([0 20 40 60]);
set(gca,'FontSize',12,'FontWeight','bold');
title(['P=' num2str(Placenta_HyperBase_G1(3),'%4.3f')],'FontSize',12,'FontWeight','bold');
savefig([sdir_bl_3rdT_box '\\PlacentaHyperBase_NPO_APO.fig']);


%average of HyperBase across all the NPP subjects
Avg_Placenta_HyperBase_NPP(1,1)=mean(Placenta_HyperBase(ThirdIndex301,5));
Avg_Placenta_HyperBase_NPP(1,2)=std(Placenta_HyperBase(ThirdIndex301,5));
Avg_Placenta_HyperBase_NPP(1,3)=median(Placenta_HyperBase(ThirdIndex301,5));
Avg_Placenta_HyperBase_NPP(1,4)=iqr(Placenta_HyperBase(ThirdIndex301,5));
Avg_Placenta_HyperBase_NPP(1,5:6)=quantile(Placenta_HyperBase(ThirdIndex301,5),[0.25,0.75]);

Avg_Placenta_HyperBase_NPP(2,1)=mean(Placenta_HyperBase(ThirdIndex301,7));
Avg_Placenta_HyperBase_NPP(2,2)=std(Placenta_HyperBase(ThirdIndex301,7));
Avg_Placenta_HyperBase_NPP(2,3)=median(Placenta_HyperBase(ThirdIndex301,7));
Avg_Placenta_HyperBase_NPP(2,4)=iqr(Placenta_HyperBase(ThirdIndex301,7));
Avg_Placenta_HyperBase_NPP(2,5:6)=quantile(Placenta_HyperBase(ThirdIndex301,7),[0.25,0.75]);

Avg_Placenta_HyperBase_NPP(3,1)=mean(Placenta_HyperBase(ThirdIndex301,9));
Avg_Placenta_HyperBase_NPP(3,2)=std(Placenta_HyperBase(ThirdIndex301,9));
Avg_Placenta_HyperBase_NPP(3,3)=median(Placenta_HyperBase(ThirdIndex301,9));
Avg_Placenta_HyperBase_NPP(3,4)=iqr(Placenta_HyperBase(ThirdIndex301,9));
Avg_Placenta_HyperBase_NPP(3,5:6)=quantile(Placenta_HyperBase(ThirdIndex301,9),[0.25,0.75]);

%average of HyperBase across all the MVM subjects
Avg_Placenta_HyperBase_MVM(1,1)=mean(Placenta_HyperBase(ThirdIndex308,5));
Avg_Placenta_HyperBase_MVM(1,2)=std(Placenta_HyperBase(ThirdIndex308,5));
Avg_Placenta_HyperBase_MVM(1,3)=median(Placenta_HyperBase(ThirdIndex308,5));
Avg_Placenta_HyperBase_MVM(1,4)=iqr(Placenta_HyperBase(ThirdIndex308,5));
Avg_Placenta_HyperBase_MVM(1,5:6)=quantile(Placenta_HyperBase(ThirdIndex308,5),[0.25,0.75]);

Avg_Placenta_HyperBase_MVM(2,1)=mean(Placenta_HyperBase(ThirdIndex308,7));
Avg_Placenta_HyperBase_MVM(2,2)=std(Placenta_HyperBase(ThirdIndex308,7));
Avg_Placenta_HyperBase_MVM(2,3)=median(Placenta_HyperBase(ThirdIndex308,7));
Avg_Placenta_HyperBase_MVM(2,4)=iqr(Placenta_HyperBase(ThirdIndex308,7));
Avg_Placenta_HyperBase_MVM(2,5:6)=quantile(Placenta_HyperBase(ThirdIndex308,7),[0.25,0.75]);

Avg_Placenta_HyperBase_MVM(3,1)=mean(Placenta_HyperBase(ThirdIndex308,9));
Avg_Placenta_HyperBase_MVM(3,2)=std(Placenta_HyperBase(ThirdIndex308,9));
Avg_Placenta_HyperBase_MVM(3,3)=median(Placenta_HyperBase(ThirdIndex308,9));
Avg_Placenta_HyperBase_MVM(3,4)=iqr(Placenta_HyperBase(ThirdIndex308,9));
Avg_Placenta_HyperBase_MVM(3,5:6)=quantile(Placenta_HyperBase(ThirdIndex308,9),[0.25,0.75]);

% 2nd type of correlation: NPP vs MVM 
%for sto2
Placenta_HyperBase_G2(1)=ranksum(Placenta_HyperBase(ThirdIndex308,5),Placenta_HyperBase(ThirdIndex301,5));
%for thc
Placenta_HyperBase_G2(2)=ranksum(Placenta_HyperBase(ThirdIndex308,7),Placenta_HyperBase(ThirdIndex301,7));
%for hbo2
Placenta_HyperBase_G2(3)=ranksum(Placenta_HyperBase(ThirdIndex308,9),Placenta_HyperBase(ThirdIndex301,9));
Placenta_HyperBase_B2_StO2=[Placenta_HyperBase(ThirdIndex301,5); Placenta_HyperBase(ThirdIndex308,5)];
Placenta_HyperBase_B2_THC=[Placenta_HyperBase(ThirdIndex301,7); Placenta_HyperBase(ThirdIndex308,7)];
Placenta_HyperBase_B2_HbO2=[Placenta_HyperBase(ThirdIndex301,9); Placenta_HyperBase(ThirdIndex308,9)];
G2_1 = repmat({'NPP'},length(Placenta_HyperBase(ThirdIndex301,5)),1);
G2_2 = repmat({'MVM'},length(Placenta_HyperBase(ThirdIndex308,5)),1);
G2 = [G2_1; G2_2];
figure;
set(gcf,'Position',[250 250 1450 550]);
subplot(1,3,1);
boxplot(Placenta_HyperBase_B2_StO2,G2);
a = get(get(gca,'children'),'children');   % Get the handles of all the objects
t = get(a,'tag');   % List the names of all the objects 
idx=strcmpi(t,'box');  % Find Box objects
boxes=a(idx);          % Get the children you need
set(boxes,'linewidth',1); % Set width
ylabel('StO_2 (%)','FontSize',12,'FontWeight','bold');
ylim([40 100]);
yticks([40 60 80 100]);
set(gca,'FontSize',12,'FontWeight','bold');
title(['P=' num2str(Placenta_HyperBase_G2(1),'%4.3f')],'FontSize',12,'FontWeight','bold');
subplot(1,3,2);
boxplot(Placenta_HyperBase_B2_THC,G2);
a = get(get(gca,'children'),'children');   % Get the handles of all the objects
t = get(a,'tag');   % List the names of all the objects 
idx=strcmpi(t,'box');  % Find Box objects
boxes=a(idx);          % Get the children you need
set(boxes,'linewidth',1); % Set width
ylabel('Hb_T (\mu M)','FontSize',12,'FontWeight','bold');
ylim([0 100]);
yticks([0 20 40 60 80 100]);
set(gca,'FontSize',12,'FontWeight','bold');
title(['P=' num2str(Placenta_HyperBase_G2(2),'%4.3f')],'FontSize',12,'FontWeight','bold');
subplot(1,3,3);
boxplot(Placenta_HyperBase_B2_HbO2,G2);
a = get(get(gca,'children'),'children');   % Get the handles of all the objects
t = get(a,'tag');   % List the names of all the objects 
idx=strcmpi(t,'box');  % Find Box objects
boxes=a(idx);          % Get the children you need
set(boxes,'linewidth',1); % Set width
ylabel('HbO_2 (\mu M)','FontSize',12,'FontWeight','bold') 
ylim([0 60]);
yticks([0 20 40 60]);
set(gca,'FontSize',12,'FontWeight','bold');
title(['P=' num2str(Placenta_HyperBase_G2(3),'%4.3f')],'FontSize',12,'FontWeight','bold');
savefig([sdir_bl_3rdT_box '\\PlacentaHyperBase_NPP_MVM.fig']);

% Clinical variables
% Note, all the array of clinical variables will contain these information
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Avg_Placenta_****_****=
% [mean    S.D.    median  IQR     25%     75%]    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%average of UtA PI across all the NPO subjects
Avg_Placenta_UtAPI_NPO(1)=mean(Placenta_HyperBase(ThirdIndex101,13));
Avg_Placenta_UtAPI_NPO(2)=std(Placenta_HyperBase(ThirdIndex101,13));
Avg_Placenta_UtAPI_NPO(3)=median(Placenta_HyperBase(ThirdIndex101,13));
Avg_Placenta_UtAPI_NPO(4)=iqr(Placenta_HyperBase(ThirdIndex101,13));
Avg_Placenta_UtAPI_NPO(5:6)=quantile(Placenta_HyperBase(ThirdIndex101,13),[0.25,0.75]);

%average of UtA PI across all the APO subjects
Avg_Placenta_UtAPI_APO(1)=mean(Placenta_HyperBase(ThirdIndex106,13));
Avg_Placenta_UtAPI_APO(2)=std(Placenta_HyperBase(ThirdIndex106,13));
Avg_Placenta_UtAPI_APO(3)=median(Placenta_HyperBase(ThirdIndex106,13));
Avg_Placenta_UtAPI_APO(4)=iqr(Placenta_HyperBase(ThirdIndex106,13));
Avg_Placenta_UtAPI_APO(5:6)=quantile(Placenta_HyperBase(ThirdIndex106,13),[0.25,0.75]);

% 3rd type of correlation: NPO vs APO for ultrasound measurement
% for UtA PI
Placenta_UtaPI_G1=ranksum(Placenta_HyperBase(ThirdIndex101,13),Placenta_HyperBase(ThirdIndex106,13));
Placenta_UtaPI_B1=[Placenta_HyperBase(ThirdIndex101,13); Placenta_HyperBase(ThirdIndex106,13)];
G3_1 = repmat({'NPO'},length(Placenta_HyperBase(ThirdIndex101,13)),1);
G3_2 = repmat({'APO'},length(Placenta_HyperBase(ThirdIndex106,13)),1);
G3 = [G3_1; G3_2];
figure;
set(gcf,'Position',[250 250 650 550]);
boxplot(Placenta_UtaPI_B1,G3);
ylabel('Uterine Doppler Artery PI','FontSize',12,'FontWeight','bold') 
set(gca,'FontSize',12,'FontWeight','bold');
title(['P=' num2str(Placenta_UtaPI_G1,'%4.3f')],'FontSize',12,'FontWeight','bold');
savefig([sdir_bl_3rdT_box '\\PlacentaUtAPI_NPO_APO.fig']);

% average of UtA PI across all the NPP subjects
Avg_Placenta_UtAPI_NPP(1)=mean(Placenta_HyperBase(ThirdIndex301,13));
Avg_Placenta_UtAPI_NPP(2)=std(Placenta_HyperBase(ThirdIndex301,13));
Avg_Placenta_UtAPI_NPP(3)=median(Placenta_HyperBase(ThirdIndex301,13));
Avg_Placenta_UtAPI_NPP(4)=iqr(Placenta_HyperBase(ThirdIndex301,13));
Avg_Placenta_UtAPI_NPP(5:6)=quantile(Placenta_HyperBase(ThirdIndex301,13),[0.25,0.75]);

% average of UtA PI across all the NPP subjects
Avg_Placenta_UtAPI_MVM(1)=mean(Placenta_HyperBase(ThirdIndex308,13));
Avg_Placenta_UtAPI_MVM(2)=std(Placenta_HyperBase(ThirdIndex308,13));
Avg_Placenta_UtAPI_MVM(3)=median(Placenta_HyperBase(ThirdIndex308,13));
Avg_Placenta_UtAPI_MVM(4)=iqr(Placenta_HyperBase(ThirdIndex308,13));
Avg_Placenta_UtAPI_MVM(5:6)=quantile(Placenta_HyperBase(ThirdIndex308,13),[0.25,0.75]);

% 4th type of correlation: NPP VS MVM for ultrasound measurement
% for UtA PI
Placenta_UtaPI_G2=ranksum(Placenta_HyperBase(ThirdIndex301,13),Placenta_HyperBase(ThirdIndex308,13));
Placenta_UtaPI_B2=[Placenta_HyperBase(ThirdIndex301,13); Placenta_HyperBase(ThirdIndex308,13)];
G4_1 = repmat({'NPP'},length(Placenta_HyperBase(ThirdIndex301,13)),1);
G4_2 = repmat({'MVM'},length(Placenta_HyperBase(ThirdIndex308,13)),1);
G4 = [G4_1; G4_2];
figure;
set(gcf,'Position',[250 250 650 550]);
boxplot(Placenta_UtaPI_B2,G4);
ylabel('Uterine Doppler Artery PI','FontSize',12,'FontWeight','bold') 
set(gca,'FontSize',12,'FontWeight','bold');
title(['P=' num2str(Placenta_UtaPI_G2,'%4.3f')],'FontSize',12,'FontWeight','bold');
savefig([sdir_bl_3rdT_box '\\PlacentaUtAPI_NPP_MVM.fig']);

% average of placenta depth across all the NPO subjects
Avg_Placenta_Depth_NPO(1)=mean(Placenta_HyperBase(ThirdIndex101,24));
Avg_Placenta_Depth_NPO(2)=std(Placenta_HyperBase(ThirdIndex101,24));
Avg_Placenta_Depth_NPO(3)=median(Placenta_HyperBase(ThirdIndex101,24));
Avg_Placenta_Depth_NPO(4)=iqr(Placenta_HyperBase(ThirdIndex101,24));
Avg_Placenta_Depth_NPO(5:6)=quantile(Placenta_HyperBase(ThirdIndex101,24),[0.25,0.75]);

% average of placenta depth across all the APO subjects
Avg_Placenta_Depth_APO(1)=mean(Placenta_HyperBase(ThirdIndex106,24));
Avg_Placenta_Depth_APO(2)=std(Placenta_HyperBase(ThirdIndex106,24));
Avg_Placenta_Depth_APO(3)=median(Placenta_HyperBase(ThirdIndex106,24));
Avg_Placenta_Depth_APO(4)=iqr(Placenta_HyperBase(ThirdIndex106,24));
Avg_Placenta_Depth_APO(5:6)=quantile(Placenta_HyperBase(ThirdIndex106,24),[0.25,0.75]);

% 5TH type of correlation: NPO VS APO for placenta depth
Placenta_Depth_G1=ranksum(Placenta_HyperBase(ThirdIndex101,24),Placenta_HyperBase(ThirdIndex106,24));
Placenta_Depth_B1=[Placenta_HyperBase(ThirdIndex101,24); Placenta_HyperBase(ThirdIndex106,24)];
G5_1 = repmat({'NPO'},length(Placenta_HyperBase(ThirdIndex101,24)),1);
G5_2 = repmat({'APO'},length(Placenta_HyperBase(ThirdIndex106,24)),1);
G5 = [G5_1; G5_2];
figure;
set(gcf,'Position',[250 250 650 550]);
boxplot(Placenta_Depth_B1,G5);
ylabel('Placenta Depth','FontSize',12,'FontWeight','bold') 
set(gca,'FontSize',12,'FontWeight','bold');
title(['P=' num2str(Placenta_Depth_G1,'%4.3f')],'FontSize',12,'FontWeight','bold');
savefig([sdir_bl_3rdT_box '\\PlacentaDepth_NPO_APO.fig']);

% average of placenta depth across all the NPP subjects
Avg_Placenta_Depth_NPP(1)=mean(Placenta_HyperBase(ThirdIndex301,24));
Avg_Placenta_Depth_NPP(2)=std(Placenta_HyperBase(ThirdIndex301,24));
Avg_Placenta_Depth_NPP(3)=median(Placenta_HyperBase(ThirdIndex301,24));
Avg_Placenta_Depth_NPP(4)=iqr(Placenta_HyperBase(ThirdIndex301,24));
Avg_Placenta_Depth_NPP(5:6)=quantile(Placenta_HyperBase(ThirdIndex301,24),[0.25,0.75]);

% average of placenta depth across all the MVM subjects
Avg_Placenta_Depth_MVM(1)=mean(Placenta_HyperBase(ThirdIndex308,24));
Avg_Placenta_Depth_MVM(2)=std(Placenta_HyperBase(ThirdIndex308,24));
Avg_Placenta_Depth_MVM(3)=median(Placenta_HyperBase(ThirdIndex308,24));
Avg_Placenta_Depth_MVM(4)=iqr(Placenta_HyperBase(ThirdIndex308,24));
Avg_Placenta_Depth_MVM(5:6)=quantile(Placenta_HyperBase(ThirdIndex308,24),[0.25,0.75]);

% 6TH type of correlation: NPP VS MVM for placenta depth
Placenta_Depth_G2=ranksum(Placenta_HyperBase(ThirdIndex301,24),Placenta_HyperBase(ThirdIndex308,24));
Placenta_Depth_B2=[Placenta_HyperBase(ThirdIndex301,24); Placenta_HyperBase(ThirdIndex308,24)];
G6_1 = repmat({'NPP'},length(Placenta_HyperBase(ThirdIndex301,24)),1);
G6_2 = repmat({'MVM'},length(Placenta_HyperBase(ThirdIndex308,24)),1);
G6 = [G6_1; G6_2];
figure;
set(gcf,'Position',[250 250 650 550]);
boxplot(Placenta_Depth_B2,G6);
ylabel('Placenta Depth','FontSize',12,'FontWeight','bold') 
set(gca,'FontSize',12,'FontWeight','bold');
title(['P=' num2str(Placenta_Depth_G2,'%4.3f')],'FontSize',12,'FontWeight','bold');
savefig([sdir_bl_3rdT_box '\\PlacentaDepth_NPP_MVM.fig']);

% average of first prenatal BMI across all the NPO subjects
Avg_BMI_NPO(1)=mean(Placenta_HyperBase(ThirdIndex101,18));
Avg_BMI_NPO(2)=std(Placenta_HyperBase(ThirdIndex101,18));
Avg_BMI_NPO(3)=median(Placenta_HyperBase(ThirdIndex101,18));
Avg_BMI_NPO(4)=iqr(Placenta_HyperBase(ThirdIndex101,18));
Avg_BMI_NPO(5:6)=quantile(Placenta_HyperBase(ThirdIndex101,18),[0.25,0.75]);

% average of first prenatal BMI across all the APO subjects
Avg_BMI_APO(1)=mean(Placenta_HyperBase(ThirdIndex106,18));
Avg_BMI_APO(2)=std(Placenta_HyperBase(ThirdIndex106,18));
Avg_BMI_APO(3)=median(Placenta_HyperBase(ThirdIndex106,18));
Avg_BMI_APO(4)=iqr(Placenta_HyperBase(ThirdIndex106,18));
Avg_BMI_APO(5:6)=quantile(Placenta_HyperBase(ThirdIndex106,18),[0.25,0.75]);

% 7TH type of correlation: NPO VS APO for first prenantal BMI
BMI_G1=ranksum(Placenta_HyperBase(ThirdIndex101,18),Placenta_HyperBase(ThirdIndex106,18));
BMI_B1=[Placenta_HyperBase(ThirdIndex101,18); Placenta_HyperBase(ThirdIndex106,18)];
G7_1 = repmat({'NPO'},length(Placenta_HyperBase(ThirdIndex101,18)),1);
G7_2 = repmat({'APO'},length(Placenta_HyperBase(ThirdIndex106,18)),1);
G7 = [G7_1; G7_2];
figure;
set(gcf,'Position',[250 250 650 550]);
boxplot(BMI_B1,G7);
ylabel('Placenta BMI','FontSize',12,'FontWeight','bold') 
set(gca,'FontSize',12,'FontWeight','bold');
title(['P=' num2str(BMI_G1,'%4.3f')],'FontSize',12,'FontWeight','bold');
savefig([sdir_bl_3rdT_box '\\FirstPrenatalBMI_NPO_APO.fig']);

% average of first prenatal BMI across all the NPP subjects
Avg_BMI_NPP(1)=mean(Placenta_HyperBase(ThirdIndex301,18));
Avg_BMI_NPP(2)=std(Placenta_HyperBase(ThirdIndex301,18));
Avg_BMI_NPP(3)=median(Placenta_HyperBase(ThirdIndex301,18));
Avg_BMI_NPP(4)=iqr(Placenta_HyperBase(ThirdIndex301,18));
Avg_BMI_NPP(5:6)=quantile(Placenta_HyperBase(ThirdIndex301,18),[0.25,0.75]);

% average of first prenatal BMI across all the MVM subjects
Avg_BMI_MVM(1)=mean(Placenta_HyperBase(ThirdIndex308,18));
Avg_BMI_MVM(2)=std(Placenta_HyperBase(ThirdIndex308,18));
Avg_BMI_MVM(3)=median(Placenta_HyperBase(ThirdIndex308,18));
Avg_BMI_MVM(4)=iqr(Placenta_HyperBase(ThirdIndex308,18));
Avg_BMI_MVM(5:6)=quantile(Placenta_HyperBase(ThirdIndex308,18),[0.25,0.75]);

% 8TH type of correlation: NPP VS MVM for first prenantal BMI
BMI_G2=ranksum(Placenta_HyperBase(ThirdIndex301,18),Placenta_HyperBase(ThirdIndex308,18));
BMI_B2=[Placenta_HyperBase(ThirdIndex301,18); Placenta_HyperBase(ThirdIndex308,18)];
G8_1 = repmat({'NPP'},length(Placenta_HyperBase(ThirdIndex301,18)),1);
G8_2 = repmat({'MVM'},length(Placenta_HyperBase(ThirdIndex308,18)),1);
G8 = [G8_1; G8_2];
figure;
set(gcf,'Position',[250 250 650 550]);
boxplot(BMI_B2,G8);
ylabel('Placenta BMI','FontSize',12,'FontWeight','bold') 
set(gca,'FontSize',12,'FontWeight','bold');
title(['P=' num2str(BMI_G2,'%4.3f')],'FontSize',12,'FontWeight','bold');
savefig([sdir_bl_3rdT_box '\\FirstPrenatalBMI_NPP_MVM.fig']);

% average of GA_Measure across all the NPO subjects
Avg_GA_NPO(1)=mean(Placenta_HyperBase(ThirdIndex101,17));
Avg_GA_NPO(2)=std(Placenta_HyperBase(ThirdIndex101,17));
Avg_GA_NPO(3)=median(Placenta_HyperBase(ThirdIndex101,17));
Avg_GA_NPO(4)=iqr(Placenta_HyperBase(ThirdIndex101,17));
Avg_GA_NPO(5:6)=quantile(Placenta_HyperBase(ThirdIndex101,17),[0.25,0.75]);

% average of GA_Measure across all the APO subjects
Avg_GA_APO(1)=mean(Placenta_HyperBase(ThirdIndex106,17));
Avg_GA_APO(2)=std(Placenta_HyperBase(ThirdIndex106,17));
Avg_GA_APO(3)=median(Placenta_HyperBase(ThirdIndex106,17));
Avg_GA_APO(4)=iqr(Placenta_HyperBase(ThirdIndex106,17));
Avg_GA_APO(5:6)=quantile(Placenta_HyperBase(ThirdIndex106,17),[0.25,0.75]);

%9TH type of correlation: NPO VS APO for GA_measurement
GA_G1=ranksum(Placenta_HyperBase(ThirdIndex101,17),Placenta_HyperBase(ThirdIndex106,17));
GA_B1=[Placenta_HyperBase(ThirdIndex101,17); Placenta_HyperBase(ThirdIndex106,17)];
G9_1 = repmat({'NPO'},length(Placenta_HyperBase(ThirdIndex101,17)),1);
G9_2 = repmat({'APO'},length(Placenta_HyperBase(ThirdIndex106,17)),1);
G9 = [G9_1; G9_2];
figure;
set(gcf,'Position',[250 250 650 550]);
boxplot(GA_B1,G9);
ylabel('GA','FontSize',12,'FontWeight','bold') 
set(gca,'FontSize',12,'FontWeight','bold');
title(['P=' num2str(GA_G1,'%4.3f')],'FontSize',12,'FontWeight','bold');
savefig([sdir_bl_3rdT_box '\\GA_NPO_APO.fig']);

% average of GA_Measure across all the NPP subjects
Avg_GA_NPP(1)=mean(Placenta_HyperBase(ThirdIndex301,17));
Avg_GA_NPP(2)=std(Placenta_HyperBase(ThirdIndex301,17));
Avg_GA_NPP(3)=median(Placenta_HyperBase(ThirdIndex301,17));
Avg_GA_NPP(4)=iqr(Placenta_HyperBase(ThirdIndex301,17));
Avg_GA_NPP(5:6)=quantile(Placenta_HyperBase(ThirdIndex301,17),[0.25,0.75]);

% average of GA_Measure across all the MVM subjects
Avg_GA_MVM(1)=mean(Placenta_HyperBase(ThirdIndex308,17));
Avg_GA_MVM(2)=std(Placenta_HyperBase(ThirdIndex308,17));
Avg_GA_MVM(3)=median(Placenta_HyperBase(ThirdIndex308,17));
Avg_GA_MVM(4)=iqr(Placenta_HyperBase(ThirdIndex308,17));
Avg_GA_MVM(5:6)=quantile(Placenta_HyperBase(ThirdIndex308,17),[0.25,0.75]);

% 10TH type of correlation: NPP VS MVM for GA_measurement
GA_G2=ranksum(Placenta_HyperBase(ThirdIndex301,17),Placenta_HyperBase(ThirdIndex308,17));
GA_B2=[Placenta_HyperBase(ThirdIndex301,17); Placenta_HyperBase(ThirdIndex308,17)];
G10_1 = repmat({'NPP'},length(Placenta_HyperBase(ThirdIndex301,17)),1);
G10_2 = repmat({'MVM'},length(Placenta_HyperBase(ThirdIndex308,17)),1);
G10 = [G10_1; G10_2];
figure;
set(gcf,'Position',[250 250 650 550]);
boxplot(GA_B2,G10);
ylabel('GA','FontSize',12,'FontWeight','bold') 
set(gca,'FontSize',12,'FontWeight','bold');
title(['P=' num2str(GA_G2,'%4.3f')],'FontSize',12,'FontWeight','bold');
savefig([sdir_bl_3rdT_box '\\GA_NPP_MVM.fig']);

% average of Maternal age across all the NPO subjects
Avg_Age_NPO(1)=mean(Placenta_HyperBase(ThirdIndex101,19));
Avg_Age_NPO(2)=std(Placenta_HyperBase(ThirdIndex101,19));
Avg_Age_NPO(3)=median(Placenta_HyperBase(ThirdIndex101,19));
Avg_Age_NPO(4)=iqr(Placenta_HyperBase(ThirdIndex101,19));
Avg_Age_NPO(5:6)=quantile(Placenta_HyperBase(ThirdIndex101,19),[0.25,0.75]);

% average of Maternal age across all the APO subjects
Avg_Age_APO(1)=mean(Placenta_HyperBase(ThirdIndex106,19));
Avg_Age_APO(2)=std(Placenta_HyperBase(ThirdIndex106,19));
Avg_Age_APO(3)=median(Placenta_HyperBase(ThirdIndex106,19));
Avg_Age_APO(4)=iqr(Placenta_HyperBase(ThirdIndex106,19));
Avg_Age_APO(5:6)=quantile(Placenta_HyperBase(ThirdIndex106,19),[0.25,0.75]);

% 11TH type of correlation: NPO VS APO for maternal age
Age_G1=ranksum(Placenta_HyperBase(ThirdIndex101,19),Placenta_HyperBase(ThirdIndex106,19));
Age_B1=[Placenta_HyperBase(ThirdIndex101,19); Placenta_HyperBase(ThirdIndex106,19)];
G11_1 = repmat({'NPO'},length(Placenta_HyperBase(ThirdIndex101,19)),1);
G11_2 = repmat({'APO'},length(Placenta_HyperBase(ThirdIndex106,19)),1);
G11 = [G11_1; G11_2];
figure;
set(gcf,'Position',[250 250 650 550]);
boxplot(Age_B1,G11);
ylabel('AGE','FontSize',12,'FontWeight','bold') 
set(gca,'FontSize',12,'FontWeight','bold');
title(['P=' num2str(Age_G1,'%4.3f')],'FontSize',12,'FontWeight','bold');
savefig([sdir_bl_3rdT_box '\\AGE_NPO_APO.fig']);

% average of Maternal age across all the NPP subjects
Avg_Age_NPP(1)=mean(Placenta_HyperBase(ThirdIndex301,19));
Avg_Age_NPP(2)=std(Placenta_HyperBase(ThirdIndex301,19));
Avg_Age_NPP(3)=median(Placenta_HyperBase(ThirdIndex301,19));
Avg_Age_NPP(4)=iqr(Placenta_HyperBase(ThirdIndex301,19));
Avg_Age_NPP(5:6)=quantile(Placenta_HyperBase(ThirdIndex301,19),[0.25,0.75]);

% average of Maternal age across all the MVM subjects
Avg_Age_MVM(1)=mean(Placenta_HyperBase(ThirdIndex308,19));
Avg_Age_MVM(2)=std(Placenta_HyperBase(ThirdIndex308,19));
Avg_Age_MVM(3)=median(Placenta_HyperBase(ThirdIndex308,19));
Avg_Age_MVM(4)=iqr(Placenta_HyperBase(ThirdIndex308,19));
Avg_Age_MVM(5:6)=quantile(Placenta_HyperBase(ThirdIndex308,19),[0.25,0.75]);

% 12TH type of correlation: NPP VS MVM for maternal age
Age_G2=ranksum(Placenta_HyperBase(ThirdIndex301,19),Placenta_HyperBase(ThirdIndex308,19));
Age_B2=[Placenta_HyperBase(ThirdIndex301,19); Placenta_HyperBase(ThirdIndex308,19)];
G12_1 = repmat({'NPP'},length(Placenta_HyperBase(ThirdIndex301,19)),1);
G12_2 = repmat({'MVM'},length(Placenta_HyperBase(ThirdIndex308,19)),1);
G12 = [G12_1; G12_2];
figure;
set(gcf,'Position',[250 250 650 550]);
boxplot(Age_B2,G12);
ylabel('AGE','FontSize',12,'FontWeight','bold') 
set(gca,'FontSize',12,'FontWeight','bold');
title(['P=' num2str(Age_G2,'%4.3f')],'FontSize',12,'FontWeight','bold');
savefig([sdir_bl_3rdT_box '\\AGE_NPP_MVM.fig']);

% Nulliparity for NPO VS APO
% average of Nulliparity across all the NPO subjects
Avg_Nulliparity_NPO=sum(Placenta_HyperBase(ThirdIndex101,22))/length(Placenta_HyperBase(ThirdIndex101,22));
% average of Nulliparity across all the APO subjects
Avg_Nulliparity_APO=sum(Placenta_HyperBase(ThirdIndex106,22))/length(Placenta_HyperBase(ThirdIndex106,22));
% sum of Nulliparity across all the NPO subjects
Num_Nulliparity_NPO=sum(Placenta_HyperBase(ThirdIndex101,22));
% sum of Multiparous across all the NPO subjects
Num_Multiparous_NPO=length(Placenta_HyperBase(ThirdIndex101,22))-sum(Placenta_HyperBase(ThirdIndex101,22));
% sum of Nulliparity across all the APO subjects
Num_Nulliparity_APO=sum(Placenta_HyperBase(ThirdIndex106,22));
% sum of Multiparous across all the APO subjects
Num_Multiparous_APO=length(Placenta_HyperBase(ThirdIndex106,22))-sum(Placenta_HyperBase(ThirdIndex106,22));

Nulliparity_B1= table([Num_Nulliparity_NPO;Num_Multiparous_NPO],[Num_Nulliparity_APO;Num_Multiparous_APO],'VariableNames',{'NPO','APO'},'RowNames',{'NULLIPARITY','MULTIPAROUS'});
[Nulli_H1,Nulli_G1,Stats_Nulli_G1]=fishertest(Nulliparity_B1);

% Nulliparity for NPP VS MVM
% average of Nulliparity across all the NPP subjects
Avg_Nulliparity_NPP=sum(Placenta_HyperBase(ThirdIndex301,22))/length(Placenta_HyperBase(ThirdIndex301,22));
% average of Nulliparity across all the MVM subjects
Avg_Nulliparity_MVM=sum(Placenta_HyperBase(ThirdIndex308,22))/length(Placenta_HyperBase(ThirdIndex308,22));
% sum of Nulliparity across all the NPP subjects
Num_Nulliparity_NPP=sum(Placenta_HyperBase(ThirdIndex301,22));
% sum of Multiparous across all the NPP subjects
Num_Multiparous_NPP=length(Placenta_HyperBase(ThirdIndex301,22))-sum(Placenta_HyperBase(ThirdIndex301,22));
% sum of Nulliparity across all the MVM subjects
Num_Nulliparity_MVM=sum(Placenta_HyperBase(ThirdIndex308,22));
% sum of Multiparous across all the MVM subjects
Num_Multiparous_MVM=length(Placenta_HyperBase(ThirdIndex308,22))-sum(Placenta_HyperBase(ThirdIndex308,22));

Nulliparity_B2= table([Num_Nulliparity_NPP;Num_Multiparous_NPP],[Num_Nulliparity_MVM;Num_Multiparous_MVM],'VariableNames',{'NPP','MVM'},'RowNames',{'NULLIPARITY','MULTIPAROUS'});
[Nulli_H2,Nulli_G2,Stats_Nulli_G2]=fishertest(Nulliparity_B2);

%average of Placenta depth across all the subjects in 3rd visit
Avg_Placenta_Depth_3rdT(1)=mean(Placenta_HyperBase(Index_3rdT,24));
Avg_Placenta_Depth_3rdT(2)=std(Placenta_HyperBase(Index_3rdT,24));
Avg_Placenta_Depth_3rdT(3)=median(Placenta_HyperBase(Index_3rdT,24));
Avg_Placenta_Depth_3rdT(4)=iqr(Placenta_HyperBase(Index_3rdT,24));
Avg_Placenta_Depth_3rdT(5:6)=quantile(Placenta_HyperBase(Index_3rdT,24),[0.25,0.75]);

%average of GA_meas across all the subjects in 3rd visit
Avg_GA_3rdT(1)=mean(Placenta_HyperBase(Index_3rdT,17));
Avg_GA_3rdT(2)=std(Placenta_HyperBase(Index_3rdT,17));
Avg_GA_3rdT(3)=median(Placenta_HyperBase(Index_3rdT,17));
Avg_GA_3rdT(4)=iqr(Placenta_HyperBase(Index_3rdT,17));
Avg_GA_3rdT(5:6)=quantile(Placenta_HyperBase(Index_3rdT,17),[0.25,0.75]);

%average of first prenatal BMI across all the subjects in 3rd visit
Avg_BMI_3rdT(1)=mean(Placenta_HyperBase(Index_3rdT,18));
Avg_BMI_3rdT(2)=std(Placenta_HyperBase(Index_3rdT,18));
Avg_BMI_3rdT(3)=median(Placenta_HyperBase(Index_3rdT,18));
Avg_BMI_3rdT(4)=iqr(Placenta_HyperBase(Index_3rdT,18));
Avg_BMI_3rdT(5:6)=quantile(Placenta_HyperBase(Index_3rdT,18),[0.25,0.75]);

%average of maternal age across all the subjects in 3rd visit
Avg_Age_3rdT(1)=mean(Placenta_HyperBase(Index_3rdT,19));
Avg_Age_3rdT(2)=std(Placenta_HyperBase(Index_3rdT,19));
Avg_Age_3rdT(3)=median(Placenta_HyperBase(Index_3rdT,19));
Avg_Age_3rdT(4)=iqr(Placenta_HyperBase(Index_3rdT,19));
Avg_Age_3rdT(5:6)=quantile(Placenta_HyperBase(Index_3rdT,19),[0.25,0.75]);

Avg_GA_DL_3rdT(1)=mean(Placenta_HyperBase(Index_3rdT,20));
Avg_GA_DL_3rdT(2)=std(Placenta_HyperBase(Index_3rdT,20));
Avg_GA_DL_3rdT(3)=median(Placenta_HyperBase(Index_3rdT,20));
Avg_GA_DL_3rdT(4)=iqr(Placenta_HyperBase(Index_3rdT,20));
Avg_GA_DL_3rdT(5:6)=quantile(Placenta_HyperBase(Index_3rdT,20),[0.25,0.75]);

Avg_LTGA_3rdT(1)=mean(Placenta_HyperBase(Index_3rdT,20)-Placenta_HyperBase(Index_3rdT,17));
Avg_LTGA_3rdT(2)=std(Placenta_HyperBase(Index_3rdT,20)-Placenta_HyperBase(Index_3rdT,17));
Avg_LTGA_3rdT(3)=median(Placenta_HyperBase(Index_3rdT,20)-Placenta_HyperBase(Index_3rdT,17));
Avg_LTGA_3rdT(4)=iqr(Placenta_HyperBase(Index_3rdT,20)-Placenta_HyperBase(Index_3rdT,17));
Avg_LTGA_3rdT(5:6)=quantile(Placenta_HyperBase(Index_3rdT,20)-Placenta_HyperBase(Index_3rdT,17),[0.25,0.75]);

Avg_FetalWgt_3rdT(1)=mean(Placenta_HyperBase(Index_3rdT,21));
Avg_FetalWgt_3rdT(2)=std(Placenta_HyperBase(Index_3rdT,21));
Avg_FetalWgt_3rdT(3)=median(Placenta_HyperBase(Index_3rdT,21));
Avg_FetalWgt_3rdT(4)=iqr(Placenta_HyperBase(Index_3rdT,21));
Avg_FetalWgt_3rdT(5:6)=quantile(Placenta_HyperBase(Index_3rdT,21),[0.25,0.75]);

Avg_Nulliparity_3rdT=sum(Placenta_HyperBase(Index_3rdT,22))/length(Placenta_HyperBase(Index_3rdT,22));

save([sdir '\\FinalResult.mat']);
