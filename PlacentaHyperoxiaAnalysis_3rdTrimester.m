% Analyze placenta hemoglobin data during maternal hyperoxia 
% Here 3rdT means only for third trimesters data
% Codes were prepared for analyzing data from all the trimesters 
% But we only present data of third trimester in this paper

% This program will observe the averaged relative StO2/HbT/HbO2 across
% different group. 

% This program will also present the delta StO2/HbT/HbO2 of all the subjects

sdir_hyper_3rdT=[sdir '\\Hyperoxia_3rdT'];
mkdir(sdir_hyper_3rdT);

sorind_plot=1:40;

% plot the average of placenta hyperoxia hemodynamics across all the subjects
Placenta_Hyper_Mean_3rd=zeros(40,7);
for l=1:1:40
    Placenta_Hyper_Mean_3rd(l,1)=l*TTIME;    %prepare for plotting x axis (time)
    measind=(Index_3rdT-1)*40+l;
    temPlacenta_Hyper=Placenta_Hyper_Relat(measind,:);
    %   All these valuable frames
    [ind_nonzero,~]=find(temPlacenta_Hyper(:,6)>0 & temPlacenta_Hyper(:,5)<5);
    size=length(ind_nonzero);
    %mean of StO2
    Placenta_Hyper_Mean_3rd(l,2)=mean(temPlacenta_Hyper(ind_nonzero,6));
    %Standard error of StO2
    Placenta_Hyper_Mean_3rd(l,3)=std(temPlacenta_Hyper(ind_nonzero,6))/sqrt(size);
    %mean of HbT
    Placenta_Hyper_Mean_3rd(l,4)=mean(temPlacenta_Hyper(ind_nonzero,7));
    %Standard error of HbT
    Placenta_Hyper_Mean_3rd(l,5)=std(temPlacenta_Hyper(ind_nonzero,7))/sqrt(size);
    %mean of HbO2
    Placenta_Hyper_Mean_3rd(l,6)=mean(temPlacenta_Hyper(ind_nonzero,8));
    %Standard error of HbO2
    Placenta_Hyper_Mean_3rd(l,7)=std(temPlacenta_Hyper(ind_nonzero,8))/sqrt(size);
end
figure;
set(gcf,'Position',[350 250 750 550]);
% x axis is time
xplot=(Placenta_Hyper_Mean_3rd(sorind_plot,1))';
xplot2=[xplot fliplr(xplot)];
% plot StO2
% use standard error to plot shaded area
curve1=(Placenta_Hyper_Mean_3rd(sorind_plot,2)+Placenta_Hyper_Mean_3rd(sorind_plot,3))';
curve2=(Placenta_Hyper_Mean_3rd(sorind_plot,2)-Placenta_Hyper_Mean_3rd(sorind_plot,3))';
inBetween = [curve1 fliplr(curve2)];
s=fill(xplot2,inBetween,[255/255 153/255 255/255], 'linestyle', 'none');
alpha(s,.4)
hold on;
plot(Placenta_Hyper_Mean_3rd(sorind_plot,1),Placenta_Hyper_Mean_3rd(sorind_plot,2),'m','LineWidth',1);
hold on;
% plot HbT
% use standard error to plot shaded area
curve1=(Placenta_Hyper_Mean_3rd(sorind_plot,4)+Placenta_Hyper_Mean_3rd(sorind_plot,5))';
curve2=(Placenta_Hyper_Mean_3rd(sorind_plot,4)-Placenta_Hyper_Mean_3rd(sorind_plot,5))';
inBetween = [curve1 fliplr(curve2)];
s=fill(xplot2,inBetween,[153/255 255/255 255/255], 'linestyle', 'none');
alpha(s,.4)
hold on;
plot(Placenta_Hyper_Mean_3rd(sorind_plot,1),Placenta_Hyper_Mean_3rd(sorind_plot,4),'b','LineWidth',1);
hold on;
% plot HbO2
% use standard error to plot shaded area
curve1=(Placenta_Hyper_Mean_3rd(sorind_plot,6)+Placenta_Hyper_Mean_3rd(sorind_plot,7))';
curve2=(Placenta_Hyper_Mean_3rd(sorind_plot,6)-Placenta_Hyper_Mean_3rd(sorind_plot,7))';
inBetween = [curve1 fliplr(curve2)];
s=fill(xplot2,inBetween,[255/255 153/255 153/255], 'linestyle', 'none');
alpha(s,.4)
hold on;
plot(Placenta_Hyper_Mean_3rd(sorind_plot,1),Placenta_Hyper_Mean_3rd(sorind_plot,6),'r','LineWidth',1);
ylim([0.925 1.175]);
yticks([0.95 1 1.05 1.10 1.15]);
xlabel('Time (min)','FontSize',12,'FontWeight','bold') 
ylabel('rStO_2 / rHb_T / rHbO_2','FontSize',12,'FontWeight','bold') 
set(gca,'FontSize',12,'FontWeight','bold'); 
hold off;
title('Average across all subjects');
legend('S.E. of rStO_2','rStO_2','S.E. of rHb_T','rHb_T','S.E. of rHbO_2','rHbO_2','Location','northwest');
savefig([sdir_hyper_3rdT '\\PlacentaNormalizedHyperoxiaHemodynamics_AllSubjects.fig']);

