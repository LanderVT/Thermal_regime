

%% Clear all

clc 
clear all


%% Load 3h-data

data_kumtor = xlsread('Kumtor-TienShan_3h_1750-2021.xls');


%% Create 1h-dataset

data_kumtor_3h = data_kumtor(:, 1:6);
data_kumtor_1h = zeros(size(data_kumtor_3h, 1)*3, 6);
data_kumtor_1h(:) = nan;

count = 1;
for i = 1:3:size(data_kumtor_1h, 1)-3
  
    % Write all observations
    data_kumtor_1h(i, :) = data_kumtor_3h(count, :);
    
    % Write year interpolations
    data_kumtor_1h(i+1, 1) = data_kumtor_3h(count, 1);
    data_kumtor_1h(i+2, 1) = data_kumtor_3h(count, 1);
    
    % Write day interpolations
    data_kumtor_1h(i+1, 2) = data_kumtor_3h(count, 2);
    data_kumtor_1h(i+2, 2) = data_kumtor_3h(count, 2);
    
    % Write hour interpolations
    data_kumtor_1h(i+1, 3) = data_kumtor_3h(count, 3) + 1;
    data_kumtor_1h(i+2, 3) = data_kumtor_3h(count, 3) + 2;
    
    % Write temp interpolations
    dif = (data_kumtor_3h(count+1, 4) - data_kumtor_3h(count, 4));
    data_kumtor_1h(i+1, 4) = data_kumtor_3h(count, 4) + dif / 3;
    data_kumtor_1h(i+2, 4) = data_kumtor_3h(count, 4) + 2 * (dif / 3);
   
    % Write prec interpolations
    data_kumtor_1h(i, 5) = data_kumtor_3h(count, 5) / 3;
    data_kumtor_1h(i+1, 5) = data_kumtor_3h(count, 5) / 3;
    data_kumtor_1h(i+2, 5) = data_kumtor_3h(count, 5) / 3;
    
    % Write tot prec interpolations
    data_kumtor_1h(i+1, 6) = data_kumtor_3h(count, 6);
    data_kumtor_1h(i+2, 6) = data_kumtor_3h(count, 6);
    
    count = count + 1;
    

end


