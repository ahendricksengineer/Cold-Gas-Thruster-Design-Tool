clear; clc; close all;

%% Inputs
%% Gas Selection

gasOptions = ["Nitrogen", "Air", "Helium", "Argon", "CO2"];

fprintf("\nAvailable Gases:\n");
for i = 1:length(gasOptions)
    fprintf("%d) %s\n", i, gasOptions(i));
end

gasChoice = input("\nSelect gas number: ");

if gasChoice < 1 || gasChoice > length(gasOptions)
    error("Invalid gas selection.");
end

gasName = gasOptions(gasChoice);
P0_psi = 300;
Pa_psi = 14.7;
T0_R = 530;
dt_in = 0.125;
de_in = 0.250;
P0_min_psi = 50;
P0_max_psi = 1000;
%% Constants and Geometry
[gamma, R] = gasProperties(gasName);
[At, Ae, areaRatio] = nozzleGeometry(dt_in, de_in);

%% Unit Conversion
P0 = P0_psi * 144;
Pa = Pa_psi * 144;

%% Calculations
[isChoked, criticalRatio, actualRatio] = checkChoking(P0, Pa, gamma);
mdot = massFlowRate(P0, Pa, T0_R, At, gamma, R, isChoked);
Me = exitMachNumber(areaRatio, gamma, isChoked);
[Te, Pe, Pe_psi, ae, Ve] = exitConditions(P0, T0_R, Me, gamma, R);
expansionState = classifyExpansion(Pe, Pa);
[momentumThrust, pressureThrust, thrust] = nozzleThrust(mdot, Ve, Pe, Pa, Ae);

%% Sweeps
[P0_sweep_psi, thrust_sweep, mdot_sweep] = pressureSweep(Pa, T0_R, At, Ae, areaRatio, gamma, R, P0_min_psi, P0_max_psi);
[dt_sweep_in, thrust_dt_sweep, mdot_dt_sweep] = throatSweep(P0, Pa, T0_R, de_in, gamma, R);
%% Display Results

fprintf('\n');
fprintf('-----------------------------------------\n');
fprintf(' Cold Gas Thruster Performance\n');
fprintf('-----------------------------------------\n');

fprintf('Gas:                 %s\n', gasName);
fprintf('Chamber Pressure:    %.2f psia\n', P0_psi);
fprintf('Ambient Pressure:    %.2f psia\n', Pa_psi);
fprintf('Temperature:         %.1f R\n\n', T0_R);

fprintf('Throat Diameter:     %.3f in\n', dt_in);
fprintf('Exit Diameter:       %.3f in\n', de_in);
fprintf('Area Ratio:          %.3f\n\n', areaRatio);

fprintf('Flow Choked:         %s\n', string(isChoked));
fprintf('Exit Mach Number:    %.3f\n', Me);
fprintf('Expansion:           %s\n\n', expansionState);

fprintf('Mass Flow Rate:      %.4f lbm/s\n', mdot);
fprintf('Exit Pressure:       %.2f psia\n', Pe_psi);
fprintf('Exit Velocity:       %.1f ft/s\n\n', Ve);

fprintf('Momentum Thrust:     %.3f lbf\n', momentumThrust);
fprintf('Pressure Thrust:     %.3f lbf\n', pressureThrust);
fprintf('Total Thrust:        %.3f lbf\n', thrust);

fprintf('-----------------------------------------\n');

plotNozzleDiagram(dt_in, de_in, Me, expansionState);