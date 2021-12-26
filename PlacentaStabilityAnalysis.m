sdir_stability=[sdir '\\Stablity'];
mkdir(sdir_stability);

% Placenta_Stability array is the total 10 frames baseline data
Placenta_Stability=zeros(Num_Sub,12);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1 SubjectNo(not ID)     2 SubjectID 
% 3 VisitNo               4 Marker
% 5 Mean(StO2_Plact)      6 SD(StO2_Plact)
% 7 Mean(THC_Plact)       8 SD(THC_Plact)
% 9 Mean(HbO2_Plact)      10 SD(HbO2_Plact)
% 11 Placenta Depth       12 GA at measurement
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Placenta_Stability(:,1:4)=Placenta_HyperBase(:,1:4);
Placenta_Stability(:,12)=Placenta_HyperBase(:,17);
Ind_Baseline=1:10;
for measnum=1:1:Num_Sub
    measind=(measnum-1)*10+1:(measnum-1)*10+10;
    tem_Plact_Base=Placenta_Base(measind,:);
    % use the frames who has situation code <5 in the basewindow
    [inindoutcome100,rhoind]=find(tem_Plact_Base(Ind_Baseline,6)>0 & tem_Plact_Base(Ind_Baseline,5)<5);
    if isempty(inindoutcome100)
        Placenta_Stability(measnum,5:11)=0;
    else
        size=length(inindoutcome100);
        Placenta_Stability(measnum,5)=mean(tem_Plact_Base(inindoutcome100,6));
        Placenta_Stability(measnum,6)=(std(tem_Plact_Base(inindoutcome100,6)));
        Placenta_Stability(measnum,7)=mean(tem_Plact_Base(inindoutcome100,7));
        Placenta_Stability(measnum,8)=(std(tem_Plact_Base(inindoutcome100,7)));
        Placenta_Stability(measnum,9)=mean(tem_Plact_Base(inindoutcome100,8));
        Placenta_Stability(measnum,10)=(std(tem_Plact_Base(inindoutcome100,8)));
        Placenta_Stability(measnum,11)=Placenta_Stability(measnum,6)/Placenta_Stability(measnum,5);
        Placenta_Stability(measnum,12)=Placenta_Stability(measnum,8)/Placenta_Stability(measnum,7);
        Placenta_Stability(measnum,13)=Placenta_Stability(measnum,10)/Placenta_Stability(measnum,9);
    end
end
%Average mean and std of all these patients who already have pregnancy outcome
Avg_Stability_3rdT(1)=mean(Placenta_Stability(Index_3rdT,5));
Avg_Stability_3rdT(2)=mean(Placenta_Stability(Index_3rdT,6));
Avg_Stability_3rdT(3)=mean(Placenta_Stability(Index_3rdT,7));
Avg_Stability_3rdT(4)=mean(Placenta_Stability(Index_3rdT,8));
Avg_Stability_3rdT(5)=mean(Placenta_Stability(Index_3rdT,9));
Avg_Stability_3rdT(6)=mean(Placenta_Stability(Index_3rdT,10));

% plot data stability with error bar (sd)
figure;
set(gcf,'Position',[250 250 1450 550]);
subplot(1,3,1);
errorbar(Placenta_HyperBase(Index_3rdT,17),Placenta_Stability(Index_3rdT,5),Placenta_Stability(Index_3rdT,6),'bo','MarkerSize',6,'LineWidth',1,'MarkerFaceColor','b');
title(['AverageS.D.=' num2str(Avg_Stability_3rdT(2),'%4.1f') ' (%)'],'FontSize',10,'FontWeight','bold')
xlabel('GA (weeks)','FontSize',10,'FontWeight','bold') 
ylabel('StO_2 (%)','FontSize',10,'FontWeight','bold') 
ylim([40 100]);
set(gca,'FontSize',10,'FontWeight','bold'); 
subplot(1,3,2);
errorbar(Placenta_HyperBase(Index_3rdT,17),Placenta_Stability(Index_3rdT,7),Placenta_Stability(Index_3rdT,8),'bo','MarkerSize',6,'LineWidth',1,'MarkerFaceColor','b');
title(['AverageS.D.=' num2str(Avg_Stability_3rdT(4),'%4.1f') ' (\mu Mol)'],'FontSize',10,'FontWeight','bold')
xlabel('GA (weeks)','FontSize',10,'FontWeight','bold') 
ylabel('Hb_T (\mu Mol)','FontSize',10,'FontWeight','bold') 
ylim([0 100]);
set(gca,'FontSize',10,'FontWeight','bold'); 
subplot(1,3,3);
errorbar(Placenta_HyperBase(Index_3rdT,17),Placenta_Stability(Index_3rdT,9),Placenta_Stability(Index_3rdT,10),'bo','MarkerSize',6,'LineWidth',1,'MarkerFaceColor','b');
title(['AverageS.D.=' num2str(Avg_Stability_3rdT(6),'%4.1f') ' (\mu Mol)'],'FontSize',10,'FontWeight','bold')
xlabel('GA (weeks)','FontSize',10,'FontWeight','bold') 
ylabel('HbO_2 (\mu Mol)','FontSize',10,'FontWeight','bold') 
ylim([0 60]);
set(gca,'FontSize',10,'FontWeight','bold'); 
savefig([sdir_stability '\\PlacentaStability_vs_GA.fig']);