% plot the average of placenta hyperoxia hemodynamics across all the NPO
Placenta_Hyper_Mean_NPO=zeros(40,7);
for l=1:1:40
    Placenta_Hyper_Mean_NPO(l,1)=l*TTIME;    %prepare for plotting x axis (time)
    measind=(ThirdIndex101-1)*40+l;
    temPlacenta_Hyper=Placenta_Hyper_Relat(measind,:);
    [ind_nonzero,~]=find(temPlacenta_Hyper(:,6)>0 & temPlacenta_Hyper(:,5)<5);
    size=length(ind_nonzero);
    %mean of StO2
    Placenta_Hyper_Mean_NPO(l,2)=mean(temPlacenta_Hyper(ind_nonzero,6));
    %Standard error of StO2
    Placenta_Hyper_Mean_NPO(l,3)=std(temPlacenta_Hyper(ind_nonzero,6))/sqrt(size);
    %mean of HbT
    Placenta_Hyper_Mean_NPO(l,4)=mean(temPlacenta_Hyper(ind_nonzero,7));
    %Standard error of HbT
    Placenta_Hyper_Mean_NPO(l,5)=std(temPlacenta_Hyper(ind_nonzero,7))/sqrt(size);
    %mean of HbO2
    Placenta_Hyper_Mean_NPO(l,6)=mean(temPlacenta_Hyper(ind_nonzero,8));
    %Standard error of HbO2
    Placenta_Hyper_Mean_NPO(l,7)=std(temPlacenta_Hyper(ind_nonzero,8))/sqrt(size);
end
figure;
set(gcf,'Position',[350 250 750 550]);
% x axis is time
xplot=(Placenta_Hyper_Mean_NPO(sorind_plot,1))';
xplot2=[xplot fliplr(xplot)];
% plot StO2
% use standard error to plot shaded area
curve1=(Placenta_Hyper_Mean_NPO(sorind_plot,2)+Placenta_Hyper_Mean_NPO(sorind_plot,3))';
curve2=(Placenta_Hyper_Mean_NPO(sorind_plot,2)-Placenta_Hyper_Mean_NPO(sorind_plot,3))';
inBetween = [curve1 fliplr(curve2)];
s=fill(xplot2,inBetween,[255/255 153/255 255/255], 'linestyle', 'none');
alpha(s,.4)
hold on;
plot(Placenta_Hyper_Mean_NPO(sorind_plot,1),Placenta_Hyper_Mean_NPO(sorind_plot,2),'m','LineWidth',1);
hold on;
% plot HbT
% use standard error to plot shaded area
curve1=(Placenta_Hyper_Mean_NPO(sorind_plot,4)+Placenta_Hyper_Mean_NPO(sorind_plot,5))';
curve2=(Placenta_Hyper_Mean_NPO(sorind_plot,4)-Placenta_Hyper_Mean_NPO(sorind_plot,5))';
inBetween = [curve1 fliplr(curve2)];
s=fill(xplot2,inBetween,[153/255 255/255 255/255], 'linestyle', 'none');
alpha(s,.4)
hold on;
plot(Placenta_Hyper_Mean_NPO(sorind_plot,1),Placenta_Hyper_Mean_NPO(sorind_plot,4),'b','LineWidth',1);
hold on;
% plot HbO2
% use standard error to plot shaded area
curve1=(Placenta_Hyper_Mean_NPO(sorind_plot,6)+Placenta_Hyper_Mean_NPO(sorind_plot,7))';
curve2=(Placenta_Hyper_Mean_NPO(sorind_plot,6)-Placenta_Hyper_Mean_NPO(sorind_plot,7))';
inBetween = [curve1 fliplr(curve2)];
s=fill(xplot2,inBetween,[255/255 153/255 153/255], 'linestyle', 'none');
alpha(s,.4)
hold on;
plot(Placenta_Hyper_Mean_NPO(sorind_plot,1),Placenta_Hyper_Mean_NPO(sorind_plot,6),'r','LineWidth',1);
ylim([0.925 1.175]);
yticks([0.95 1 1.05 1.10 1.15]);
xlabel('Time (min)','FontSize',12,'FontWeight','bold') 
ylabel('rStO_2,   rHb_T,   rHbO_2','FontSize',12,'FontWeight','bold') 
set(gca,'FontSize',12,'FontWeight','bold'); 
hold off;
legend('S.E. of rStO_2','rStO_2','S.E. of rHb_T','rHb_T','S.E. of rHbO_2','rHbO_2','Location','northwest');
title('Average across NPO subjects');
savefig([sdir_hyper_3rdT '\\PlacentaNormalizedHyperoxiaHemodynamics_NPO.fig']);

