figure;
for mu = 1 : 0.25 : 6
% mu = 1;
    clf
    f = @(y, x) x;
    g = @(y, x) -y - mu*(y^2 - 1)*x;

    grd = -6 : 0.5 : 6;
    N = 600;
    M = numel(grd);
    X0 = [zeros(1, M); grd];

    curves = approxSolution(f, g, X0, N, 0.01);
    drawTrajectories(curves);

    xlim([-3, 3]);
    ylim([-8, 8]);
    xlabel('y');
    ylabel('x')
    title(['\mu = ', num2str(mu)]);
    
    pause(0.5);
end
