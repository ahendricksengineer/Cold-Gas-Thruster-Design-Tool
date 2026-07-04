function [isChoked, criticalRatio, actualRatio] = checkChoking(P0, Pa, gamma)

criticalRatio = (2/(gamma + 1))^(gamma/(gamma - 1));
actualRatio = Pa / P0;

isChoked = actualRatio <= criticalRatio;

end