% plot the average of placenta hyperoxia hemodynamics across all the APO
Placenta_Hyper_Mean_APO=zeros(40,7);
for l=1:1:40
    Placenta_Hyper_Mean_APO(l,1)=l*TTIME;    %prepare for plotting x axis (time)
    measind=(ThirdIndex106-1)*40+l;
    temPlacenta_Hyper=Placenta_Hyper_Relat(measind,:);
    [ind_nonzero,~]=find(temPlacenta_Hyper(:,6)>0 & temPlacenta_Hyper(:,5)<5);
    size=length(ind_nonzero);
    %mean of StO2
    Placenta_Hyper_Mean_APO(l,2)=mean(temPlacenta_Hyper(ind_nonzero,6));
    %Standard error of StO2
    Placenta_Hyper_Mean_APO(l,3)=std(temPlacenta_Hyper(ind_nonzero,6))/sqrt(size);
    %mean of HbT
    Placenta_Hyper_Mean_APO(l,4)=mean(temPlacenta_Hyper(ind_nonzero,7));
    %Standard error of HbT
    Placenta_Hyper_Mean_APO(l,5)=std(temPlacenta_Hyper(ind_nonzero,7))/sqrt(size);
    %mean of HbO2
    Placenta_Hyper_Mean_APO(l,6)=mean(temPlacenta_Hyper(ind_nonzero,8));
    %Standard error of HbO2
    Placenta_Hyper_Mean_APO(l,7)=std(temPlacenta_Hyper(ind_nonzero,8))/sqrt(size);
end
figure;
set(gcf,'Position',[350 250 750 550]);
% x axis is time
xplot=(Placenta_Hyper_Mean_APO(sorind_plot,1))';
xplot2=[xplot fliplr(xplot)];
% plot StO2
% use standard error to plot shaded area
curve1=(Placenta_Hyper_Mean_APO(sorind_plot,2)+Placenta_Hyper_Mean_APO(sorind_plot,3))';
curve2=(Placenta_Hyper_Mean_APO(sorind_plot,2)-Placenta_Hyper_Mean_APO(sorind_plot,3))';
inBetween = [curve1 fliplr(curve2)];
s=fill(xplot2,inBetween,[255/255 153/255 255/255], 'linestyle', 'none');
alpha(s,.4)
hold on;
plot(Placenta_Hyper_Mean_APO(sorind_plot,1),Placenta_Hyper_Mean_APO(sorind_plot,2),'m','LineWidth',1);
hold on;
% plot HbT
% use standard error to plot shaded area
curve1=(Placenta_Hyper_Mean_APO(sorind_plot,4)+Placenta_Hyper_Mean_APO(sorind_plot,5))';
curve2=(Placenta_Hyper_Mean_APO(sorind_plot,4)-Placenta_Hyper_Mean_APO(sorind_plot,5))';
inBetween = [curve1 fliplr(curve2)];
s=fill(xplot2,inBetween,[153/255 255/255 255/255], 'linestyle', 'none');
alpha(s,.4)
hold on;
plot(Placenta_Hyper_Mean_APO(sorind_plot,1),Placenta_Hyper_Mean_APO(sorind_plot,4),'b','LineWidth',1);
hold on;
% plot HbO2
% use standard error to plot shaded area
curve1=(Placenta_Hyper_Mean_APO(sorind_plot,6)+Placenta_Hyper_Mean_APO(sorind_plot,7))';
curve2=(Placenta_Hyper_Mean_APO(sorind_plot,6)-Placenta_Hyper_Mean_APO(sorind_plot,7))';
inBetween = [curve1 fliplr(curve2)];
s=fill(xplot2,inBetween,[255/255 153/255 153/255], 'linestyle', 'none');
alpha(s,.4)
hold on;
plot(Placenta_Hyper_Mean_APO(sorind_plot,1),Placenta_Hyper_Mean_APO(sorind_plot,6),'r','LineWidth',1);
ylim([0.925 1.175]);
yticks([0.95 1 1.05 1.10 1.15]);
xlabel('Time (min)','FontSize',12,'FontWeight','bold') 
ylabel('rStO_2,   rHb_T,   rHbO_2','FontSize',12,'FontWeight','bold') 
set(gca,'FontSize',12,'FontWeight','bold'); 
hold off;
legend('S.E. of rStO_2','rStO_2','S.E. of rHb_T','rHb_T','S.E. of rHbO_2','rHbO_2','Location','northwest');
title('Average across APO subjects');
savefig([sdir_hyper_3rdT '\\PlacentaNormalizedHyperoxiaHemodynamics_APO.fig']);

