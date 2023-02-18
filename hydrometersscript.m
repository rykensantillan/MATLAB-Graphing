% Purpose: MATLAB SCRIPT for Hydrometer Analysis Graph
% Author: Ryken Santillan

%--------------------------------START------------------------------------
% Lab Data
diam_mm = [4.75 2 0.85 0.425 0.25 0.15 0.075 0.036 0.023...
          0.018 0.013 0.0094 0.0067 0.0033 0.0014];
pFiner = [100 99.7 99.6 98.3 75.2 42.6 24 1.9376 1.9095 ...
          1.8532 1.787251 1.797 1.7289 1.7379 1.707];

% Creating and Displaying Line of Interpolation
lineX = linspace(diam_mm(end), diam_mm(1), 10000); 
lineY = interp1(diam_mm, pFiner, lineX);
semilogx(lineX, lineY, 'r--'); hold on

% Displaying Original Lab Values
scatter(diam_mm, pFiner, 'filled', 'b'); hold on

% Finding and Displaying points of Interpolation 
interpDiam = [10, 30, 60];
interp_pFiner = interp1(pFiner, diam_mm, interpDiam);
scatter(interp_pFiner, interpDiam, 'filled', 'diamond', 'g');

% Graph Labelling
xlabel('Diameter (mm)');
xs_label = get(gca, 'xtick');
set(gca, 'xticklabel', xs_label);
ylabel('Percent Finer (%)');
title("Hydrometer Analysis: Sample WH2");
legend('Line of Interpolation', 'Lab Data', 'Interpolated Diameters', ...
      'location', 'best');
grid on
hold off
%---------------------------------END-------------------------------------