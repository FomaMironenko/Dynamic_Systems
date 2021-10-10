id = @(x) x;
T1 = pi / 2;
x0 = pi / 6;
N  = 200;
X = 0 : 0.01 : T1;

% good example: cos
f = @(x) cos(x);
subplot(1, 2, 1);
title('cos');
hold on;
grid on;
plot(X, f(X), 'r', 'lineWidth', 2);
plot(X, id(X), 'k', 'lineWidth', 2);
pts = [x0, 0];
for i = 1:N
    x0 = pts(end, 1);
    x1 = f(x0);
    pts = [pts; [x0, x1]]; %#ok <ARGOV>
    pts = [pts; [x1, x1]]; %#ok <ARGOV>
end
plot(pts(:, 1), pts(:, 2), 'g', 'lineWidth', 1.5);

% bad example: sin
f = @(x) sin(x);
subplot(1, 2, 2);
title('sin');
hold on;
grid on;
plot(X, f(X), 'r', 'lineWidth', 2);
plot(X, id(X), 'k', 'lineWidth', 2);
pts = [x0, 0];
for i = 1:N
    x0 = pts(end, 1);
    x1 = f(x0);
    pts = [pts; [x0, x1]]; %#ok <ARGOV>
    pts = [pts; [x1, x1]]; %#ok <ARGOV>
end
plot(pts(:, 1), pts(:, 2), 'g', 'lineWidth', 1.5);
