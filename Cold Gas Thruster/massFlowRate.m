%% Mass Flow Rate
function mdot = massFlowRate(P0, Pa, T0_R, At, gamma, R, isChoked)

gc = 32.174; % [lbm*ft/(lbf*s^2)]

if isChoked
    mdot = At * P0 * sqrt((gamma * gc) / (R * T0_R)) * ...
        (2 / (gamma + 1))^((gamma + 1) / (2 * (gamma - 1)));
else
    pressureRatio = Pa / P0;

    mdot = At * P0 * sqrt((2 * gamma * gc) / ...
        (R * T0_R * (gamma - 1)) * ...
        (pressureRatio^(2/gamma) - pressureRatio^((gamma + 1)/gamma)));
end

end