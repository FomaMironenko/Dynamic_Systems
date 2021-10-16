function draw_offsets(A)
    assert(ismatrix(A) && size(A, 1) == size(A, 2));
    span = 1;
    [X, Y] = meshgrid(...
        -span : .2 : span, -span : .2 : span);
    vec = [X(:)'; Y(:)'];
    appl = A * vec;
    offset = appl - vec;
    
    hold on;
    grid on;
    [V, D] = eig(A);
    if isreal(D)
        t = [-100, 100];
        lin1 = V(:, 1) .* t;
        lin2 = V(:, 2) .* t;
        plot(lin1(1, :), lin1(2, :), 'g');
        plot(lin2(1, :), lin2(2, :), 'c');
        legend(num2str(D(1, 1)), num2str(D(2, 2)), ...
            'AutoUpdate', 'off');
    else
        pts = [0; 0.4];
        for i = 1 : 10
            pts(:, end+1) = A * pts(:, end); %#ok <ARGOV>
        end
        plot(pts(1, :), pts(2, :), 'g');
    end
    
    lim = span * 1.3;
    xlim([-lim, lim]);
    ylim([-lim, lim]);
    plot(X(:), Y(:), 'r.');
    plot(0, 0, 'ro')
    quiver( X(:)', Y(:)', offset(1, :), offset(2, :));
    hold off;
end