% plot the average of placenta hyperoxia hemodynamics across NPP subjects
Placenta_Hyper_Mean_NPP=zeros(40,7);
for l=1:1:40
    Placenta_Hyper_Mean_NPP(l,1)=l*TTIME;    %prepare for plotting x axis (time)
    measind=(ThirdIndex301-1)*40+l;
    temPlacenta_Hyper=Placenta_Hyper_Relat(measind,:);
    %   All these valuable frames
    [ind_nonzero,~]=find(temPlacenta_Hyper(:,6)>0 & temPlacenta_Hyper(:,5)<5);
    size=length(ind_nonzero);
    %mean of StO2
    Placenta_Hyper_Mean_NPP(l,2)=mean(temPlacenta_Hyper(ind_nonzero,6));
    %Standard error of StO2
    Placenta_Hyper_Mean_NPP(l,3)=std(temPlacenta_Hyper(ind_nonzero,6))/sqrt(size);
    %mean of HbT
    Placenta_Hyper_Mean_NPP(l,4)=mean(temPlacenta_Hyper(ind_nonzero,7));
    %Standard error of HbT
    Placenta_Hyper_Mean_NPP(l,5)=std(temPlacenta_Hyper(ind_nonzero,7))/sqrt(size);
    %mean of HbO2
    Placenta_Hyper_Mean_NPP(l,6)=mean(temPlacenta_Hyper(ind_nonzero,8));
    %Standard error of HbO2
    Placenta_Hyper_Mean_NPP(l,7)=std(temPlacenta_Hyper(ind_nonzero,8))/sqrt(size);
end
% use standard error to plot shaded area
figure;
set(gcf,'Position',[350 250 750 550]);
% x axis is time
xplot=(Placenta_Hyper_Mean_NPP(sorind_plot,1))';
xplot2=[xplot fliplr(xplot)];
% plot StO2
% use standard error to plot shaded area
curve1=(Placenta_Hyper_Mean_NPP(sorind_plot,2)+Placenta_Hyper_Mean_NPP(sorind_plot,3))';
curve2=(Placenta_Hyper_Mean_NPP(sorind_plot,2)-Placenta_Hyper_Mean_NPP(sorind_plot,3))';
inBetween = [curve1 fliplr(curve2)];
s=fill(xplot2,inBetween,[255/255 153/255 255/255], 'linestyle', 'none');
alpha(s,.4)
hold on;
plot(Placenta_Hyper_Mean_NPP(sorind_plot,1),Placenta_Hyper_Mean_NPP(sorind_plot,2),'m','LineWidth',1);
hold on;
% plot HbT
% use standard error to plot shaded area
curve1=(Placenta_Hyper_Mean_NPP(sorind_plot,4)+Placenta_Hyper_Mean_NPP(sorind_plot,5))';
curve2=(Placenta_Hyper_Mean_NPP(sorind_plot,4)-Placenta_Hyper_Mean_NPP(sorind_plot,5))';
inBetween = [curve1 fliplr(curve2)];
s=fill(xplot2,inBetween,[153/255 255/255 255/255], 'linestyle', 'none');
alpha(s,.4)
hold on;
plot(Placenta_Hyper_Mean_NPP(sorind_plot,1),Placenta_Hyper_Mean_NPP(sorind_plot,4),'b','LineWidth',1);
hold on;
% plot HbO2
% use standard error to plot shaded area
curve1=(Placenta_Hyper_Mean_NPP(sorind_plot,6)+Placenta_Hyper_Mean_NPP(sorind_plot,7))';
curve2=(Placenta_Hyper_Mean_NPP(sorind_plot,6)-Placenta_Hyper_Mean_NPP(sorind_plot,7))';
inBetween = [curve1 fliplr(curve2)];
s=fill(xplot2,inBetween,[255/255 153/255 153/255], 'linestyle', 'none');
alpha(s,.4)
hold on;
plot(Placenta_Hyper_Mean_NPP(sorind_plot,1),Placenta_Hyper_Mean_NPP(sorind_plot,6),'r','LineWidth',1);
ylim([0.925 1.175]);
yticks([0.95 1 1.05 1.10 1.15]);
xlabel('Time (min)','FontSize',12,'FontWeight','bold') 
ylabel('rStO_2,   rHb_T,   rHbO_2','FontSize',12,'FontWeight','bold') 
set(gca,'FontSize',12,'FontWeight','bold'); 
hold off;
legend('S.E. of rStO_2','rStO_2','S.E. of rHb_T','rHb_T','S.E. of rHbO_2','rHbO_2','Location','northwest');
title('Average across NPP subjects');
savefig([sdir_hyper_3rdT '\\PlacentaNormalizedHyperoxiaHemodynamics_NPP.fig']);

