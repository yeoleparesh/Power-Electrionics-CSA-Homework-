clear all;
clc;
Load_Resistance = [10 2.5 1.4 1];
Frequency = [250000:5000:350000];
for i = 1 : length(Load_Resistance)
    for j = 1 : length(Frequency) 
        f = Frequency(j);
        R_load = Load_Resistance(i);
        simOut = sim('homework2','SignalLogging','on','SignalLoggingName','logsout');
        Output_Voltage = simOut.ScopeData(:,2);
        avg_opv(i,j) = mean(Output_Voltage(end-10000:end));
    end
end
figure;
for i = 1 : length(Load_Resistance)
    plot(Frequency,avg_opv);
end
grid on;