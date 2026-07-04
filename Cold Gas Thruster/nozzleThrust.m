function [momentumThrust, pressureThrust, thrust] = nozzleThrust(mdot, Ve, Pe, Pa, Ae)

gc = 32.174;   % lbm·ft/(lbf·s²)

% Momentum thrust
momentumThrust = (mdot * Ve) / gc;

% Pressure thrust
pressureThrust = (Pe - Pa) * Ae;

% Total thrust
thrust = momentumThrust + pressureThrust;

end