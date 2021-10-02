function [T, P] = simulatePopulation(model, precise)
% [T, P] = simulatePopulation(model, <precise>)
    assert( checkModel(model, 'P0', 'dt', 'T1', 'c', 'Pm') );
    params = {model.dt, model.c, model.Pm};
    if nargin < 2, precise = false; end
    T = 0 : model.dt : model.T1;
    P = zeros(1, numel(T));
    P(1) = model.P0;
    P(2) = evolution(P(1), params{:});
    for i = 3 : numel(P)
        if precise 
            P(i) = evolutionPlus(P(i-1), P(i-2), params{:});
        else
            P(i) = evolution(P(i-1), params{:});
        end
    end
end

function p = evolution(prev, dt, c, Pm)
    p = prev + c * dt * (Pm - prev) * prev;
end

function p = evolutionPlus(prev, preprev, dt, c, Pm)
    p = preprev + 2 * c * dt * (Pm - prev) * prev;
end

