function [detector, info] = trainModel(cds, lgraph)
    % Skonfiguruj opcje treningowe
    options = trainingOptions('sgdm', ...
        'InitialLearnRate', 0.001, ...
        'MaxEpochs', 1, ...
        'MiniBatchSize', 1, ... % Zmniejszony rozmiar MiniBatch dla zarządzania pamięcią
        'Shuffle', 'every-epoch', ...
        'Verbose', true, ...
        'Plots', 'training-progress');

    % Trenuj model
    [detector, info] = trainFasterRCNNObjectDetector(cds, lgraph, options, ...
        'NegativeOverlapRange', [0 0.3], ...
        'PositiveOverlapRange', [0.6 1]);
end