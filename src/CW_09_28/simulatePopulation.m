function [T, P] = simulatePopulation(model)
% [T, P] = simulatePopulation(model)
    assert( checkModel(model, 'P0', 'dt', 'T1', 'c', 'Pm') );
    T = 0 : model.dt : model.T1;
    P = zeros(1, numel(T));
    P(1) = model.P0;
    for i = 2 : numel(P)
        P(i) = evolution(P(i-1), model.dt, model.c, model.Pm);
    end
end

function p = evolution(prev, dt, c, Pm)
    p = prev + c * dt * (Pm - prev) * prev;
end

