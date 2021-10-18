function points = discrete_trajectory(A, X0, N)
% points = discrete_trajectory(A, X0, N)
% \param  A  must be a 2x2 double matrix
% \param  X0 must be an array of initial points of size 2xK
% \param  N  is a number of iterations
% \return (2*K)x(N+1) matrix representing trajectories:
%         points([2*i-1, 2*i], :) is a single trajectory
    if nargin < 3, N = 10; end
    assert( all(size(A) == [2, 2]), 'A must be a square matrix');
    assert( size(X0, 1) == 2, 'X0 must be a row of 2x1 vectors');
    points = zeros(numel(X0), N+1);
    points(:, 1) = reshape(X0, [], 1);
    for i = 2 : (N+1)
        X = reshape(points(:, i-1), 2, []);
        points(:, i) = reshape(A * X, [], 1);
    end
end

