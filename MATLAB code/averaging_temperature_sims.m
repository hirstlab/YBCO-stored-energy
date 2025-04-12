
%round4data = readtable('Users\Lauryn Kortman\Desktop\YBCO_data\round4data.xlsx');

file = "C:\Users\Lauryn Kortman\Desktop\YBCO_data\round4data.xlsx"; % Replace with your filename
sheets = sheetnames(file); % Get all sheet names
round4data = cell(length(sheets),1); % Preallocate cell array

for i = 1:length(sheets)
    round4data{i} = readtable(file, 'Sheet', sheets{i});
end


file2 = "C:\Users\Lauryn Kortman\Desktop\YBCO_data\round5data.xlsx"; % Replace with your filename
sheets = sheetnames(file2); % Get all sheet names
round5data = cell(length(sheets),1); % Preallocate cell array

for i = 1:length(sheets)
    round5data{i} = readtable(file2, 'Sheet', sheets{i});
end


file3 = "C:\Users\Lauryn Kortman\Desktop\YBCO_data\round6data.xlsx"; % Replace with your filename
sheets = sheetnames(file3); % Get all sheet names
round6data = cell(length(sheets),1); % Preallocate cell array

for i = 1:length(sheets)
    round6data{i} = readtable(file3, 'Sheet', sheets{i});
end

round4nodpa =  readmatrix("C:\Users\Lauryn Kortman\Desktop\YBCO_data\round4nodpa.xlsx");
round5nodpa =  readmatrix("C:\Users\Lauryn Kortman\Desktop\YBCO_data\round5nodpa.xlsx");
round6nodpa =  readmatrix("C:\Users\Lauryn Kortman\Desktop\YBCO_data\round6nodpa.xlsx");

hold off

equiltime = 0.1.*(1:350); 


avg_1K = mean([round4data{1}.Var4 - round5nodpa(:,1), round5data{1}.Var4 - round5nodpa(:,1), round6data{1}.Var4 - round6nodpa(:,1)], 2);
avg_20K = mean([round4data{3}.Var4 - round5nodpa(:,3), round5data{3}.Var4 - round5nodpa(:,3), round6data{3}.Var4 - round6nodpa(:,3)], 2);
avg_40K = mean([round4data{4}.Var4 - round5nodpa(:,4), round5data{4}.Var4 - round5nodpa(:,4), round6data{4}.Var4 - round6nodpa(:,4)], 2);
avg_92K = mean([round4data{5}.Var4 - round5nodpa(:,5), round5data{5}.Var4 - round5nodpa(:,5), round6data{5}.Var4 - round6nodpa(:,5)], 2);
avg_300K = mean([round4data{9}.Var4 - round5nodpa(:,9), round5data{9}.Var4 - round5nodpa(:,9), round6data{9}.Var4 - round6nodpa(:,9)], 2);

std_1K = std([round4data{1}.Var4 - round5nodpa(:,1), round5data{1}.Var4 - round5nodpa(:,1), round6data{1}.Var4 - round6nodpa(:,1)], 0, 2);
std_20K = std([round4data{3}.Var4 - round5nodpa(:,3), round5data{3}.Var4 - round5nodpa(:,3), round6data{3}.Var4 - round6nodpa(:,3)], 0, 2);
std_40K = std([round4data{4}.Var4 - round5nodpa(:,4), round5data{4}.Var4 - round5nodpa(:,4), round6data{4}.Var4 - round6nodpa(:,4)], 0, 2);
std_92K = std([round4data{5}.Var4 - round5nodpa(:,5), round5data{5}.Var4 - round5nodpa(:,5), round6data{5}.Var4 - round6nodpa(:,5)], 0, 2);
std_300K = std([round4data{9}.Var4 - round5nodpa(:,9), round5data{9}.Var4 - round5nodpa(:,9), round6data{9}.Var4 - round6nodpa(:,9)], 0, 2);

