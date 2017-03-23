clear;
close all;
clc;

X = [0.1:0.01:5]';
lengthX = length(X);

Y = 2*X + 5;

noise = (rand(lengthX,1) * 2 - 1) * 0.5;
Y = Y + noise;


randomIndexes = randperm(length(X));

x_trainning = X(randomIndexes(1: ceil(0.8 * lengthX)));
x_test = X(randomIndexes(ceil(0.8 * lengthX) + 1 : lengthX));

lenghtTrainning = length(x_trainning);
lengthTest = length(x_test);

x_trainning = [repmat(-1, lenghtTrainning, 1) x_trainning];
Y_trainning = Y(randomIndexes( 1: ceil(0.8 * lengthX)))';

% Algoritmo do OLAM
inverseOfInputs = inv(x_trainning' * x_trainning);
desiredOutputsForTest = Y(randomIndexes(ceil(0.8 * lengthX) + 1: lengthX))';
weights = inverseOfInputs * x_trainning' * Y_trainning.';

% Teste

x_test = [repmat(-1, lengthTest, 1) x_test];
outputsFromTest = x_test * weights;

error = Y(randomIndexes(randomIndexes(ceil(0.8 * lengthX) + 1 : lengthX))) - outputsFromTest;

sum = 0;

plot(x_test(:, 2),desiredOutputsForTest, 'ro'); hold on;

plot(x_test(:, 2), outputsFromTest, 'bo');



