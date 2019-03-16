function noisy = noisyDistribution(original,mean,std)
    original
    noise = ((std .* randn(size(original,1),size(original,2))) + mean);
    noisy = original + abs(noise).* original;
    if size(noisy,1) == 1
        k = sum(noisy);
        noisy = noisy / k;
    else
        for i = 1: size(noisy,2)
            k = sum(noisy(:,i));
            noisy(:,i) = noisy(:,i) / k;
        end
    end
end