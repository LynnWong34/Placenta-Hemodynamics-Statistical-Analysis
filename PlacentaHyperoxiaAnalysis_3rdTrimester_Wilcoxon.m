% This program is to calculate mean (S.D.) and Median (25% 75%) of
% different variables (hyperoxia change data)
% This program will also run Wicoxon rank sum test to study the
% correlations between different variables and placental dysfunction (APO or MVM)

sdir_hyper_3rdT_box=[sdir '\\Hyperoxia_3rdT_BoxPlot'];
mkdir(sdir_hyper_3rdT_box);

% Optical data --- delta StO2/HbT/HbO2 data
% Note, all the array of optical variables will contain these information
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Avg_Placenta_****_****=
% [mean_StO2    S.D._StO2    mean_HbT    S.D._HbT    mean_HbO2    S.D._HbO2
%  median_StO2  IQR_StO2     median_HbT  IQR_HbT     median_HbO2  IQR_HbO2
%  25%_StO2     75%_StO2     25%_HbT     75%_HbT     25%_HbO2     75%_HbO2]    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%average of HyperCg (delta change) across all the NPO
Avg_Placenta_Hyper_NPO(1,1)=mean(Placenta_HyperCg(ThirdIndex101,245));
Avg_Placenta_Hyper_NPO(1,2)=std(Placenta_HyperCg(ThirdIndex101,245));
Avg_Placenta_Hyper_NPO(1,3)=median(Placenta_HyperCg(ThirdIndex101,245));
Avg_Placenta_Hyper_NPO(1,4)=iqr(Placenta_HyperCg(ThirdIndex101,245));
Avg_Placenta_Hyper_NPO(1,5:6)=quantile(Placenta_HyperCg(ThirdIndex101,245),[0.25,0.75]);

Avg_Placenta_Hyper_NPO(2,1)=mean(Placenta_HyperCg(ThirdIndex101,247));
Avg_Placenta_Hyper_NPO(2,2)=std(Placenta_HyperCg(ThirdIndex101,247));
Avg_Placenta_Hyper_NPO(2,3)=median(Placenta_HyperCg(ThirdIndex101,247));
Avg_Placenta_Hyper_NPO(2,4)=iqr(Placenta_HyperCg(ThirdIndex101,247));
Avg_Placenta_Hyper_NPO(2,5:6)=quantile(Placenta_HyperCg(ThirdIndex101,247),[0.25,0.75]);

Avg_Placenta_Hyper_NPO(3,1)=mean(Placenta_HyperCg(ThirdIndex101,249));
Avg_Placenta_Hyper_NPO(3,2)=std(Placenta_HyperCg(ThirdIndex101,249));
Avg_Placenta_Hyper_NPO(3,3)=median(Placenta_HyperCg(ThirdIndex101,249));
Avg_Placenta_Hyper_NPO(3,4)=iqr(Placenta_HyperCg(ThirdIndex101,249));
Avg_Placenta_Hyper_NPO(3,5:6)=quantile(Placenta_HyperCg(ThirdIndex101,249),[0.25,0.75]);

%average of HyperCg (delta change) across all the APO
Avg_Placenta_Hyper_APO(1,1)=mean(Placenta_HyperCg(ThirdIndex106,245));
Avg_Placenta_Hyper_APO(1,2)=std(Placenta_HyperCg(ThirdIndex106,245));
Avg_Placenta_Hyper_APO(1,3)=median(Placenta_HyperCg(ThirdIndex106,245));
Avg_Placenta_Hyper_APO(1,4)=iqr(Placenta_HyperCg(ThirdIndex106,245));
Avg_Placenta_Hyper_APO(1,5:6)=quantile(Placenta_HyperCg(ThirdIndex106,245),[0.25,0.75]);

Avg_Placenta_Hyper_APO(2,1)=mean(Placenta_HyperCg(ThirdIndex106,247));
Avg_Placenta_Hyper_APO(2,2)=std(Placenta_HyperCg(ThirdIndex106,247));
Avg_Placenta_Hyper_APO(2,3)=median(Placenta_HyperCg(ThirdIndex106,247));
Avg_Placenta_Hyper_APO(2,4)=iqr(Placenta_HyperCg(ThirdIndex106,247));
Avg_Placenta_Hyper_APO(2,5:6)=quantile(Placenta_HyperCg(ThirdIndex106,247),[0.25,0.75]);

