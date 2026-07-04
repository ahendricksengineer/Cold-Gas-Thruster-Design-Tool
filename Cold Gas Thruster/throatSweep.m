function [dt_sweep_in, thrust_sweep, mdot_sweep] = throatSweep(P0, Pa, T0_R, de_in, gamma, R)

% Keep throat smaller than exit diameter
dt_min = 0.050;
dt_max = 0.95 * de_in;

dt_sweep_in = linspace(dt_min, dt_max, 100);

thrust_sweep = zeros(size(dt_sweep_in));
mdot_sweep = zeros(size(dt_sweep_in));

for i = 1:length(dt_sweep_in)

    dt_i = dt_sweep_in(i);

    [At_i, Ae_i, areaRatio_i] = nozzleGeometry(dt_i, de_in);

    [isChoked_i, ~, ~] = checkChoking(P0, Pa, gamma);

    mdot_i = massFlowRate(P0, Pa, T0_R, At_i, gamma, R, isChoked_i);

    Me_i = exitMachNumber(areaRatio_i, gamma, isChoked_i);

    [~, Pe_i, ~, ~, Ve_i] = exitConditions(P0, T0_R, Me_i, gamma, R);

    [~, ~, thrust_i] = nozzleThrust(mdot_i, Ve_i, Pe_i, Pa, Ae_i);

    thrust_sweep(i) = thrust_i;
    mdot_sweep(i) = mdot_i;
end

figure('Name','Throat Diameter Sweep',...
       'Position',[100 100 1000 600],...
       'Color','w');

yyaxis left

plot(dt_sweep_in, thrust_sweep,...
    'LineWidth',2.5);

ylabel('Thrust [lbf]');
ylim([0 max(thrust_sweep)*1.1])

yyaxis right

plot(dt_sweep_in, mdot_sweep,...
    'LineWidth',2.5);

ylabel('Mass Flow Rate [lbm/s]');
ylim([0 max(mdot_sweep)*1.1])

xlabel('Throat Diameter [in]');

title('Cold Gas Thruster Performance vs Throat Diameter');

grid on;
box on;

set(gca,...
    'FontSize',14,...
    'LineWidth',1.5);

legend('Thrust','Mass Flow Rate','Location','northwest');

end