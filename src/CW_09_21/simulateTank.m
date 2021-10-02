function [T, H] = simulateTank(model)
% [T, H] = simulateTank(model)
% simulate a one tank system with input water flow: \model.F
    assert( checkModel(model, 'A', 'R', 'h0', 'dt', 'n', 'F') );
    T = (0 : model.n) * model.dt;
    F1 = arrayfun(model.F, T);
    H = zeros(1, model.n + 1);
    H(1) = model.h0;
    for i = 1 : model.n
        H(i+1) = evolution(model.dt, model.A, model.R, H(i), F1(i));
    end
end

function h = evolution(dt, A, R, prev, f)
    upd = (1 -  dt / (A * R)) * prev + (dt / A) * f;
    h = max(0, upd);
end