Avg_Placenta_Hyper_APO(3,1)=mean(Placenta_HyperCg(ThirdIndex106,249));
Avg_Placenta_Hyper_APO(3,2)=std(Placenta_HyperCg(ThirdIndex106,249));
Avg_Placenta_Hyper_APO(3,3)=median(Placenta_HyperCg(ThirdIndex106,249));
Avg_Placenta_Hyper_APO(3,4)=iqr(Placenta_HyperCg(ThirdIndex106,249));
Avg_Placenta_Hyper_APO(3,5:6)=quantile(Placenta_HyperCg(ThirdIndex106,249),[0.25,0.75]);

%13th type of grouping: NPO and APO for HyperoxiaCg
%for sto2
Placenta_HyperCg_G1(1)=ranksum(Placenta_HyperCg(ThirdIndex101,245),Placenta_HyperCg(ThirdIndex106,245));
%for thc
Placenta_HyperCg_G1(2)=ranksum(Placenta_HyperCg(ThirdIndex101,247),Placenta_HyperCg(ThirdIndex106,247));
%for hbo2
Placenta_HyperCg_G1(3)=ranksum(Placenta_HyperCg(ThirdIndex101,249),Placenta_HyperCg(ThirdIndex106,249));
Placenta_HyperCg_B1_StO2=[Placenta_HyperCg(ThirdIndex101,245); Placenta_HyperCg(ThirdIndex106,245)];
Placenta_HyperCg_B1_THC=[Placenta_HyperCg(ThirdIndex101,247); Placenta_HyperCg(ThirdIndex106,247)];
Placenta_HyperCg_B1_HbO2=[Placenta_HyperCg(ThirdIndex101,249); Placenta_HyperCg(ThirdIndex106,249)];
G13_1 = repmat({'NPO'},length(Placenta_HyperBase(ThirdIndex101,1)),1);
G13_2 = repmat({'APO'},length(Placenta_HyperBase(ThirdIndex106,1)),1);
G13 = [G13_1; G13_2];
figure;
set(gcf,'Position',[250 250 1450 550]);
subplot(1,3,1);
boxplot(Placenta_HyperCg_B1_StO2,G13);
a = get(get(gca,'children'),'children');   % Get the handles of all the objects
t = get(a,'tag');   % List the names of all the objects 
idx=strcmpi(t,'box');  % Find Box objects
boxes=a(idx);          % Get the children you need
set(boxes,'linewidth',1); % Set width
ylabel('\Delta StO_2 (%)','FontSize',12,'FontWeight','bold') 
ylim([0 20]);
yticks([0 5 10 15 20]);
set(gca,'FontSize',12,'FontWeight','bold');
title(['P=' num2str(Placenta_HyperCg_G1(1),'%4.3f')],'FontSize',12,'FontWeight','bold');
subplot(1,3,2);
boxplot(Placenta_HyperCg_B1_THC,G13);
a = get(get(gca,'children'),'children');   % Get the handles of all the objects
t = get(a,'tag');   % List the names of all the objects 
idx=strcmpi(t,'box');  % Find Box objects
boxes=a(idx);          % Get the children you need
set(boxes,'linewidth',1); % Set width
ylabel('\Delta Hb_T (\mu Mol)','FontSize',12,'FontWeight','bold') 
ylim([-6 6]);
yticks([-6 -3 0 3 6]);
set(gca,'FontSize',12,'FontWeight','bold');
title(['P=' num2str(Placenta_HyperCg_G1(2),'%4.3f')],'FontSize',12,'FontWeight','bold');
subplot(1,3,3);
boxplot(Placenta_HyperCg_B1_HbO2,G13);
a = get(get(gca,'children'),'children');   % Get the handles of all the objects
t = get(a,'tag');   % List the names of all the objects 
idx=strcmpi(t,'box');  % Find Box objects
boxes=a(idx);          % Get the children you need
set(boxes,'linewidth',1); % Set width
ylabel('\Delta HbO_2 (\mu Mol)','FontSize',12,'FontWeight','bold') 
ylim([0 10]);
yticks([0 2 4 6 8 10]);
set(gca,'FontSize',12,'FontWeight','bold');
title(['P=' num2str(Placenta_HyperCg_G1(3),'%4.3f')],'FontSize',12,'FontWeight','bold');
savefig([sdir_hyper_3rdT_box '\\PlacentaHyperCg_NPO_APO.fig']);

