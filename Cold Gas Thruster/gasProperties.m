function [gamma, R] = gasProperties(gasName)

switch gasName
    case "Nitrogen"
        gamma = 1.400;
        R = 55.17;

    case "Air"
        gamma = 1.400;
        R = 53.35;

    case "Helium"
        gamma = 1.667;
        R = 386.0;

    case "Argon"
        gamma = 1.667;
        R = 38.68;

    case "CO2"
        gamma = 1.289;
        R = 35.11;

    otherwise
        error("Gas not recognized.");
end

end