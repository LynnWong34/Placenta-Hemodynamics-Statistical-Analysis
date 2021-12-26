% this program will process the hyperoxia baseline data for third visit (third trimester)
% Note, here the baseline data means the HyperBase, which is the last 4-frame-window 
% To calculate the baseline mean StO2/HbT/HbO2 for hyperoxia experiment

sdir_bl_3rdT=[sdir '\\Baseline_3rdT'];
mkdir(sdir_bl_3rdT);

% Search index of third visit for different pregnancy outcome and pathology result
% All these third visit data 
[Index_3rdT,~]=find(Placenta_HyperBase(:,3)==3);
% Normal prengnay outcome
[ind_101,~]=find(Placenta_HyperBase(Index_3rdT,15)==101);
ThirdIndex101=Index_3rdT(ind_101);
% GHTN
[ind_102,~]=find(Placenta_HyperBase(Index_3rdT,15)==102);
ThirdIndex102=Index_3rdT(ind_102);
% Preeclampsia
[ind_103,~]=find(Placenta_HyperBase(Index_3rdT,15)==103);
ThirdIndex103=Index_3rdT(ind_103);
% IUGR
[ind_104,~]=find(Placenta_HyperBase(Index_3rdT,15)==104);
ThirdIndex104=Index_3rdT(ind_104);
% APO = [GHTN PEC IUGR]
[ind_106,~]=find(Placenta_HyperBase(Index_3rdT,15)>101);
ThirdIndex106=Index_3rdT(ind_106);
% Normal pathology 
[ind_301,~]=find(Placenta_HyperBase(Index_3rdT,16)==301);
ThirdIndex301=Index_3rdT(ind_301);
% Mild MVM
[ind_303,~]=find(Placenta_HyperBase(Index_3rdT,16)==303);
ThirdIndex303=Index_3rdT(ind_303);
% Severe MVM
[ind_305,~]=find(Placenta_HyperBase(Index_3rdT,16)==305);
ThirdIndex305=Index_3rdT(ind_305);
% 308 is ALL MVM
ThirdIndex308=[ThirdIndex303; ThirdIndex305] ;

%mean(S.D.), median (iqr) of delta StO2/HbT/StO2 across all these Subjects in their 3rd visit 
Avg_Placenta_HyperBase_3rdT(1,1)=mean(Placenta_HyperBase(Index_3rdT,5));
Avg_Placenta_HyperBase_3rdT(1,2)=std(Placenta_HyperBase(Index_3rdT,5));
Avg_Placenta_HyperBase_3rdT(1,3)=median(Placenta_HyperBase(Index_3rdT,5));
Avg_Placenta_HyperBase_3rdT(1,4)=iqr(Placenta_HyperBase(Index_3rdT,5));
Avg_Placenta_HyperBase_3rdT(1,5:6)=quantile(Placenta_HyperBase(Index_3rdT,5),[0.25,0.75]);
Avg_Placenta_HyperBase_3rdT(2,1)=mean(Placenta_HyperBase(Index_3rdT,7));
Avg_Placenta_HyperBase_3rdT(2,2)=std(Placenta_HyperBase(Index_3rdT,7));
Avg_Placenta_HyperBase_3rdT(2,3)=median(Placenta_HyperBase(Index_3rdT,7));
Avg_Placenta_HyperBase_3rdT(2,4)=iqr(Placenta_HyperBase(Index_3rdT,7));
Avg_Placenta_HyperBase_3rdT(2,5:6)=quantile(Placenta_HyperBase(Index_3rdT,7),[0.25,0.75]);
Avg_Placenta_HyperBase_3rdT(3,1)=mean(Placenta_HyperBase(Index_3rdT,9));
Avg_Placenta_HyperBase_3rdT(3,2)=std(Placenta_HyperBase(Index_3rdT,9));
Avg_Placenta_HyperBase_3rdT(3,3)=median(Placenta_HyperBase(Index_3rdT,9));
Avg_Placenta_HyperBase_3rdT(3,4)=iqr(Placenta_HyperBase(Index_3rdT,9));
Avg_Placenta_HyperBase_3rdT(3,5:6)=quantile(Placenta_HyperBase(Index_3rdT,9),[0.25,0.75]);