% plot the average of placenta hyperoxia hemodynamics across all the MVM
Placenta_Hyper_Mean_MVM=zeros(40,7);
for l=1:1:40
    Placenta_Hyper_Mean_MVM(l,1)=l*TTIME;    %prepare for plotting x axis (time)
    measind=(ThirdIndex308-1)*40+l;
    temPlacenta_Hyper=Placenta_Hyper_Relat(measind,:);
    [ind_nonzero,~]=find(temPlacenta_Hyper(:,6)>0 & temPlacenta_Hyper(:,5)<5);
    size=length(ind_nonzero);
    %mean of StO2
    Placenta_Hyper_Mean_MVM(l,2)=mean(temPlacenta_Hyper(ind_nonzero,6));
    %Standard error of StO2
    Placenta_Hyper_Mean_MVM(l,3)=std(temPlacenta_Hyper(ind_nonzero,6))/sqrt(size);
    %mean of HbT
    Placenta_Hyper_Mean_MVM(l,4)=mean(temPlacenta_Hyper(ind_nonzero,7));
    %Standard error of HbT
    Placenta_Hyper_Mean_MVM(l,5)=std(temPlacenta_Hyper(ind_nonzero,7))/sqrt(size);
    %mean of HbO2
    Placenta_Hyper_Mean_MVM(l,6)=mean(temPlacenta_Hyper(ind_nonzero,8));
    %Standard error of HbO2
    Placenta_Hyper_Mean_MVM(l,7)=std(temPlacenta_Hyper(ind_nonzero,8))/sqrt(size);
end
figure;
set(gcf,'Position',[350 250 750 550]);
% x axis is time
xplot=(Placenta_Hyper_Mean_MVM(sorind_plot,1))';
xplot2=[xplot fliplr(xplot)];
% plot StO2
% use standard error to plot shaded area
curve1=(Placenta_Hyper_Mean_MVM(sorind_plot,2)+Placenta_Hyper_Mean_MVM(sorind_plot,3))';
curve2=(Placenta_Hyper_Mean_MVM(sorind_plot,2)-Placenta_Hyper_Mean_MVM(sorind_plot,3))';
inBetween = [curve1 fliplr(curve2)];
s=fill(xplot2,inBetween,[255/255 153/255 255/255], 'linestyle', 'none');
alpha(s,.4)
hold on;
plot(Placenta_Hyper_Mean_MVM(sorind_plot,1),Placenta_Hyper_Mean_MVM(sorind_plot,2),'m','LineWidth',1);
hold on;
% plot HbT
% use standard error to plot shaded area
curve1=(Placenta_Hyper_Mean_MVM(sorind_plot,4)+Placenta_Hyper_Mean_MVM(sorind_plot,5))';
curve2=(Placenta_Hyper_Mean_MVM(sorind_plot,4)-Placenta_Hyper_Mean_MVM(sorind_plot,5))';
inBetween = [curve1 fliplr(curve2)];
s=fill(xplot2,inBetween,[153/255 255/255 255/255], 'linestyle', 'none');
alpha(s,.4)
hold on;
plot(Placenta_Hyper_Mean_MVM(sorind_plot,1),Placenta_Hyper_Mean_MVM(sorind_plot,4),'b','LineWidth',1);
hold on;
% plot HbO2
% use standard error to plot shaded area
curve1=(Placenta_Hyper_Mean_MVM(sorind_plot,6)+Placenta_Hyper_Mean_MVM(sorind_plot,7))';
curve2=(Placenta_Hyper_Mean_MVM(sorind_plot,6)-Placenta_Hyper_Mean_MVM(sorind_plot,7))';
inBetween = [curve1 fliplr(curve2)];
s=fill(xplot2,inBetween,[255/255 153/255 153/255], 'linestyle', 'none');
alpha(s,.4)
hold on;
plot(Placenta_Hyper_Mean_MVM(sorind_plot,1),Placenta_Hyper_Mean_MVM(sorind_plot,6),'r','LineWidth',1);
ylim([0.925 1.175]);
yticks([0.95 1 1.05 1.10 1.15]);
xlabel('Time (min)','FontSize',12,'FontWeight','bold') 
ylabel('rStO_2,   rHb_T,   rHbO_2','FontSize',12,'FontWeight','bold') 
set(gca,'FontSize',12,'FontWeight','bold'); 
hold off;
legend('S.E. of rStO_2','rStO_2','S.E. of rHb_T','rHb_T','S.E. of rHbO_2','rHbO_2','Location','northwest');
title('Average across MVM subjects');
savefig([sdir_hyper_3rdT '\\PlacentaNormalizedHyperoxiaHemodynamics_MVM.fig']);

%mean(S.D.), median (iqr) of delta StO2/HbT/StO2 across all these Subjects in their 3rd visit 
Avg_Placenta_HyperCg_3rdT(1,1)=mean(Placenta_HyperCg(Index_3rdT,245));
Avg_Placenta_HyperCg_3rdT(1,2)=std(Placenta_HyperCg(Index_3rdT,245));
Avg_Placenta_HyperCg_3rdT(1,3)=median(Placenta_HyperCg(Index_3rdT,245));
Avg_Placenta_HyperCg_3rdT(1,4)=iqr(Placenta_HyperCg(Index_3rdT,245));
Avg_Placenta_HyperCg_3rdT(1,5:6)=quantile(Placenta_HyperCg(Index_3rdT,245),[0.25,0.75]);

