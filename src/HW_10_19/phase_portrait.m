%% init matrices
A1 = [5, 3;
     -2, 2];
eig(A1)

A2 = [1, -3;
      2, -2];
eig(A2)

A3 = [sqrt(3)/2, 1/2;
      -1/2, sqrt(3)/2];
eig(A3)

A = {A1, A2, A3};

%% initial data
Ninit = 32;
Nmat = numel(A);
Niters = 3;

T = (0 : 1/Ninit : (1 - 1/Ninit)) * 2 * pi;
X0 = [0; 0];
X = X0 + [cos(T); sin(T)] * 0.5;

color1 = [1, 0, 0];
color2 = [0, 0, 1];

%% iterations
for imat = 1 : Nmat
    figure;
    hold on;
    lines = discrete_trajectory(A{imat}, X, Niters);
    assert( mod(size(lines, 1), 2)  == 0);
    Nlines = size(lines, 1) / 2;
    for i = 1 : Nlines
        inds = [2*i-1, 2*i];
        cur = lines(inds, :);
        next = lines(mod(inds + 2 - 1, Nlines * 2) + 1, :);
        plot(cur(1, :), cur(2, :), '*:', ...
            'LineWidth', 0.5, ...
            'Color', color1 * i / Ninit + color2 * (1 - i / Ninit));
        for j = 1 : size(lines, 2)
            plot([cur(1, j), next(1, j)], [cur(2, j), next(2, j)], ...
                'LineWidth', 1.5, ...
                'Color', color1 * i / Ninit + color2 * (1 - i / Ninit));
        end
    end
    plot(0, 0, 'gp')
    axis equal;
end