% Plot GA VS StO2/THC/HbO2 with pregnancy outcome coding
% and pathology coding
figure;
set(gcf,'Position',[250 250 1450 550]);
subplot(1,3,1);
errorbar(Placenta_HyperBase(ThirdIndex101,17),Placenta_HyperBase(ThirdIndex101,5),Placenta_HyperBase(ThirdIndex101,6),'o','MarkerSize',6,'color',[0.0431    0.4000    0.1373],'LineWidth',1,'MarkerFaceColor',[0.0431    0.4000    0.1373]);
hold on;
errorbar(Placenta_HyperBase(ThirdIndex106,17),Placenta_HyperBase(ThirdIndex106,5),Placenta_HyperBase(ThirdIndex106,6),'r*','MarkerSize',6,'LineWidth',1,'MarkerFaceColor','r');
hold on;
plot(Placenta_HyperBase(ThirdIndex301,17),Placenta_HyperBase(ThirdIndex301,5),'s','MarkerSize',12,'color',[0.0431    0.4000    0.1373],'LineWidth',1.5);
hold on;
plot(Placenta_HyperBase(ThirdIndex308,17),Placenta_HyperBase(ThirdIndex308,5),'rd','MarkerSize',12,'LineWidth',1.5);
title(['Median (StO_2) =' num2str(Avg_Placenta_HyperBase_3rdT(1,3),'%4.1f')],'FontSize',12,'FontWeight','bold')
xlabel('GA (weeks)','FontSize',12,'FontWeight','bold') 
ylabel('StO_2 (%)','FontSize',12,'FontWeight','bold') 
ylim([40 100]);
set(gca,'FontSize',12,'FontWeight','bold'); 
subplot(1,3,2);
errorbar(Placenta_HyperBase(ThirdIndex101,17),Placenta_HyperBase(ThirdIndex101,7),Placenta_HyperBase(ThirdIndex101,8),'o','MarkerSize',6,'color',[0.0431    0.4000    0.1373],'LineWidth',1,'MarkerFaceColor',[0.0431    0.4000    0.1373]);
hold on;
errorbar(Placenta_HyperBase(ThirdIndex106,17),Placenta_HyperBase(ThirdIndex106,7),Placenta_HyperBase(ThirdIndex106,8),'r*','MarkerSize',6,'LineWidth',1,'MarkerFaceColor','r');
hold on;
plot(Placenta_HyperBase(ThirdIndex301,17),Placenta_HyperBase(ThirdIndex301,7),'s','MarkerSize',12,'color',[0.0431    0.4000    0.1373],'LineWidth',1.5);
hold on;
plot(Placenta_HyperBase(ThirdIndex308,17),Placenta_HyperBase(ThirdIndex308,7),'rd','MarkerSize',12,'LineWidth',1.5);
title(['Median (Hb_T) =' num2str(Avg_Placenta_HyperBase_3rdT(2,3),'%4.1f')],'FontSize',12,'FontWeight','bold')
xlabel('GA (weeks)','FontSize',12,'FontWeight','bold') 
ylabel('Hb_T (\mu Mol)','FontSize',12,'FontWeight','bold') 
ylim([0 100]);
set(gca,'FontSize',12,'FontWeight','bold'); 
subplot(1,3,3);
errorbar(Placenta_HyperBase(ThirdIndex101,17),Placenta_HyperBase(ThirdIndex101,9),Placenta_HyperBase(ThirdIndex101,10),'o','MarkerSize',6,'color',[0.0431    0.4000    0.1373],'LineWidth',1,'MarkerFaceColor',[0.0431    0.4000    0.1373]);
hold on;
errorbar(Placenta_HyperBase(ThirdIndex106,17),Placenta_HyperBase(ThirdIndex106,9),Placenta_HyperBase(ThirdIndex106,10),'r*','MarkerSize',6,'LineWidth',1,'MarkerFaceColor','r');
hold on;
plot(Placenta_HyperBase(ThirdIndex301,17),Placenta_HyperBase(ThirdIndex301,9),'s','MarkerSize',12,'color',[0.0431    0.4000    0.1373],'LineWidth',1.5);
hold on;
plot(Placenta_HyperBase(ThirdIndex308,17),Placenta_HyperBase(ThirdIndex308,9),'rd','MarkerSize',12,'LineWidth',1.5);
title(['Median (HbO_2) =' num2str(Avg_Placenta_HyperBase_3rdT(3,3),'%4.1f')],'FontSize',12,'FontWeight','bold')
xlabel('GA (weeks)','FontSize',12,'FontWeight','bold') 
ylabel('HbO_2 (\mu Mol)','FontSize',12,'FontWeight','bold') 
ylim([0 60]);
set(gca,'FontSize',12,'FontWeight','bold'); 
legend('NPO','APO','NPP','MVM');%,'FontSize',14,'FontWeight','bold');
savefig([sdir_bl_3rdT '\\PlacentaHyperBase_vs_GA_PO_PP_3rdT.fig']);


save([sdir '\\FinalResult.mat']);

