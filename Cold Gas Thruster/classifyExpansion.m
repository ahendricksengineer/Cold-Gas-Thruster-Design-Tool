function expansionState = classifyExpansion(Pe, Pa)

pressureTolerance = 0.05; % 5% tolerance

pressureDifferenceRatio = (Pe - Pa) / Pa;

if abs(pressureDifferenceRatio) <= pressureTolerance
    expansionState = "Ideally Expanded";
elseif Pe > Pa
    expansionState = "Underexpanded";
else
    expansionState = "Overexpanded";
end

end