%std_1K = std([round4data{1}.Var4, round5data{1}.Var4, round6data{1}.Var4], 0, 2);
%std_20K = std([round4data{3}.Var4, round5data{3}.Var4, round6data{3}.Var4], 0, 2);
%std_40K = std([round4data{4}.Var4, round5data{4}.Var4, round6data{4}.Var4], 0, 2);
%std_92K = std([round4data{5}.Var4, round5data{5}.Var4, round6data{5}.Var4], 0, 2);
%std_300K = std([round4data{9}.Var4, round5data{9}.Var4, round6data{9}.Var4], 0, 2);


% Compute converted values for means and standard deviations
conversion_factor_1K = (1/(232.37*236.24*236.7))*(10^24)*(1.602*10^-19);
conversion_factor_20K = (1/(232.4*236.24*236.7))*(10^24)*(1.602*10^-19);
conversion_factor_40K = (1/(232.48*236.35*236.8))*(10^24)*(1.602*10^-19);
conversion_factor_92K = (1/(232.7*236.5*237.06))*(10^24)*(1.602*10^-19);
conversion_factor_300K = (1/(233.5*237.3*237.87))*(10^24)*(1.602*10^-19);


converted_1K = (avg_1K ) .* conversion_factor_1K;
converted_20K = (avg_20K ) .* conversion_factor_20K;
converted_40K = (avg_40K ) .* conversion_factor_40K;
converted_92K = (avg_92K ) .* conversion_factor_92K;
converted_300K = (avg_300K ) .* conversion_factor_300K;

std_1K_converted = (std_1K .* conversion_factor_1K) ./ converted_1K([21]);
std_20K_converted = (std_20K .* conversion_factor_20K) ./ converted_20K([21]);
std_40K_converted = (std_40K .* conversion_factor_40K) ./ converted_40K([21]);
std_92K_converted = (std_92K .* conversion_factor_92K) ./ converted_92K([21]);
std_300K_converted = (std_300K .* conversion_factor_300K) ./ converted_300K([21]);


hold on

% Conversion factor
conversion_factor_r3 = (6.022*1E23)*(1.60218E-19)*6.3/(936000*666.19);

% Run 5 Data
mdpa0r5 = round5nodpa(350,:);
mdpa05r5 = [round5data{1}.Var1, round5data{2}.Var1, round5data{3}.Var1, round5data{4}.Var1, ...
            round5data{5}.Var1, round5data{6}.Var1, round5data{7}.Var1, round5data{8}.Var1, round5data{9}.Var1];
mdpa1r5 = [round5data{1}.Var2, round5data{2}.Var2, round5data{3}.Var2, round5data{4}.Var2, ...
           round5data{5}.Var2, round5data{6}.Var2, round5data{7}.Var2, round5data{8}.Var2, round5data{9}.Var2];
mdpa2r5 = [round5data{1}.Var3, round5data{2}.Var3, round5data{3}.Var3, round5data{4}.Var3, ...
           round5data{5}.Var3, round5data{6}.Var3, round5data{7}.Var3, round5data{8}.Var3, round5data{9}.Var3];
mdpa4r5 = [round5data{1}.Var4, round5data{2}.Var4, round5data{3}.Var4, round5data{4}.Var4, ...
           round5data{5}.Var4, round5data{6}.Var4, round5data{7}.Var4, round5data{8}.Var4, round5data{9}.Var4];
mdpa8r5 = [round5data{1}.Var5, round5data{2}.Var5, round5data{3}.Var5, round5data{4}.Var5, ...
           round5data{5}.Var5, round5data{6}.Var5, round5data{7}.Var5, round5data{8}.Var5, round5data{9}.Var5];

% Run 6 Data
mdpa0r6 = round6nodpa(350,:);
mdpa05r6 = [round6data{1}.Var1, round6data{2}.Var1, round6data{3}.Var1, round6data{4}.Var1, ...
            round6data{5}.Var1, round6data{6}.Var1, round6data{7}.Var1, round6data{8}.Var1, round6data{9}.Var1];
mdpa1r6 = [round6data{1}.Var2, round6data{2}.Var2, round6data{3}.Var2, round6data{4}.Var2, ...
           round6data{5}.Var2, round6data{6}.Var2, round6data{7}.Var2, round6data{8}.Var2, round6data{9}.Var2];
