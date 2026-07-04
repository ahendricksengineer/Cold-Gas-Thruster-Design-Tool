function [At, Ae, areaRatio] = nozzleGeometry(dt_in, de_in)

in_to_ft = 1/12;

dt = dt_in * in_to_ft;
de = de_in * in_to_ft;

At = pi * dt^2 / 4;
Ae = pi * de^2 / 4;
areaRatio = Ae / At;

end