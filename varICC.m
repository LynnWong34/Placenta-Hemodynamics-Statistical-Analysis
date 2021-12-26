% calculate ICC
function [r] = varICC(data)

datMean = nanmean(nanmean(data,2));
varMat = (data - datMean).^2;

varMean = nanmean(nanmean(varMat,2));

diffMat = data - datMean;

nMeas = size(data,1);

corrMat = zeros(nMeas,1);
for mN = 1:nMeas
    
    tmpRow = squeeze(diffMat(mN,:));
    nTests = sum(~isnan(tmpRow));
    
    if nTests == 2
        tmpRow(isnan(tmpRow)) = [];
        
        corrMat(mN) = tmpRow(1)*tmpRow(2);
    
    elseif nTests == 3
        corrMat(mN) = (1/3)*(tmpRow(1)*tmpRow(2) + tmpRow(1)*tmpRow(3) + tmpRow(2)*tmpRow(3));
    end
end

r = nanmean(corrMat)/varMean;
        

end