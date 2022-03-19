function curve = continuous_trajectory(A, X0, Niters)
    assert(ismatrix(A) && iscolumn(X0) && size(A, 1) == length(X0));
    assert(det(A) ~= 0);
    if nargin < 3, Niters = 200; end
    absDelta = 0.01;
    curve = [];
    %% continuous trajectory
    for dir = [-1, 1]
        pts = zeros(2, Niters+1);
        pts(:, 1) = X0;
        for i = 2 : (Niters+1)
            grad = A * pts(:, i-1);
            d = norm(grad);
            D = norm(pts(:, i-1));
            if d == 0
                pts(:, i) = pts(:, i-1);
            else
                offset = dir * min(absDelta, D/2);
                pts(:, i) = pts(:, i-1) + offset * grad / d;
            end
        end
        curve = [curve, pts]; %#ok <ARGOV>
    end
    curve = [curve(:, (Niters+1):-1:2), curve(:, (Niters+2):1:end)];
end
