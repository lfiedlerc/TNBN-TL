function newDist = addNoise(originalDist,mean,std)
    noise = ((std .* randn(size(originalDist,1),size(originalDist,2))) + mean);
    newDist = originalDist + (noise .* originalDist)*0.25;
    
    if size(originalDist,1) == 1
        k = sum(newDist);
        newDist = newDist / k;
    else
        for i = 1: size(originalDist,1)
            k = sum(newDist(:,i));
            newDist(:,i) = newDist(:,i) / k;
        end
    end
        
end