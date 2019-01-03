%%homework1
lr = [1 2 3 5 7 9 12 15 20 25 30 40 50 100 200 500];
sf = [2000 6000 10000 14000 18000];
for i = 1 : length(lr)
    for j = 1 : length(sf)
        load_resistance = lr(i); %initialising load resistance
        switching_frequency = sf(j); %initialising switching frequency
        simout = sim('homework1'); %Run the simulink model
        output_oppower(i,j)=mean(simout.outputpower(end-10000 : end));
        output_avglosses(i,j) = mean(simout.Average_losses(:));
    end
end
efficiency = output_oppower./(output_oppower + output_avglosses);

[resind, freind]=find(efficiency ==  max(efficiency));
eff_operating_point = [lr(resind) sf(freind)];
