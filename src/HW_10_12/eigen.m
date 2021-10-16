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

