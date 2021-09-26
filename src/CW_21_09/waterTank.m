% init model
model = struct(...
    'A',  2, ...
    'R',  3, ...
    'h0', 0, ...
    'dt', 0.1, ...
    'n',  200, ...
    'F',  [] ...
);

hold on;

% constant flow
model.F = @(t) 1;
[T, H1] = simulateTank(model);
plot(T, H1);

% linear flow
model.F = @(t) t * 0.5;
[T, H2] = simulateTank(model);
plot(T, H2);

% descending flow
model.F = @(t) 1 + 1 / (1 + t);
[T, H3] = simulateTank(model);
plot(T, H3);

% plot formatting
xlabel('t, min');
ylabel('H, ft');
legend('F(t) = 1', 'F(t) = 0.5 t', 'F(t) = 1 + 1 / (1 + t)')

