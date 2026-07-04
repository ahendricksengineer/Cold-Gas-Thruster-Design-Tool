function Me = exitMachNumber(areaRatio, gamma, isChoked)
% exitMachNumber
% Solves for nozzle exit Mach number using the isentropic area-Mach relation.
%
% Inputs:
%   areaRatio - exit area / throat area [-]
%   gamma     - specific heat ratio [-]
%   isChoked  - true if flow is choked
%
% Output:
%   Me        - exit Mach number [-]

if isChoked
    areaMachFunction = @(M) ...
        (1/M) * ((2/(gamma + 1)) * ...
        (1 + ((gamma - 1)/2) * M^2))^((gamma + 1)/(2*(gamma - 1))) ...
        - areaRatio;

    Me = fzero(areaMachFunction, [1.01, 10]);
else
    Me = NaN;
end

end