Avg_Placenta_HyperCg_3rdT(2,1)=mean(Placenta_HyperCg(Index_3rdT,247));
Avg_Placenta_HyperCg_3rdT(2,2)=std(Placenta_HyperCg(Index_3rdT,247));
Avg_Placenta_HyperCg_3rdT(2,3)=median(Placenta_HyperCg(Index_3rdT,247));
Avg_Placenta_HyperCg_3rdT(2,4)=iqr(Placenta_HyperCg(Index_3rdT,247));
Avg_Placenta_HyperCg_3rdT(2,5:6)=quantile(Placenta_HyperCg(Index_3rdT,247),[0.25,0.75]);

Avg_Placenta_HyperCg_3rdT(3,1)=mean(Placenta_HyperCg(Index_3rdT,249));
Avg_Placenta_HyperCg_3rdT(3,2)=std(Placenta_HyperCg(Index_3rdT,249));
Avg_Placenta_HyperCg_3rdT(3,3)=median(Placenta_HyperCg(Index_3rdT,249));
Avg_Placenta_HyperCg_3rdT(3,4)=iqr(Placenta_HyperCg(:,249));
Avg_Placenta_HyperCg_3rdT(3,5:6)=quantile(Placenta_HyperCg(Index_3rdT,249),[0.25,0.75]);


% Plot Base mean VS Delta StO2 and HbO2 with pregnancy outcome coding
% and pathology coding
figure;
set(gcf,'Position',[250 250 1450 550]);
subplot(1,3,1);
xneg=Placenta_HyperBase(:,6);
xpos=Placenta_HyperBase(:,6);
yneg=Placenta_HyperCg(:,246);
ypos=Placenta_HyperCg(:,246);
errorbar(Placenta_HyperBase(ThirdIndex101,5),Placenta_HyperCg(ThirdIndex101,245),yneg(ThirdIndex101),ypos(ThirdIndex101),xneg(ThirdIndex101),xpos(ThirdIndex101),'o','MarkerSize',10,'color',[0.0431    0.4000    0.1373],'LineWidth',1,'MarkerFaceColor',[0.0431    0.4000    0.1373]);
hold on;
errorbar(Placenta_HyperBase(ThirdIndex106,5),Placenta_HyperCg(ThirdIndex106,245),yneg(ThirdIndex106),ypos(ThirdIndex106),xneg(ThirdIndex106),xpos(ThirdIndex106),'r*','MarkerSize',10,'LineWidth',1,'MarkerFaceColor','g');
hold on;
plot(Placenta_HyperBase(ThirdIndex301,5),Placenta_HyperCg(ThirdIndex301,245),'s','MarkerSize',16,'color',[0.0431    0.4000    0.1373],'LineWidth',1.5);
hold on;
plot(Placenta_HyperBase(ThirdIndex308,5),Placenta_HyperCg(ThirdIndex308,245),'rd','MarkerSize',16,'LineWidth',1.5);
title(['Median (\Delta StO_2) =' num2str(Avg_Placenta_HyperCg_3rdT(1,3),'%4.1f') ' (%)'],'FontSize',12,'FontWeight','bold')
xlabel('Baseline mean StO2_2 (%)','FontSize',12,'FontWeight','bold'); 
ylabel('\Delta StO_2 (%)','FontSize',12,'FontWeight','bold');
xlim([45,100]);
xticks([50 60 70 80 90 100]);
ylim([0,25]);
yticks([0 5 10 15 20 25]);
set(gca,'FontSize',12,'FontWeight','bold'); 
legend('NPO','APO','NPP','MVM');%,'FontSize',14,'FontWeight','bold');

subplot(1,3,2);
xneg=Placenta_HyperBase(:,8);
xpos=Placenta_HyperBase(:,8);
yneg=Placenta_HyperCg(:,248);
ypos=Placenta_HyperCg(:,248);
errorbar(Placenta_HyperBase(ThirdIndex101,7),Placenta_HyperCg(ThirdIndex101,247),yneg(ThirdIndex101),ypos(ThirdIndex101),xneg(ThirdIndex101),xpos(ThirdIndex101),'o','MarkerSize',10,'color',[0.0431    0.4000    0.1373],'LineWidth',1,'MarkerFaceColor',[0.0431    0.4000    0.1373]);
hold on;
errorbar(Placenta_HyperBase(ThirdIndex106,7),Placenta_HyperCg(ThirdIndex106,247),yneg(ThirdIndex106),ypos(ThirdIndex106),xneg(ThirdIndex106),xpos(ThirdIndex106),'r*','MarkerSize',10,'LineWidth',1,'MarkerFaceColor','g');
hold on;
plot(Placenta_HyperBase(ThirdIndex301,7),Placenta_HyperCg(ThirdIndex301,247),'s','MarkerSize',16,'color',[0.0431    0.4000    0.1373],'LineWidth',1.5);
hold on;
plot(Placenta_HyperBase(ThirdIndex308,7),Placenta_HyperCg(ThirdIndex308,247),'rd','MarkerSize',16,'LineWidth',1.5);
title(['Median (\Delta Hb_T) =' num2str(Avg_Placenta_HyperCg_3rdT(2,3),'%4.1f') ' (\mu Mol)'],'FontSize',12,'FontWeight','bold')
xlabel('Baseline mean Hb_T (\mu Mol)','FontSize',12,'FontWeight','bold'); 
ylabel('\Delta Hb_T (\mu Mol)','FontSize',12,'FontWeight','bold');
xlim([0,100]);
xticks([0 20 40 60 80 100]);
ylim([-6 6]);
yticks([-6 -3 0 3 6]);
set(gca,'FontSize',12,'FontWeight','bold'); 
legend('NPO','APO','NPP','MVM');%,'FontSize',14,'FontWeight','bold');

