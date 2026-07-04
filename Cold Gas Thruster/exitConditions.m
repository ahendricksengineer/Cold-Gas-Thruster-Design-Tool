function [Te, Pe, Pe_psi, ae, Ve] = exitConditions(P0, T0_R, Me, gamma, R)

gc = 32.174; % [lbm*ft/(lbf*s^2)]

Te = T0_R / (1 + ((gamma - 1)/2) * Me^2);

Pe = P0 / (1 + ((gamma - 1)/2) * Me^2)^(gamma/(gamma - 1));
Pe_psi = Pe / 144;

ae = sqrt(gamma * R * Te * gc);
Ve = Me * ae;

end