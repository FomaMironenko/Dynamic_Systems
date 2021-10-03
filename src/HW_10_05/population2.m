model = struct(...
    'c', 1.25 * 1e-9, ...
    'Pm', 25 * 1e6, ...
    'dt', 10, ...
    'P0', 3 * 1e6, ...
    'T1', 200 ...
);


precise = true;
[~, P1] = simulatePopulation(model, ~precise);
[T, P2] = simulatePopulation(model, precise);
Tcont = 0:model.T1;
N = numel(Tcont);
realP = arrayfun(@fp, Tcont, ...
    ones(1, N) * model.Pm, ones(1, N) * model.P0, ones(1, N) * model.c);

hold on;
plot(T, P1, 'r*');
plot(T, P2, 'bo');
plot(Tcont, realP, 'g', 'lineWidth', 2);
title('data comparison; dt = 10');
legend('single precision', 'double precision', 'real solution')
xlabel('t, years');
ylabel('population V');


%% analytical population function
function p = fp(t, Pm, P0, c)
    p = Pm * P0 / (P0 + (Pm - P0) * exp(-c * Pm * t));
end
