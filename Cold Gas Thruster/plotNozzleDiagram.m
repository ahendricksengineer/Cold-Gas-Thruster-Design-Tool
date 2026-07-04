function plotNozzleDiagram(dt_in, de_in, Me, expansionState)
% plotNozzleDiagram
% Creates a readable 2D schematic of a converging-diverging nozzle.
% Note: visual radius is scaled for readability; labels show real diameters.

%% Geometry / visual scaling
L_converging = 1.5;   % [in]
L_diverging  = 3.0;   % [in]

x_throat = L_converging;
x_exit = L_converging + L_diverging;

x_key = [0, x_throat, x_exit];

visualScale = 3.0;    % makes nozzle taller for readability

r_inlet  = (de_in / 2) * visualScale;
r_throat = (dt_in / 2) * visualScale;
r_exit   = (de_in / 2) * visualScale;

r_key = [r_inlet, r_throat, r_exit];

x = linspace(0, x_exit, 250);
r_upper = interp1(x_key, r_key, x, "pchip");
r_lower = -r_upper;

%% Figure
figure("Name", "Cold Gas Thruster Nozzle", ...
       "Position", [100 100 1300 800], ...
       "Color", "w");

hold on;
grid on;
box on;

%% Nozzle body
fill([x fliplr(x)], [r_upper fliplr(r_lower)], ...
     [0.85 0.85 0.85], ...
     "FaceAlpha", 0.55, ...
     "EdgeColor", "none");

plot(x, r_upper, "k", "LineWidth", 3);
plot(x, r_lower, "k", "LineWidth", 3);
plot([x_throat x_throat], [-r_throat r_throat], "k--", "LineWidth", 1.5);

%% Flow arrows
quiver(-0.65, 0, 0.45, 0, 0, "LineWidth", 2.8, "MaxHeadSize", 2.2);
quiver(0.60, 0, 0.50, 0, 0, "LineWidth", 2.8, "MaxHeadSize", 2.2);
quiver(2.25, 0, 0.60, 0, 0, "LineWidth", 2.8, "MaxHeadSize", 2.2);
quiver(4.65, 0, 0.55, 0, 0, "LineWidth", 2.8, "MaxHeadSize", 2.2);

%% Labels
text(0, r_inlet + 0.20, "Inlet", ...
    "HorizontalAlignment", "center", "FontSize", 15, "FontWeight", "bold");

text(x_throat, r_inlet + 0.20, "Throat", ...
    "HorizontalAlignment", "center", "FontSize", 15, "FontWeight", "bold");

text(x_exit, r_exit + 0.20, "Exit", ...
    "HorizontalAlignment", "center", "FontSize", 15, "FontWeight", "bold");

text(x_throat, -r_inlet - 0.22, sprintf("d_t = %.3f in", dt_in), ...
    "HorizontalAlignment", "center", "FontSize", 14, "FontWeight", "bold");

text(x_exit, -r_exit - 0.22, sprintf("d_e = %.3f in", de_in), ...
    "HorizontalAlignment", "center", "FontSize", 14, "FontWeight", "bold");

text(2.4, r_inlet + 0.42, sprintf("Exit Mach = %.2f", Me), ...
    "HorizontalAlignment", "center", "FontSize", 15, "FontWeight", "bold");

text(2.4, -r_inlet - 0.45, sprintf("Expansion: %s", expansionState), ...
    "HorizontalAlignment", "center", "FontSize", 15, "FontWeight", "bold");

%% Formatting
xlabel("Axial Position [in]", "FontSize", 15, "FontWeight", "bold");
ylabel("Scaled Radius [visual]", "FontSize", 15, "FontWeight", "bold");

title("Converging-Diverging Cold Gas Nozzle Flow Diagram", ...
      "FontSize", 18, "FontWeight", "bold");

set(gca, "FontSize", 14, "LineWidth", 1.5);

xlim([-0.9, x_exit + 0.9]);
ylim([-r_inlet - 0.75, r_inlet + 0.75]);

pbaspect([2.4 1 1]);

hold off;

end