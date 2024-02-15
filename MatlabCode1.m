%% Section 1: Amplitude, Phase, Power and PE When I Channel is Off
clc
close all

% Amplitude simulation
p1 = plot(Qcode(2:256), Vout_h1Mag(2:256));
title('Output Voltage Amplitude as a Function of on Q Cells (I array off)', 'FontSize', 12);
xlabel('Numebr of on Q cells', 'FontSize', 12);
ylabel('Output voltage[V]', 'FontSize', 12);
grid on
grid minor
p1.LineWidth = 3;

% Phase simulation
figure;
p2 = plot(Qcode(2:256), Vout_h1Phase(2:256));
title('Output Voltage Phase as a Function of on Q Cells (I array off)', 'FontSize', 12);
xlabel('Numebr of on Q cells', 'FontSize', 12);
ylabel('Output phase[deg]', 'FontSize', 12);
grid on
grid minor
p2.LineWidth = 3;

% Power simulation
figure;
p3 = plot(Qcode(2:256), Pout_h1(2:256));
title('Output Power as a Function of on Q Cells (I array off)', 'FontSize', 12);
xlabel('Numebr of on Q cells', 'FontSize', 12);
ylabel('Output Power[dBm]', 'FontSize', 12);
grid on
grid minor
p3.LineWidth = 3;

% Power Efficiency simulation
figure;
p3 = plot(Qcode(2:256), PE(2:256));
title('PE as a Function of on Q Cells (I array off)', 'FontSize', 12);
xlabel('Numebr of on Q cells', 'FontSize', 12);
ylabel('PE[%]', 'FontSize', 12);
grid on
grid minor
p3.LineWidth = 3;

%% Section 2: Amplitude, Phase, Power and PE When I Channel is on
clc
close all

% Amplitude simulation
p1 = plot(Qcode(257:512), Vout_h1Mag(257:512));
title('Output Voltage Amplitude as a Function of on Q Cells (I array on)', 'FontSize', 12);
xlabel('Numebr of on Q cells', 'FontSize', 12);
ylabel('Output voltage[V]', 'FontSize', 12);
grid on
grid minor
p1.LineWidth = 3;

% Phase simulation
figure;
p2 = plot(Qcode(257:512), Vout_h1Phase(257:512));
title('Output Voltage Phase as a Function of on Q Cells (I array on)', 'FontSize', 12);
xlabel('Numebr of on Q cells', 'FontSize', 12);
ylabel('Output phase[deg]', 'FontSize', 12);
grid on
grid minor
p2.LineWidth = 3;

% Power simulation
figure;
p3 = plot(Qcode(257:512), Pout_h1(257:512));
title('Output Power as a Function of on Q Cells (I array on)', 'FontSize', 12);
xlabel('Numebr of on Q cells', 'FontSize', 12);
ylabel('Output Power[dBm]', 'FontSize', 12);
grid on
grid minor
p3.LineWidth = 3;

% Power Efficiency simulation
figure;
p3 = plot(Qcode(257:512), PE(257:512));
title('PE as a Function of on Q Cells (I array on)', 'FontSize', 12);
xlabel('Numebr of on Q cells', 'FontSize', 12);
ylabel('PE[%]', 'FontSize', 12);
grid on
grid minor
p3.LineWidth = 3;

%% Section 3: INL and DNL Measurements
clc
close all

N = 8; %Number of binary bits
LSB = max(Vout_h1Mag(1:256)) / (2^N - 1);
DNL = diff(Vout_h1Mag(1:256)) / LSB - 1;
linearFit = (max(Vout_h1Mag(1:256)) / (2^N - 1)) * Qcode(1:256);
INL = (Vout_h1Mag(1:256) - linearFit) / LSB;

figure;
p1 = plot(Qcode(2:256), DNL);
title('DNL as a Function of on Q cells', 'FontSize', 12);
xlabel('Numebr of on Q cells', 'FontSize', 12);
ylabel('DNL[LSB]', 'FontSize', 12);
grid on
grid minor
p1.LineWidth = 2;

figure;
p2 = plot(Qcode(1:256), INL);
title('INL as a Function of on Q cells', 'FontSize', 12);
xlabel('Numebr of on Q cells', 'FontSize', 12);
ylabel('INL[LSB]', 'FontSize', 12);
grid on
grid minor
p2.LineWidth = 2;

fprintf('LSB is %f\n', LSB);
fprintf('DNL max is %f\n', max(abs(DNL)));
fprintf('The average DNL is %f\n', mean(DNL));
fprintf('INL max is %f\n', max(abs(INL)));
fprintf('The average INL is %f\n', mean(INL));

%% Section 4: IQ Constellation
clc
close all

cosDegrees = cosd(Vout_h1Phase);
sinDegrees = sind(Vout_h1Phase);

Icomponent = Vout_h1Mag .* cosDegrees;
Qcomponent = Vout_h1Mag .* sinDegrees;

scatter(Icomponent, Qcomponent, 100, 'filled');
title('IQ modulation', 'FontSize', 16);
xlabel('In Phase Amplitude [V]', 'FontSize', 16);
ylabel('Quadrature Amplitude [V]', 'FontSize', 16);
grid on
grid minor
axis equal
hold on

