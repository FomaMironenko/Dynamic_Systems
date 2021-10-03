model = struct(...
    'c', 1.25 * 1e-9, ...
    'Pm', 25 * 1e6, ...
    'dt', 1, ...
    'P0', [], ...
    'T1', 300 ...
);

% compute how many years does it take to reach a specific 
% population value

alpha = 0.98;
aVal = model.Pm * alpha;

%% 1.11.a -- quantiles
% first simulation
model.P0 = 3 * 1e6;
[T1, P1] = simulatePopulation(model);
i1 = find(P1 >= aVal, 1);
assert(~isempty(i1));
T1 = T1(1 : i1);
P1 = P1(1 : i1);

% second simulation
model.P0 = 22.2012 * 1e6;
[T2, P2] = simulatePopulation(model);
i2 = find(P2 >= aVal, 1);
T2 = T2(1 : i2);
P2 = P2(1 : i2);

% plotting
subplot(1, 2, 1);
hold on;
T = 0 : max([T1, T2]) + 1;
plot(T, ones(1, numel(T)) * aVal, 'r');
plot(T1, P1, 'g*');
plot(T2, P2, 'bo');
grid on;


%% 1.11.b -- quantiles for an exact solution
N = numel(T);
model.P0 = 3 * 1e6;
P = arrayfun(@fp, T, ...
    ones(1, N) * model.Pm, ones(1, N) * model.P0, ones(1, N) * model.c);
plot(T, P, 'k', 'lineWidth', 1.5);
i3 = find(P >= aVal, 1);
disp(table(i1, i2, i3));
legend('alpha', 'T0 = 0', 'T0  = 30', 'exact solution',...
    'location', 'southeast');
xlabel('t, years');
ylabel('population V');


%% 1.11.c -- growth rate g
P = (0 : 50) * 1e6;
G = model.c * (model.Pm - P);
N = numel(P);
subplot(1, 2, 2);
hold on;
plot(P, zeros(1, N), 'k');
plot(P, G);
t = [0, 25, 50, 75, 100];
labels = num2cell(t);
p = P1(1 + t);
g = model.c * (model.Pm - p);
plot(p, g, '*');
text(p, g, labels, ...
    'VerticalAlignment','bottom','HorizontalAlignment','left')
xlabel('P (millions)');
ylabel('growth rate');
ylim([-0.04, 0.04]);
grid on;


%% 1.11.d 
% see CW_09_28


%% 1.11.e
% there are only two equilibriums:
% Pm and 0. Pm is stable while 0 is not



%% analytical population function
function p = fp(t, Pm, P0, c)
    p = Pm * P0 / (P0 + (Pm - P0) * exp(-c * Pm * t));
end
