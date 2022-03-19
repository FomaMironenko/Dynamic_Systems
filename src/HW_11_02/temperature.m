%% constants definition
T0 = 60;
mh = 50;

cp = 1;
ca = 0.01375;

R = 0.025;
V = 5000;

B = 3 * mh * cp * T0 + T0 / R;
A = mh * cp + 1 / R;

K = B / A;
tau = (ca * V) / A;

%% functions
f = @(t) (T0 - K) * exp(-t / tau) + K;
eq = @(t) K;

%% solutions
t = 0 : .1 : 10;
T = arrayfun(f, t);
EQ = arrayfun(eq, t);

%% plotting
hold on;
plot(t, T, 'b', 'LineWidth', 2);
plot(t, EQ, 'r:', 'LineWidth', 2);
grid on;