%average of HyperCg (delta change) across all the NPP
Avg_Placenta_Hyper_NPP(1,1)=mean(Placenta_HyperCg(ThirdIndex301,245));
Avg_Placenta_Hyper_NPP(1,2)=std(Placenta_HyperCg(ThirdIndex301,245));
Avg_Placenta_Hyper_NPP(1,3)=median(Placenta_HyperCg(ThirdIndex301,245));
Avg_Placenta_Hyper_NPP(1,4)=iqr(Placenta_HyperCg(ThirdIndex301,245));
Avg_Placenta_Hyper_NPP(1,5:6)=quantile(Placenta_HyperCg(ThirdIndex301,245),[0.25,0.75]);

Avg_Placenta_Hyper_NPP(2,1)=mean(Placenta_HyperCg(ThirdIndex301,247));
Avg_Placenta_Hyper_NPP(2,2)=std(Placenta_HyperCg(ThirdIndex301,247));
Avg_Placenta_Hyper_NPP(2,3)=median(Placenta_HyperCg(ThirdIndex301,247));
Avg_Placenta_Hyper_NPP(2,4)=iqr(Placenta_HyperCg(ThirdIndex301,247));
Avg_Placenta_Hyper_NPP(2,5:6)=quantile(Placenta_HyperCg(ThirdIndex301,247),[0.25,0.75]);

Avg_Placenta_Hyper_NPP(3,1)=mean(Placenta_HyperCg(ThirdIndex301,249));
Avg_Placenta_Hyper_NPP(3,2)=std(Placenta_HyperCg(ThirdIndex301,249));
Avg_Placenta_Hyper_NPP(3,3)=median(Placenta_HyperCg(ThirdIndex301,249));
Avg_Placenta_Hyper_NPP(3,4)=iqr(Placenta_HyperCg(ThirdIndex301,249));
Avg_Placenta_Hyper_NPP(3,5:6)=quantile(Placenta_HyperCg(ThirdIndex301,249),[0.25,0.75]);

%average of HyperCg (delta change) across all the MVM
Avg_Placenta_Hyper_MVM(1,1)=mean(Placenta_HyperCg(ThirdIndex308,245));
Avg_Placenta_Hyper_MVM(1,2)=std(Placenta_HyperCg(ThirdIndex308,245));
Avg_Placenta_Hyper_MVM(1,3)=median(Placenta_HyperCg(ThirdIndex308,245));
Avg_Placenta_Hyper_MVM(1,4)=iqr(Placenta_HyperCg(ThirdIndex308,245));
Avg_Placenta_Hyper_MVM(1,5:6)=quantile(Placenta_HyperCg(ThirdIndex308,245),[0.25,0.75]);

Avg_Placenta_Hyper_MVM(2,1)=mean(Placenta_HyperCg(ThirdIndex308,247));
Avg_Placenta_Hyper_MVM(2,2)=std(Placenta_HyperCg(ThirdIndex308,247));
Avg_Placenta_Hyper_MVM(2,3)=median(Placenta_HyperCg(ThirdIndex308,247));
Avg_Placenta_Hyper_MVM(2,4)=iqr(Placenta_HyperCg(ThirdIndex308,247));
Avg_Placenta_Hyper_MVM(2,5:6)=quantile(Placenta_HyperCg(ThirdIndex308,247),[0.25,0.75]);

