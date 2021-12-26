# Placenta-Hyperoxia-Experiment
Programs to performa statistical analysis of FD-DOS data vs clinical data. 
Include: 
1) Analyze the intraclass correlation coefficient of placental StO2, HbT, and HbO2 in reproducibility test.
2) Analyze the mean and standard deviation of palcental StO2, HbT, and HbO2 in stability test.
3) Analyze the absolute values of placental StO2, HbT, and HbO2 during baseline measurements (mean of last 4 frames measurements in baseline).
4) Analyze the DeltaStO2, DeltaHbT, and DeltaHbO2 in response to maternal hyperoxia. Find out the delta changes by searching the maximum StO2 during the hyperoxia. Note, a 4-frame-window is used to smooth the data. 
5) Study the correlation between placental hemodynamics and placenta dysfunction (APO or MVM).
6) Study the correlation between other clinical variables and placenta dysfunction (APO or MVM).

Simply run the file 'PlacentaRunAnalysis.m' to proceed the full analysis
Or run each separate file refer to the order in 'PlacentaRunAnalysis.m'

NOTE!!!!
Please make sure the 'PlacentaFDDOSData.xlsx' and 'PlacentaClinicalData.xlsx' are in the same folder of the code. Or you will need to specify the folder where you save the data in the code-'PlacentaPreAnalyzeData.m'

Please email linwang3@sas.upenn.edu for questions or information.

Thank you!
