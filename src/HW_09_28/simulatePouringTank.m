function [T, H] = simulatePouringTank(model)
% [T, H] = simulatePouringTank(model)
% simulate a water tank with zero incoming flow and 
% an outcoming water flow defined by \model.F0
    assert( checkModel(model, 'A', 'dt', 'h0', 'n', 'F0') );
    T = (0 : model.n) * model.dt;
    H = zeros(1, model.n + 1);
    H(1) = model.h0;
    for i = 1 : model.n
        H(i+1) = evolution(model.dt, model.A, H(i), model.F0);
    end
end

function h = evolution(dt, A, prev, F0)
% see a derivation of evolution equation in evolution_formula.pdf
    upd = prev - dt * F0(prev) / A;
    h = max(0, upd);
end