mdpa2r6 = [round6data{1}.Var3, round6data{2}.Var3, round6data{3}.Var3, round6data{4}.Var3, ...
           round6data{5}.Var3, round6data{6}.Var3, round6data{7}.Var3, round6data{8}.Var3, round6data{9}.Var3];
mdpa4r6 = [round6data{1}.Var4, round6data{2}.Var4, round6data{3}.Var4, round6data{4}.Var4, ...
           round6data{5}.Var4, round6data{6}.Var4, round6data{7}.Var4, round6data{8}.Var4, round6data{9}.Var4];
mdpa8r6 = [round6data{1}.Var5, round6data{2}.Var5, round6data{3}.Var5, round6data{4}.Var5, ...
           round6data{5}.Var5, round6data{6}.Var5, round6data{7}.Var5, round6data{8}.Var5, round6data{9}.Var5];

% Run 4 Data
mdpa0r4 = round5nodpa(350,:);
mdpa05r4 = [round4data{1}.Var1, round4data{2}.Var1, round4data{3}.Var1, round4data{4}.Var1, ...
            round4data{5}.Var1, round4data{6}.Var1, round4data{7}.Var1, round4data{8}.Var1, round4data{9}.Var1];
mdpa1r4 = [round4data{1}.Var2, round4data{2}.Var2, round4data{3}.Var2, round4data{4}.Var2, ...
           round4data{5}.Var2, round4data{6}.Var2, round4data{7}.Var2, round4data{8}.Var2, round4data{9}.Var2];
mdpa2r4 = [round4data{1}.Var3, round4data{2}.Var3, round4data{3}.Var3, round4data{4}.Var3, ...
           round4data{5}.Var3, round4data{6}.Var3, round4data{7}.Var3, round4data{8}.Var3, round4data{9}.Var3];
mdpa4r4 = [round4data{1}.Var4, round4data{2}.Var4, round4data{3}.Var4, round4data{4}.Var4, ...
           round4data{5}.Var4, round4data{6}.Var4, round4data{7}.Var4, round4data{8}.Var4, round4data{9}.Var4];
mdpa8r4 = [round4data{1}.Var5, round4data{2}.Var5, round4data{3}.Var5, round4data{4}.Var5, ...
           round4data{5}.Var5, round4data{6}.Var5, round4data{7}.Var5, round4data{8}.Var5, round4data{9}.Var5];

% Conversion factor
conversion_factor = (1/(229.254*233.058*233.534))*(10^24)*(1.602*10^-19);
conversion_array = [conversion_factor_1K, conversion_factor_20K, conversion_factor_40K, conversion_factor_92K, conversion_factor_300K];
conversion_murphy_0K = (1/(229.254*233.058*233.534))*(10^24)*(1.602*10^-19);

% Compute Averages
avg_mdpa0 = mean([mdpa0r5; mdpa0r6; mdpa0r4], 1);
avg_mdpa05 = mean([mdpa05r5; mdpa05r6; mdpa05r4], 1);
avg_mdpa1 = mean([mdpa1r5; mdpa1r6; mdpa1r4], 1);
avg_mdpa2 = mean([mdpa2r5; mdpa2r6; mdpa2r4], 1);
avg_mdpa4 = mean([mdpa4r5; mdpa4r6; mdpa4r4], 1);
avg_mdpa8 = mean([mdpa8r5; mdpa8r6; mdpa8r4], 1);

% Compute Standard Deviations
std_mdpa0 = std([mdpa0r5; mdpa0r6; mdpa0r4], 0, 1);
std_mdpa05 = std([mdpa05r5; mdpa05r6; mdpa05r4], 0, 1);
std_mdpa1 = std([mdpa1r5; mdpa1r6; mdpa1r4], 0, 1);
std_mdpa2 = std([mdpa2r5; mdpa2r6; mdpa2r4], 0, 1);
std_mdpa4 = std([mdpa4r5; mdpa4r6; mdpa4r4], 0, 1);
std_mdpa8 = std([mdpa8r5; mdpa8r6; mdpa8r4], 0, 1);
