% Purpose: MATLAB SCRIPT for Grain Size Analysis Graph
% Author: Ryken Santillan

%--------------------------------START------------------------------------
% Lab Data
diam_mm = [63 37.5 26.5 22.4 19 16 13.2 9.5 6.7 4.75 2.36 ...
           1.18 0.6 0.3 0.15 0.075];
pFiner = [100 100 94.9 91.7 87.7 83.6 78.5 68.4 ...
          57.2 49.6 43.2 33.8 27.6 17.2 8.1 6];

% Creating and Displaying Line of Interpolation
lineX = linspace(diam_mm(end), diam_mm(1), 10000); 
lineY = interp1(diam_mm, pFiner, lineX);
semilogx(lineX, lineY, 'r--'); hold on

% Displaying Original Lab Values
scatter(diam_mm, pFiner, 'filled', 'b'); hold on

% Finding and Displaying points of Interpolation 
interpDiam = [10, 30, 60];
interp_pFiner = interp1(pFiner(2:end), diam_mm(2:end), interpDiam);
scatter(interp_pFiner, interpDiam, 'filled', 'diamond', 'g');

% Graph Labelling
xlabel('Diameter (mm)');
xs_label = get(gca, 'xtick');
set(gca, 'xticklabel', xs_label);
ylabel('Percent Finer (%)');
title("Sieving Analysis: Sample WS24");
legend('Line of Interpolation', 'Lab Data', 'Interpolated Diameters', ...
      'location', 'best');
grid on
hold off
%---------------------------------END-------------------------------------