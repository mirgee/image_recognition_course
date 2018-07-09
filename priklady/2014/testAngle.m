clc
clear all;
close all;
I = double(imread('test.png'));

test_input = - 89 : 10 : 89;
test_output = zeros(size(test_input));

ccounter = 0;

for idx_angle = test_input
    ccounter = ccounter + 1;
    fprintf('Processing: test_angle = %s ...\n', num2str(idx_angle));
    temp = imrotate(~I,idx_angle,'bicubic','crop');
% % % % % % % % % % % % % % % % % % % % % % % % % %       
% % Zde bude volana Vase funkce % % % % % % % % % %
    test_output(ccounter) = angleLines(~temp);    
% % % % % % % % % % % % % % % % % % % % % % % % % % %     
    fprintf('   >> calculated angle = %s\n', num2str(test_output(ccounter)));
    fprintf('..............................\n');
end
test_err = abs(test_output - test_input);
meanErr = mean(test_err)
figure;
hist(test_err)