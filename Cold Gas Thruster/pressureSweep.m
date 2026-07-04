function [P0_sweep_psi, thrust_sweep, mdot_sweep] = pressureSweep(Pa, T0_R, At, Ae, areaRatio, gamma, R, P0_min_psi, P0_max_psi)

psi_to_psf = 144;

P0_sweep_psi = linspace(P0_min_psi, P0_max_psi, 200);

thrust_sweep = zeros(size(P0_sweep_psi));
mdot_sweep = zeros(size(P0_sweep_psi));

for i = 1:length(P0_sweep_psi)

    P0_i = P0_sweep_psi(i) * psi_to_psf;

    [isChoked_i, ~, ~] = checkChoking(P0_i, Pa, gamma);

    mdot_i = massFlowRate(P0_i, Pa, T0_R, At, gamma, R, isChoked_i);

    Me_i = exitMachNumber(areaRatio, gamma, isChoked_i);

    [~, Pe_i, ~, ~, Ve_i] = exitConditions(P0_i, T0_R, Me_i, gamma, R);

    [~, ~, thrust_i] = nozzleThrust(mdot_i, Ve_i, Pe_i, Pa, Ae);

    mdot_sweep(i) = mdot_i;
    thrust_sweep(i) = thrust_i;
end

figure;
plot(P0_sweep_psi, thrust_sweep, "LineWidth", 2);
grid on;
xlabel("Chamber Pressure [psia]");
ylabel("Thrust [lbf]");
title("Thrust vs Chamber Pressure");

figure;
plot(P0_sweep_psi, mdot_sweep, "LineWidth", 2);
grid on;
xlabel("Chamber Pressure [psia]");
ylabel("Mass Flow Rate [lbm/s]");
title("Mass Flow Rate vs Chamber Pressure");

end