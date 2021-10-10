%% init matrices
% no unit eigen values
A1 = [1, -2; 
     -3, 4];

% one unit eigen value
A2 = [3, 2;
      0, 1];

% 2 * pi / 3 rotation
A3 = [-1/2, -sqrt(3)/2;
      sqrt(3)/2, -1/2];

% p/2 rotation
A4 = [0, -1;
      1, 0];

%% plotting
disp(repelem('~', 2, 40));

subplot(2, 2, 1);
title('A1');
draw_offsets(A1);
A1_eig = eig(A1)';
disp(table(A1_eig));
disp(repelem('=', 1, 40));

subplot(2, 2, 2);
title('A2');
draw_offsets(A2);
A2_eig = eig(A2)';
disp(table(A2_eig));
disp(repelem('=', 1, 40));

subplot(2, 2, 3);
title('A3');
draw_offsets(A3);
A3_eig = eig(A3)';
disp(table(A3_eig));
disp(repelem('=', 1, 40));

subplot(2, 2, 4);
title('A4');
draw_offsets(A4);
A4_eig = eig(A4)';
disp(table(A4_eig));
disp(repelem('=', 1, 40));


%% main function
function draw_offsets(A)
    assert(ismatrix(A) && size(A, 1) == size(A, 2));
    span = 1;
    lim = span * 1.3;
    [X, Y] = meshgrid(...
        -span : .2 : span, -span : .2 : span);
    vec = [X(:)'; Y(:)'];
    appl = A * vec;
    offset = appl - vec;
    
    hold on;
    grid on;
    xlim([-lim, lim]);
    ylim([-lim, lim]);
    plot(X(:), Y(:), 'r.');
    plot(0, 0, 'ro')
    quiver( X(:)', Y(:)', offset(1, :), offset(2, :));
    hold off;
end