Avg_Placenta_Hyper_MVM(3,1)=mean(Placenta_HyperCg(ThirdIndex308,249));
Avg_Placenta_Hyper_MVM(3,2)=std(Placenta_HyperCg(ThirdIndex308,249));
Avg_Placenta_Hyper_MVM(3,3)=median(Placenta_HyperCg(ThirdIndex308,249));
Avg_Placenta_Hyper_MVM(3,4)=iqr(Placenta_HyperCg(ThirdIndex308,249));
Avg_Placenta_Hyper_MVM(3,5:6)=quantile(Placenta_HyperCg(ThirdIndex308,249),[0.25,0.75]);

%14th type of grouping: NPP and MVM for HyperoxiaCg
%for sto2
Placenta_HyperCg_G2(1)=ranksum(Placenta_HyperCg(ThirdIndex301,245),Placenta_HyperCg(ThirdIndex308,245));
%for thc
Placenta_HyperCg_G2(2)=ranksum(Placenta_HyperCg(ThirdIndex301,247),Placenta_HyperCg(ThirdIndex308,247));
%for hbo2
Placenta_HyperCg_G2(3)=ranksum(Placenta_HyperCg(ThirdIndex301,249),Placenta_HyperCg(ThirdIndex308,249));
Placenta_HyperCg_B2_StO2=[Placenta_HyperCg(ThirdIndex301,245); Placenta_HyperCg(ThirdIndex308,245)];
Placenta_HyperCg_B2_THC=[Placenta_HyperCg(ThirdIndex301,247); Placenta_HyperCg(ThirdIndex308,247)];
Placenta_HyperCg_B2_HbO2=[Placenta_HyperCg(ThirdIndex301,249); Placenta_HyperCg(ThirdIndex308,249)];
G14_1 = repmat({'NPP'},length(Placenta_HyperCg(ThirdIndex301,1)),1);
G14_2 = repmat({'MVM'},length(Placenta_HyperCg(ThirdIndex308,1)),1);
G14 = [G14_1; G14_2];
figure;
set(gcf,'Position',[250 250 1450 550]);
subplot(1,3,1);
boxplot(Placenta_HyperCg_B2_StO2,G14);
a = get(get(gca,'children'),'children');   % Get the handles of all the objects
t = get(a,'tag');   % List the names of all the objects 
idx=strcmpi(t,'box');  % Find Box objects
boxes=a(idx);          % Get the children you need
set(boxes,'linewidth',1); % Set width
ylabel('\Delta StO_2 (%)','FontSize',12,'FontWeight','bold') 
ylim([0 20]);
yticks([0 5 10 15 20]);
set(gca,'FontSize',12,'FontWeight','bold');
title(['P=' num2str(Placenta_HyperCg_G2(1),'%4.3f')],'FontSize',12,'FontWeight','bold');
subplot(1,3,2);
boxplot(Placenta_HyperCg_B2_THC,G14);
a = get(get(gca,'children'),'children');   % Get the handles of all the objects
t = get(a,'tag');   % List the names of all the objects 
idx=strcmpi(t,'box');  % Find Box objects
boxes=a(idx);          % Get the children you need
set(boxes,'linewidth',1); % Set width
ylabel('\Delta Hb_T (\mu Mol)','FontSize',12,'FontWeight','bold') 
ylim([-6 6]);
yticks([-6 -3 0 3 6]);
set(gca,'FontSize',12,'FontWeight','bold');
title(['P=' num2str(Placenta_HyperCg_G2(2),'%4.3f')],'FontSize',12,'FontWeight','bold');
subplot(1,3,3);
boxplot(Placenta_HyperCg_B2_HbO2,G14);
a = get(get(gca,'children'),'children');   % Get the handles of all the objects
t = get(a,'tag');   % List the names of all the objects 
idx=strcmpi(t,'box');  % Find Box objects
boxes=a(idx);          % Get the children you need
set(boxes,'linewidth',1); % Set width
ylabel('\Delta HbO_2 (\mu Mol)','FontSize',12,'FontWeight','bold') 
ylim([0 10]);
yticks([0 2 4 6 8 10]);
set(gca,'FontSize',12,'FontWeight','bold');
title(['P=' num2str(Placenta_HyperCg_G2(3),'%4.3f')],'FontSize',12,'FontWeight','bold');
savefig([sdir_hyper_3rdT_box '\\PlacentaHyperCg_NPP_MVM.fig']);

save([sdir '\\FinalResult.mat']);
