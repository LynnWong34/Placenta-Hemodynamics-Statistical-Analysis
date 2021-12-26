clear;
close all;
% This program will run some pre analysis includes:
% 1. process the reproducibility data, get the ICC for StO2/HbT/HbO2
% 2. save baseline data into a table 
% 3. save hyperoxia data into a table

PlacentaClinicalData = readtable('PlacentaClinicalData.xlsx');
PlacentaFDDOSData = readtable('PlacentaFDDOSData.xlsx');

% total number of subjects
Num_Sub = length(unique(PlacentaFDDOSData.SubjectID));
Num_Pos = 1;  % only have central position data
Num_Test = 3; % number of repeated measurements = 3
Num_Met = 3; % number of variables for ICC calculation = 3 (StO2 HbT HbO2)

%make a folder for saving data and figures
sdir = datestr(now,'yyyymmddHH');
mkdir(sdir);

%% Reproducibility
TestRetestInd = PlacentaFDDOSData.MeasureCondition < 100;

TestRetestData = PlacentaFDDOSData(TestRetestInd,:);

% ReproducyData is the matrix for all the reproducibility data
ReproducyData = nan(Num_Sub*Num_Pos,Num_Met,Num_Test);
for measID = 1:Num_Sub
    for posID = 1:Num_Pos        
        rowID = Num_Pos*(measID-1) + posID;
        for testID = 1:Num_Test            
            markVal = 3 + testID/10;
            useIndex = TestRetestData.SubjectNo == measID & TestRetestData.MeasureCondition == markVal;
            ReproducyData(rowID,:,testID) = table2array(TestRetestData(useIndex,7:9));
        end
    end
end

% find out these reproducibility data which is not 0 
% note we did not exclude any frames for reproducibility test, no matter
% the FrameSituration>=5
% (because some of these subjects don't have measurement)
pointUseInd = false(Num_Sub*Num_Pos,1);
for pointID = 1:(Num_Sub*Num_Pos)
   pointUseInd(pointID) = sum(squeeze(ReproducyData(pointID,1,:))) ~= 0;
end
UseReproducyData = ReproducyData(pointUseInd,:,:);

UseReproducyData(UseReproducyData == 0) = nan;

ICCValue = zeros(Num_Met,1);

% calculate ICC for each variable
% first variable is the FrameSituation
for metID = 1:Num_Met
    
    [icc] = varICC(squeeze(UseReproducyData(:,metID,:)));
    
    ICCValue(metID,1) = icc;
end
    
%% Hyperoxia data
HyperData = PlacentaFDDOSData(PlacentaFDDOSData.MeasureCondition > 100,:);
BaseData = HyperData(HyperData.MeasureCondition==101,:);

exlfilename=[sdir '\\PlacentaOrganizedRawData.mat'];
save(exlfilename,'sdir','PlacentaFDDOSData','PlacentaClinicalData',...
    'ICCValue','ReproducyData','BaseData','HyperData');
