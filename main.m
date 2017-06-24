%% Algoritmos Evolucionários
%  Algoritmo Evolução Diferencial
clear all;close all;clc;
numPop = 1000;
probCruz = 0.9;
F = 0.1;
a = -50;b = 50;
pop = a+(b-a)*rand(numPop,2)
numGer = 30;
[pop, avaliaPop] = EDS(@avalia,pop,numGer,probCruz,F,'min')
[maxAvalia,pMaxAvalia] = max(avaliaPop);
[minAvalia,pMinAvalia] = min(avaliaPop);
fprintf('xÓtimo avaliação')
pop(pMinAvalia,:)

fprintf('Avaliação %0.2f\n',maxAvalia)
