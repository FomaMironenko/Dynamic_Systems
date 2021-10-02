model = struct(...
    'c', 1.25 * 1e-9, ...
    'Pm', 25 * 1e6, ...
    'dt', 10, ...
    'P0', 3 * 1e6, ...
    'T1', 130 ...
);

observation = ...
    [3.0000, 3.2276, 4.5759, 6.9570, ...
     8.7618, 9.1536, 11.2669, 14.5153, ...
     16.5059, 17.9563, 19.5078] * 1e6;


%% single simulation
[T, P] = simulatePopulation(model);
Tcont = 0:model.T1;
N = numel(Tcont);
realP = arrayfun(@fp, Tcont, ...
    ones(1, N) * model.Pm, ones(1, N) * model.P0, ones(1, N) * model.c);

subplot(1, 2, 1);
hold on;
plot(T, P, '*');
plot(Tcont, realP, 'lineWidth', 2);
plot(T(1:11), observation, 'o');
title('data comparison; dt = 10');
legend('approximation', 'real', 'observation')
xlabel('t, years');
ylabel('population V')

 
%% multiple simulations
model.T1 = 200;
model.dt = 1;
P0 = (5 : 5 : 50) * 1e6;
result = [];
for i = 1 : numel(P0)
    model.P0 = P0(i);
    [T, result(i, :)] = simulatePopulation(model); %#ok
end
result = result(:, [1, (10:10:200)]);
T1 = [0, (10:10:200)];

subplot(1, 2, 2);
hold on;
for i = 1 : size(result, 1)
    plot(T1, result(i, :), '*');
end
title('different initial data; dt = 1')
xlabel('t, years');
ylabel('population V')


%% analytical population function
function p = fp(t, Pm, P0, c)
    p = Pm * P0 / (P0 + (Pm - P0) * exp(-c * Pm * t));
end