% plot sd distribution (%)
figure;
set(gcf,'Position',[250 250 1450 550]);
subplot(1,3,1);
histogram(Placenta_Stability(Index_3rdT,6), 'Normalization','probability');
title(['AverageS.D.=' num2str(Avg_Stability_3rdT(2),'%4.1f') ' (%)'],'FontSize',10,'FontWeight','bold')
xlabel('S.D. of StO_2','FontSize',10,'FontWeight','bold') 
ylabel('Percentage (%)','FontSize',10,'FontWeight','bold') 
ytix = get(gca, 'YTick');
set(gca, 'YTick',ytix, 'YTickLabel',ytix*100);
set(gca,'FontSize',10,'FontWeight','bold'); 
subplot(1,3,2);
histogram(Placenta_Stability(Index_3rdT,8), 'Normalization','probability');
title(['AverageS.D.=' num2str(Avg_Stability_3rdT(4),'%4.1f') ' (\mu Mol)'],'FontSize',10,'FontWeight','bold')
xlabel('S.D. of Hb_T','FontSize',10,'FontWeight','bold') 
ylabel('Percentage (%)','FontSize',10,'FontWeight','bold') 
ytix = get(gca, 'YTick');
set(gca, 'YTick',ytix, 'YTickLabel',ytix*100);
set(gca,'FontSize',10,'FontWeight','bold'); 
subplot(1,3,3);
histogram(Placenta_Stability(Index_3rdT,10), 'Normalization','probability');
title(['AverageS.D.=' num2str(Avg_Stability_3rdT(6),'%4.1f') ' (\mu Mol)'],'FontSize',10,'FontWeight','bold')
xlabel('S.D. of HbO_2','FontSize',10,'FontWeight','bold') 
ylabel('Percentage (%)','FontSize',10,'FontWeight','bold') 
ytix = get(gca, 'YTick');
set(gca, 'YTick',ytix, 'YTickLabel',ytix*100);
set(gca,'FontSize',10,'FontWeight','bold'); 
savefig([sdir_stability '\\PlacentaStabilityHistogram.fig']);

% plot sd distribution (number)
figure;
set(gcf,'Position',[250 250 1450 550]);
subplot(1,3,1);
histogram(Placenta_Stability(Index_3rdT,6));
title(['AverageS.D.=' num2str(Avg_Stability_3rdT(2),'%4.1f') ' (%)'],'FontSize',10,'FontWeight','bold')
xlabel('S.D. of StO_2','FontSize',10,'FontWeight','bold') 
ylabel('Number','FontSize',10,'FontWeight','bold') 
ytix = get(gca, 'YTick');
set(gca, 'YTick',ytix, 'YTickLabel',ytix);
set(gca,'FontSize',10,'FontWeight','bold'); 
subplot(1,3,2);
histogram(Placenta_Stability(Index_3rdT,8));
title(['AverageS.D.=' num2str(Avg_Stability_3rdT(4),'%4.1f') ' (\mu Mol)'],'FontSize',10,'FontWeight','bold')
xlabel('S.D. of Hb_T','FontSize',10,'FontWeight','bold') 
ylabel('Number','FontSize',10,'FontWeight','bold') 
ytix = get(gca, 'YTick');
set(gca, 'YTick',ytix, 'YTickLabel',ytix);
set(gca,'FontSize',10,'FontWeight','bold'); 
subplot(1,3,3);
histogram(Placenta_Stability(Index_3rdT,10));
title(['AverageS.D.=' num2str(Avg_Stability_3rdT(6),'%4.1f') ' (\mu Mol)'],'FontSize',10,'FontWeight','bold')
xlabel('S.D. of HbO_2','FontSize',10,'FontWeight','bold') 
ylabel('Number','FontSize',10,'FontWeight','bold') 
ytix = get(gca, 'YTick');
set(gca, 'YTick',ytix, 'YTickLabel',ytix);
set(gca,'FontSize',10,'FontWeight','bold'); 
savefig([sdir_stability '\\PlacentaStabilityHistogramNum.fig']);

% plot COV as box plot.
Placenta_COV=[Placenta_Stability(:,11);Placenta_Stability(:,12);Placenta_Stability(:,13)]*100;
GCOV_1 = repmat({'StO_2'},length(Placenta_Stability(:,11)),1);
GCOV_2 = repmat({'Hb_T'},length(Placenta_Stability(:,12)),1);
GCOV_3 = repmat({'HbO_2'},length(Placenta_Stability(:,13)),1);
GCOV=[GCOV_1;GCOV_2;GCOV_3];
figure;
set(gcf,'Position',[250 250 650 550]);
boxplot(Placenta_COV,GCOV);
ylabel('Coefficient of variation (%)','FontSize',12,'FontWeight','bold') 
set(gca,'FontSize',12,'FontWeight','bold');
savefig([sdir_stability '\\PlacentaStabilityCOV.fig']);

save([sdir '\\FinalResult.mat']);
Ttable=table(Placenta_Stability);
exlfilename=[sdir '\\PlacentaStability.xlsx'];
writetable(Ttable,exlfilename);