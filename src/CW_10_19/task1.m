f = @(x) 1 - abs(2*x - 1);
x = -2 : 0.1 : 2;

hold on;
plot(x, x, 'k');
plot(x, f(x));
plot(x, f(f(x)));
title('f(x) = 1 - |2x - 1|');
axis equal;
grid on;
legend('id', 'f(x)', 'f(f(x))');
xlim([-1, 2]);
ylim([-1, 1.5]);

% statiotary points: 
% 1) (0, 0)
% 2) a solution of <y === x && y == 2 - 2x>, i.e. 
%    (2/3, 2/3)
% 
% 2-cycles: could be found as solutions of
% 1) <y == x && y == 2 - 4*x>, i.e.
%    (2/5, 2/5)
% 2) <y == x && y == 4 - 4*x>, i.e.
%    (4/5, 4/5)
