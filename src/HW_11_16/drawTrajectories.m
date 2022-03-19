function drawTrajectories(curves)
    assert(size(curves, 1) == 2);
    assert(mod(size(curves, 3), 2) == 1);
    M = size(curves, 2);
    N = floor(size(curves, 3) / 2);
    
    c1 = [1; 0; 0];
    c2 = [0; 0; 1];
    if M == 1
        tc = 0.5;
    else
        tc = 0 : (1 / (M-1)) : 1;
    end
    colors = c1.*tc + c2.*(1 - tc);
    
    hold on;
    grid on;
    for i = 1:M
        curve = squeeze(curves(:, i, :));
        plot(curve(1, :), curve(2, :), ...
                'Color', colors(:, i));
    end
    quiver(...
        curves(1, :, N), ...
        curves(2, :, N), ...
        curves(1, :, N+1) - curves(1, :, N), ...
        curves(2, :, N+1) - curves(2, :, N)  ...
    );
end