subplot(1,3,3);
xneg=Placenta_HyperBase(:,10);
xpos=Placenta_HyperBase(:,10);
yneg=Placenta_HyperCg(:,250);
ypos=Placenta_HyperCg(:,250);
errorbar(Placenta_HyperBase(ThirdIndex101,9),Placenta_HyperCg(ThirdIndex101,249),yneg(ThirdIndex101),ypos(ThirdIndex101),xneg(ThirdIndex101),xpos(ThirdIndex101),'o','MarkerSize',10,'color',[0.0431    0.4000    0.1373],'LineWidth',1,'MarkerFaceColor',[0.0431    0.4000    0.1373]);
hold on;
errorbar(Placenta_HyperBase(ThirdIndex106,9),Placenta_HyperCg(ThirdIndex106,249),yneg(ThirdIndex106),ypos(ThirdIndex106),xneg(ThirdIndex106),xpos(ThirdIndex106),'r*','MarkerSize',10,'LineWidth',1,'MarkerFaceColor','r');
hold on;
plot(Placenta_HyperBase(ThirdIndex301,9),Placenta_HyperCg(ThirdIndex301,249),'s','MarkerSize',16,'color',[0.0431    0.4000    0.1373],'LineWidth',1.5);
hold on;
plot(Placenta_HyperBase(ThirdIndex308,9),Placenta_HyperCg(ThirdIndex308,249),'rd','MarkerSize',16,'LineWidth',1.5);
title(['Median (\Delta HbO_2) =' num2str(Avg_Placenta_HyperCg_3rdT(3,3),'%4.1f') ' (\mu Mol)'],'FontSize',12,'FontWeight','bold')
xlabel('Baseline mean HbO_2 (\mu Mol)','FontSize',12,'FontWeight','bold') 
ylabel('\Delta HbO_2 (\mu Mol)','FontSize',12,'FontWeight','bold') 
xlim([0,60]);
xticks([0 20 40 60]);
ylim([-1,9]);
yticks([-1 1 3 5 7 9]);
set(gca,'FontSize',12,'FontWeight','bold'); 
legend('NPO','APO','NPP','MVM');%,'FontSize',14,'FontWeight','bold');
savefig([sdir_hyper_3rdT '\\PlacentaHyperCg_vs_HyperBase_PO_PP_3rdT.fig']);