scatter(Icomponent(1:36), Qcomponent(1:36), 'filled', 'red') %I array is off
scatter(Icomponent([1:36:289, 2:36:290, 3:36:291, 4:36:292]), Qcomponent([1:36:289, 2:36:290, 3:36:291, 4:36:292]), 'filled', 'green') %Q array is off
scatter(Icomponent(1), Qcomponent(1), 'red')

hold off

%% Section 5: QSCPA Graphs in Frequency
clc
close all

% Output power simulation
p1 = plot(frf(391:520), Pout_h1(391:520));
hold on
p2 = plot(frf(261:390), Pout_h1(261:390));
p3 = plot(frf(131:260), Pout_h1(131:260));
title('Output Power', 'FontSize', 12);
xlabel('f[Hz]', 'FontSize', 12);
ylabel('Pout[dBm]', 'FontSize', 12);
grid on
grid minor
lgd = legend('I-on, Q-on','I-on, Q-off','I-off, Q-on');
lgd.FontSize = 12;
p1.LineWidth = 3;
p2.LineWidth = 3;
p3.LineWidth = 3;
hold off

% Power efficiency simulation
figure
p1 = plot(frf(391:520), PE(391:520));
hold on
p2 = plot(frf(261:390), PE(261:390));
p3 = plot(frf(131:260), PE(131:260));
title('Power Efficiency', 'FontSize', 12);
xlabel('f[Hz]', 'FontSize', 12);
ylabel('PE[%]', 'FontSize', 12);
grid on
grid minor
lgd = legend('I-on, Q-on','I-on, Q-off','I-off, Q-on');
lgd.FontSize = 12;
p1.LineWidth = 3;
p2.LineWidth = 3;
p3.LineWidth = 3;
hold off

%% Section 6: IQ Gain Imbalance
clc
close all

plotGainImbalancedIQ(Vout_h1Mag, Vout_h1Phase, 0.8);
plotGainImbalancedIQ(Vout_h1Mag, Vout_h1Phase, 1);
plotGainImbalancedIQ(Vout_h1Mag, Vout_h1Phase, 1.2);


%% Section 7: IQ Phase Imbalance
clc
close all

plotPhaseImbalancedIQ(Vout_h1Mag, Vout_h1Phase, 15)
plotPhaseImbalancedIQ(Vout_h1Mag, Vout_h1Phase, 0)
plotPhaseImbalancedIQ(Vout_h1Mag, Vout_h1Phase, -15)

%% Section 8: Functions

% Plots the IQ constellation given the respected Icomponent and Qcomponent
% values vector. Simulates gain imbalance by multiplying the Icomponent by Gimbalance
function plotGainImbalancedIQ(Vout_h1mag, Vout_h1phase, Gimbalance)
    phase_offset = 42.97;
    new_phase = Vout_h1phase + phase_offset;
    cosDegrees = cosd(new_phase);
    sinDegrees = sind(new_phase);
    
    Icomponent_in = Vout_h1mag .* cosDegrees;
    Qcomponent = Vout_h1mag .* sinDegrees;

    Icomponent = Icomponent_in * Gimbalance;
    figure;
    scatter(Icomponent, Qcomponent, 100, 'filled');
    title(['IQ constellation with the I gain being ', num2str(Gimbalance), ' times larger'], 'FontSize', 16);
    xlabel('In Phase Amplitude [V]', 'FontSize', 16);
    ylabel('Quadrature Amplitude [V]', 'FontSize', 16);
    grid on
    grid minor
    axis equal
    hold on
    
    scatter(Icomponent(1:36), Qcomponent(1:36), 'filled', 'red') %I array is off
    scatter(Icomponent([1:36:289, 2:36:290, 3:36:291, 4:36:292]), Qcomponent([1:36:289, 2:36:290, 3:36:291, 4:36:292]), 'filled', 'green') %Q array is off
    scatter(Icomponent(1), Qcomponent(1), 'red')
    
    hold off
end

% Plots the IQ constellation given the respected Icomponent and Qcomponent
% values vector. Simulates phase imbalance
function plotPhaseImbalancedIQ(Vout_h1mag, Vout_h1phase, phase)
    phase_offset = 42.97;
    new_phase = Vout_h1phase + phase_offset;
    cosDegrees = cosd(new_phase);
    sinDegrees = sind(new_phase);
    
    Icomponent_in = Vout_h1mag .* cosDegrees;
    Qcomponent_in = Vout_h1mag .* sinDegrees;

    Qcomponent = Qcomponent_in * cosd(phase/2) + Icomponent_in * sind(phase/2);
    Icomponent = Icomponent_in * cosd(phase/2) + Qcomponent_in * sind(phase/2);
    figure;
    scatter(Icomponent, Qcomponent, 100, 'filled');
    title(['IQ constellation with IQ phase difference of ', num2str(90-phase), char(176)], 'FontSize', 16);
    xlabel('In Phase Amplitude [V]', 'FontSize', 16);
    ylabel('Quadrature Amplitude [V]', 'FontSize', 16);
    grid on
    grid minor
    axis equal
    hold on
    
    scatter(Icomponent(1:36), Qcomponent(1:36), 'filled', 'red') %I array is off
    scatter(Icomponent([1:36:289, 2:36:290, 3:36:291, 4:36:292]), Qcomponent([1:36:289, 2:36:290, 3:36:291, 4:36:292]), 'filled', 'green') %Q array is off
    scatter(Icomponent(1), Qcomponent(1), 'red')
    
    hold off
end