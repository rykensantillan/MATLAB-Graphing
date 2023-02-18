% Purpose: MATLAB SCRIPT for Atterberg Limits Graph
% Author: Ryken Santillan

%--------------------------------START------------------------------------
% Lab Data
moisture_content = [27.4 29.7 30.1 35.7];
blow_num = [46 33 28 13];

% Creating and Displaying Interpolated Line using
% exponentiated Linear Regression  
interpLine = polyfit(moisture_content, log(blow_num), 1);
lobf_line = polyval(interpLine, moisture_content); 
semilogy(moisture_content, exp(lobf_line), "r--"); hold on

% Displaying Lab Values
scatter(moisture_content, blow_num, 'filled', 'b'); hold on

% Displaying and plotting Interpolated Values
slope = interpLine(1);
intercept = interpLine(2);
log_LL = log(25);
interp_Moisture = (log_LL-intercept)/slope;
scatter(interp_Moisture, exp(log_LL), 'filled', 'diamond', 'g');
disp(interp_Moisture);

% Graph Labelling
xlabel('Moisture Content(%)');
ylabel('Blow Number');
ys_label = get(gca, 'ytick');
set(gca, 'yticklabel', ys_label);
title("Atterberg Limits Analysis - Brown Soil Tray 20");
legend('Line of Interpolation', 'Lab Data', 'Interpolated Liquid Limit', ...
      'location', 'best');

grid on
hold off
%---------------------------------END-------------------------------------