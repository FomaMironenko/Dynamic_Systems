function TF = checkModel(model, varargin)
% TF = checkModel(model, varargin)
% checks that struct \model has properties from varargin
    assert( all( cellfun(@(e) ...
        isa(e, 'string') || isa(e, 'char'), ...
        varargin )) ...
    );
    TF = all( isfield(model, varargin) );
end

