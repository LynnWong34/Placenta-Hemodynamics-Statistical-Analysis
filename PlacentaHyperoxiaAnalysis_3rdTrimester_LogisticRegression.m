% This program will run binary logistic regression to study 
% the correlation between APO or MVM and different variables
% include HyperBase StO2/HbT/HbO2, Delta StO2/HbT/HbO2, and clinical
% variables

% This program will also run binary logistic regression to study the
% correlation between APO or MVM and a pair of independent variables. 


% multinomial logistic regression of the nominal responses in Y on the predictors in X
% Firstly Y is Pregnancy Outcome X is optical variables 
% or clinical variables

% Define Y as Pregnancy Outcome
Plact_OP_PO=[ones(length(ThirdIndex101),1); zeros(length(ThirdIndex106),1)];
Plact_OP_PO=categorical(Plact_OP_PO);
measind_PO=[ThirdIndex101; ThirdIndex106];

%X is HyperCg delta sto2
[Plact_LR_PO_CgStO2,Plact_LRDEV_PO_CgStO2,Plact_LRSt_PO_CgStO2]=mnrfit(Placenta_HyperCg(measind_PO,245),Plact_OP_PO);

%X is HyperCg delta hbt
[Plact_LR_PO_CgHbT,Plact_LRDEV_PO_CgHbT,Plact_LRSt_PO_CgHbT]=mnrfit(Placenta_HyperCg(measind_PO,247),Plact_OP_PO);

%X is HyperCg delta hbo2
[Plact_LR_PO_CgHbO2,Plact_LRDEV_PO_CgHbO2,Plact_LRSt_PO_CgHbO2]=mnrfit(Placenta_HyperCg(measind_PO,249),Plact_OP_PO);

%X is HyperBase sto2
[Plact_LR_PO_BsStO2,Plact_LRDEV_PO_BsStO2,Plact_LRSt_PO_BsStO2]=mnrfit(Placenta_HyperBase(measind_PO,5),Plact_OP_PO);

%X is HyperBase hbt
[Plact_LR_PO_BsHbT,Plact_LRDEV_PO_BsHbT,Plact_HyperLRSt_PO_BsHbT]=mnrfit(Placenta_HyperBase(measind_PO,7),Plact_OP_PO);

%X is HyperBase hbo2
[Plact_LR_PO_BsHbO2,Plact_LRDEV_PO_BsHbO2,Plact_LRSt_PO_BsHbO2]=mnrfit(Placenta_HyperBase(measind_PO,9),Plact_OP_PO);

%X is placenta depth
[Plact_LR_PO_Depth,Plact_LRDEV_PO_Depth,Plact_LRSt_PO_Depth]=mnrfit(Placenta_HyperBase(measind_PO,12),Plact_OP_PO);

%X is UtaPI
[LR_PO_UtaPI,LRDEV_PO_UtaPI,LRSt_PO_UtaPI]=mnrfit(Placenta_HyperBase(measind_PO,13),Plact_OP_PO);

%X is BMI
[LR_PO_BMI,LRDEV_PO_BMI,LRSt_PO_BMI]=mnrfit(Placenta_HyperBase(measind_PO,18),Plact_OP_PO);

% Secondly Y is Placenta Pathology X is optical variables 
% or clinical variables

% Define Y as Placenta Pathology
Plact_OP_PP=[ones(length(ThirdIndex301),1); zeros(length(ThirdIndex308),1)];
Plact_OP_PP=categorical(Plact_OP_PP);
measind_PP=[ThirdIndex301; ThirdIndex308];
% X is HyperCg delta sto2
[Plact_LR_PP_CgStO2,Plact_LRDEV_PP_CgStO2,Plact_LRSt_PP_CgStO2]=mnrfit(Placenta_HyperCg(measind_PP,245),Plact_OP_PP);

% X is HyperCg delta hbt
[Plact_LR_PP_CgHbT,Plact_LRDEV_PP_CgHbT,Plact_LRSt_PP_CgHbT]=mnrfit(Placenta_HyperCg(measind_PP,247),Plact_OP_PP);

% X is HyperCg delta hbo2
[Plact_LR_PP_CgHbO2,Plact_LRDEV_PP_CgHbO2,Plact_LRSt_PP_CgHbO2]=mnrfit(Placenta_HyperCg(measind_PP,249),Plact_OP_PP);

% X is HyperBase sto2
[Plact_LR_PP_BsStO2,Plact_LRDEV_PP_BsStO2,Plact_LRSt_PP_BsStO2]=mnrfit(Placenta_HyperBase(measind_PP,5),Plact_OP_PP);

% X is HyperBase hbt
[Plact_LR_PP_BsHbT,Plact_LRDEV_PP_BsHbT,Plact_LRSt_PP_BsHbT]=mnrfit(Placenta_HyperBase(measind_PP,7),Plact_OP_PP);

% X is HyperBase hbo2
[Plact_LR_PP_BsHbO2,Plact_LRDEV_PP_BsHbO2,Plact_LRSt_PP_BsHbO2]=mnrfit(Placenta_HyperBase(measind_PP,9),Plact_OP_PP);

% X is placenta depth
[Plact_LR_PP_Depth,Plact_LRDEV_PP_Depth,Plact_LRSt_PP_Depth]=mnrfit(Placenta_HyperBase(measind_PP,12),Plact_OP_PP);

