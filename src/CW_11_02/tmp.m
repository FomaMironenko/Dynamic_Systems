%% initialization
% matrix
A = [5, 6;
     2, 4];
[~, D] = eig(A);
% initial points
N = 64;
t = (0 : (N-1)) / N;
X0 = [cos(2*pi*t); sin(2*pi*t)];
% RGB color gradient
c1 = [1; 0; 0];
c2 = [0; 0; 1];
color = c1 .* (1 - t) + c2 .* t;

%% canonic form
figure;
hold on;
for i = 1 : N
    curve = continuous_trajectory(D, X0(:, i), 400);
    plot(curve(1, :), curve(2, :), 'Color', color(:, i));
    plot(X0(1, i), X0(2, i), '*', 'Color', color(:, i));
end
plot(0, 0, 'gp');

%% matrix
figure;
hold on;
for i = 1 : N
    curve = continuous_trajectory(A, X0(:, i), 400);
    plot(curve(1, :), curve(2, :), 'Color', color(:, i));
    plot(X0(1, i), X0(2, i), '*', 'Color', color(:, i));
end
plot(0, 0, 'gp');

