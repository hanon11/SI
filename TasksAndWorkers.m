close all, clear all, clc;
N = 5;
% initial configurations
initial = randperm(N);
% if A is the matrix of workers/tasks
A = [12,43,15,7,13;
    9,10,6,4,25;
    5,13,29,2,18;
    4,11,17,9,7;
    10,20,4,8,21];
 
cost = sum(diag(A(:,initial)));