% X is  UtaPI
[LR_PP_UtaPI,LRDEV_PP_UtaPI,LRSt_PP_UtaPI]=mnrfit(Placenta_HyperBase(measind_PP,13),Plact_OP_PP);

% X is BMI
[LR_PP_BMI,LRDEV_PP_BMI,LRSt_PP_BMI]=mnrfit(Placenta_HyperBase(measind_PP,18),Plact_OP_PP);


% do deltaSto2 & depth together for pregnancy outcome (NPO or APO)
[Plact_LR_PO_CgStO2Depth,Plact_LRDEV_PO_CgStO2Depth,Plact_LRSt_PO_CgStO2Depth]=mnrfit([Placenta_HyperCg(measind_PO,245) Placenta_HyperBase(measind_PO,12)],Plact_OP_PO);

% do deltaSto2 & depth together for Pregnancy Pathology (NPP or MVMV)
[Plact_LR_PP_CgStO2Depth,Plact_LRDEV_PP_CgStO2Depth,Plact_LRSt_PP_CgStO2Depth]=mnrfit([Placenta_HyperCg(measind_PP,245) Placenta_HyperBase(measind_PP,12)],Plact_OP_PP);

% do deltaHbo2 & depth together for pregnancy outcome (NPO or APO)
[Plact_LR_PO_CgHbO2Depth,Plact_LRDEV_PO_CgHbO2Depth,Plact_LRSt_PO_CgHbO2Depth]=mnrfit([Placenta_HyperCg(measind_PO,249) Placenta_HyperBase(measind_PO,12)],Plact_OP_PO);

% do deltaHbo2 & depth together for Pregnancy Pathology (NPP or MVMV)
[Plact_LR_PP_CgHbO2Depth,Plact_LRDEV_PP_CgHbO2Depth,Plact_LRSt_PP_CgHbO2Depth]=mnrfit([Placenta_HyperCg(measind_PP,249) Placenta_HyperBase(measind_PP,12)],Plact_OP_PP);

% do deltaSto2 & BMI together for pregnancy outcome (NPO or APO)
[Plact_LR_PO_CgStO2BMI,Plact_LRDEV_PO_CgStO2BMI,Plact_LRSt_PO_CgStO2BMI]=mnrfit([Placenta_HyperCg(measind_PO,245) Placenta_HyperBase(measind_PO,18)],Plact_OP_PO);

% do deltaSto2 & BMI together for Pregnancy Pathology (NPP or MVMV)
[Plact_LR_PP_CgStO2BMI,Plact_LRDEV_PP_CgStO2BMI,Plact_LRSt_PP_CgStO2BMI]=mnrfit([Placenta_HyperCg(measind_PP,245) Placenta_HyperBase(measind_PP,18)],Plact_OP_PP);

% do deltaHbo2 & BMI together for pregnancy outcome (NPO or APO)
[Plact_LR_PO_CgHbO2BMI,Plact_LRDEV_PO_CgHbO2BMI,Plact_LRSt_PO_CgHbO2BMI]=mnrfit([Placenta_HyperCg(measind_PO,249) Placenta_HyperBase(measind_PO,18)],Plact_OP_PO);

% do deltaHbo2 & BMI together for Pregnancy Pathology (NPP or MVMV)
[Plact_LR_PP_CgHbO2BMI,Plact_LRDEV_PP_CgHbO2BMI,Plact_LRSt_PP_CgHbO2BMI]=mnrfit([Placenta_HyperCg(measind_PP,249) Placenta_HyperBase(measind_PP,18)],Plact_OP_PP);

% do deltaSto2 & UtAPI together for pregnancy outcome (NPO or APO)
[Plact_LR_PO_CgStO2UtAPI,Plact_LRDEV_PO_CgStO2UtAPI,Plact_LRSt_PO_CgStO2UtAPI]=mnrfit([Placenta_HyperCg(measind_PO,245) Placenta_HyperBase(measind_PO,13)],Plact_OP_PO);

% do deltaSto2 & UtAPI together for Pregnancy Pathology (NPP or MVMV)
[Plact_LR_PP_CgStO2UtAPI,Plact_LRDEV_PP_CgStO2UtAPI,Plact_LRSt_PP_CgStO2UtAPI]=mnrfit([Placenta_HyperCg(measind_PP,245) Placenta_HyperBase(measind_PP,13)],Plact_OP_PP);

% do deltaHbo2 & UtAPI together for pregnancy outcome (NPO or APO)
[Plact_LR_PO_CgHbO2UtAPI,Plact_LRDEV_PO_CgHbO2UtAPI,Plact_LRSt_PO_CgHbO2UtAPI]=mnrfit([Placenta_HyperCg(measind_PO,249) Placenta_HyperBase(measind_PO,13)],Plact_OP_PO);

% do deltaHbo2 & UtAPI together for Pregnancy Pathology (NPP or MVMV)
[Plact_LR_PP_CgHbO2UtAPI,Plact_LRDEV_PP_CgHbO2UtAPI,Plact_LRSt_PP_CgHbO2UtAPI]=mnrfit([Placenta_HyperCg(measind_PP,249) Placenta_HyperBase(measind_PP,13)],Plact_OP_PP);

save([sdir '\FinalResult.mat']);