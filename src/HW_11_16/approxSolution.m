function curves = approxSolution(f, g, X0, N, gradScale)
% curves = approxSolution(f, g, X0, N)
% \X0 -- 2xM matrix of initial data
    assert(size(X0, 1) == 2);
    M = size(X0, 2);
    curves = zeros(2, M, 0);
    if nargin < 5, gradScale = 0.01; end
    
    for dir = [1, -1]
        curves(:, :, end+1) = X0; %#ok <ARGOV>
        for i = 2 : N
            grad = [...
                arrayfun(f, curves(1, :, end), curves(2, :, end));...
                arrayfun(g, curves(1, :, end), curves(2, :, end)) ...
            ];
            grad = grad * gradScale;
            curves(:, :, end+1) = curves(:, :, end) + dir * grad; %#ok <ARGOV>
        end
    end
    curves = cat(3, curves(:, :, end:-1:(N+2)), curves(:, :, 1:N));
end

