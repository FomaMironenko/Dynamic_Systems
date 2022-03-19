function vanDerPoll(mu)
    assert(mu > 0);
    f = @(y, x) x;
    g = @(y, x) -y - mu * (y^2 - 1) * x;
    xbnd = 2;
    ybnd = 3;
    step = 0.5;
    xgrid = -xbnd : step : xbnd;
    ygrid = -ybnd : step : ybnd;
    [Y, X] = meshgrid(ygrid, xgrid);
    F = arrayfun(f, Y, X);
    G = arrayfun(g, Y, X);
    quiver(...
        Y(:), X(:), F(:), G(:));
end