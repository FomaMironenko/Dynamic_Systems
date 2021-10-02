c = 3;
model = struct( ...
    'A',  5, ...
    'dt', [], ...
    'h0', 10, ...
    'n',  [], ...
    'F0', @(H) c * sqrt(H) ...
);

hold on;

% 1.6 (a)
model.n = 10;
model.dt = 2.5;
[T1, H1] = simulatePouringTank(model);
plot(T1, H1);

% 1.6 (b)
model.n = 25;
model.dt = 1;
[T2, H2] = simulatePouringTank(model);
plot(T2, H2);

% 1.6 (c)
model.n = 100;
model.dt = 0.25;
[T3, H3] = simulatePouringTank(model);
plot(T3, H3);

% plot formatting
xlabel('t, min');
ylabel('H, ft');
legend('step = 2.5', 'step = 1', 'step = 0.25')