% Plot Base mean VS Delta StO2 and HbO2 with pregnancy outcome coding
% and pathology coding
figure;
set(gcf,'Position',[257 257 1450 550]);
subplot(1,3,1);
xneg=Placenta_HyperBase(:,6);
xpos=Placenta_HyperBase(:,6);
yneg=Placenta_HyperCg(:,253);
ypos=Placenta_HyperCg(:,253);
errorbar(Placenta_HyperBase(ThirdIndex101,5),Placenta_HyperCg(ThirdIndex101,252),yneg(ThirdIndex101),ypos(ThirdIndex101),xneg(ThirdIndex101),xpos(ThirdIndex101),'o','MarkerSize',10,'color',[0.0431    0.4000    0.1373],'LineWidth',1,'MarkerFaceColor',[0.0431    0.4000    0.1373]);
hold on;
errorbar(Placenta_HyperBase(ThirdIndex106,5),Placenta_HyperCg(ThirdIndex106,252),yneg(ThirdIndex106),ypos(ThirdIndex106),xneg(ThirdIndex106),xpos(ThirdIndex106),'r*','MarkerSize',10,'LineWidth',1,'MarkerFaceColor','g');
hold on;
plot(Placenta_HyperBase(ThirdIndex301,5),Placenta_HyperCg(ThirdIndex301,252),'s','MarkerSize',16,'color',[0.0431    0.4000    0.1373],'LineWidth',1.5);
hold on;
plot(Placenta_HyperBase(ThirdIndex308,5),Placenta_HyperCg(ThirdIndex308,252),'rd','MarkerSize',16,'LineWidth',1.5);
title(['Median (\Delta StO_2) =' num2str(Avg_Placenta_HyperCg_3rdT(1,3),'%4.1f') ' (%)'],'FontSize',12,'FontWeight','bold')
xlabel('Baseline mean StO2_2 (%)','FontSize',12,'FontWeight','bold'); 
ylabel('Relative \Delta StO_2 (%)','FontSize',12,'FontWeight','bold');
xlim([45,100]);
xticks([50 60 70 80 90 100]);
% ylim([0,30]);
% yticks([0 5 10 15 20 25 30]);
set(gca,'FontSize',12,'FontWeight','bold'); 
legend('NPO','APO','NPP','MVM');%,'FontSize',14,'FontWeight','bold');
subplot(1,3,2);
xneg=Placenta_HyperBase(:,8);
xpos=Placenta_HyperBase(:,8);
yneg=Placenta_HyperCg(:,255);
ypos=Placenta_HyperCg(:,255);
errorbar(Placenta_HyperBase(ThirdIndex101,7),Placenta_HyperCg(ThirdIndex101,254),yneg(ThirdIndex101),ypos(ThirdIndex101),xneg(ThirdIndex101),xpos(ThirdIndex101),'o','MarkerSize',10,'color',[0.0431    0.4000    0.1373],'LineWidth',1,'MarkerFaceColor',[0.0431    0.4000    0.1373]);
hold on;
errorbar(Placenta_HyperBase(ThirdIndex106,7),Placenta_HyperCg(ThirdIndex106,254),yneg(ThirdIndex106),ypos(ThirdIndex106),xneg(ThirdIndex106),xpos(ThirdIndex106),'r*','MarkerSize',10,'LineWidth',1,'MarkerFaceColor','g');
hold on;
plot(Placenta_HyperBase(ThirdIndex301,7),Placenta_HyperCg(ThirdIndex301,254),'s','MarkerSize',16,'color',[0.0431    0.4000    0.1373],'LineWidth',1.5);
hold on;
plot(Placenta_HyperBase(ThirdIndex308,7),Placenta_HyperCg(ThirdIndex308,254),'rd','MarkerSize',16,'LineWidth',1.5);
title(['Median (\Delta Hb_T) =' num2str(Avg_Placenta_HyperCg_3rdT(2,3),'%4.1f') ' (\mu Mol)'],'FontSize',12,'FontWeight','bold')
xlabel('Baseline mean Hb_T (\mu Mol)','FontSize',12,'FontWeight','bold'); 
ylabel('Relative \Delta Hb_T (%)','FontSize',12,'FontWeight','bold');
xlim([0,100]);
xticks([0 20 40 60 80 100]);
% ylim([-6 6]);
% yticks([-6 -3 0 3 6]);
set(gca,'FontSize',12,'FontWeight','bold'); 
legend('NPO','APO','NPP','MVM');%,'FontSize',14,'FontWeight','bold');

subplot(1,3,3);
xneg=Placenta_HyperBase(:,10);
xpos=Placenta_HyperBase(:,10);
yneg=Placenta_HyperCg(:,257);
ypos=Placenta_HyperCg(:,257);
errorbar(Placenta_HyperBase(ThirdIndex101,9),Placenta_HyperCg(ThirdIndex101,256),yneg(ThirdIndex101),ypos(ThirdIndex101),xneg(ThirdIndex101),xpos(ThirdIndex101),'o','MarkerSize',10,'color',[0.0431    0.4000    0.1373],'LineWidth',1,'MarkerFaceColor',[0.0431    0.4000    0.1373]);
hold on;
errorbar(Placenta_HyperBase(ThirdIndex106,9),Placenta_HyperCg(ThirdIndex106,256),yneg(ThirdIndex106),ypos(ThirdIndex106),xneg(ThirdIndex106),xpos(ThirdIndex106),'r*','MarkerSize',10,'LineWidth',1,'MarkerFaceColor','r');
hold on;
plot(Placenta_HyperBase(ThirdIndex301,9),Placenta_HyperCg(ThirdIndex301,256),'s','MarkerSize',16,'color',[0.0431    0.4000    0.1373],'LineWidth',1.5);
hold on;
plot(Placenta_HyperBase(ThirdIndex308,9),Placenta_HyperCg(ThirdIndex308,256),'rd','MarkerSize',16,'LineWidth',1.5);
title(['Median (\Delta HbO_2) =' num2str(Avg_Placenta_HyperCg_3rdT(3,3),'%4.1f') ' (\mu Mol)'],'FontSize',12,'FontWeight','bold')
xlabel('Baseline mean HbO_2 (\mu Mol)','FontSize',12,'FontWeight','bold') 
ylabel('Relative \Delta HbO_2 (%)','FontSize',12,'FontWeight','bold') 
xlim([0,60]);
xticks([0 20 40 60]);
% ylim([-1,9]);
% yticks([-1 1 3 5 7 9]);
set(gca,'FontSize',12,'FontWeight','bold'); 
legend('NPO','APO','NPP','MVM');%,'FontSize',14,'FontWeight','bold');
savefig([sdir_hyper_3rdT '\\PlacentaRelativeHyperCg_vs_HyperBase_PO_PP_3rdT.fig']);

save([sdir '\\FinalResult.mat']);
