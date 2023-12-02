function [imds, blds, cds] = loadData(folderPath)
    % Funkcja do wczytywania danych i tworzenia datastores

    % Załaduj etykiety bounding boxów
    data = load(fullfile(folderPath, 'Task_2_Training_dataset.mat'));
    Training_Data = data.Task_2_Training_Data;

    % Pobierz ścieżki obrazów .png
    imagePaths = fullfile(folderPath, '*.png');

    % Pobierz bounding boxy i przekształć je w komórki
    bboxes = reshape([Training_Data.BoundingBox], 4, [])';
    bboxCells = num2cell(bboxes, 2);

    % Stwórz tabelę z komórkami bounding boxów
    bboxTable = table(bboxCells, 'VariableNames', {'BoundingBox'});

    % Stwórz ImageDatastore dla obrazów
    imds = imageDatastore(imagePaths, 'FileExtensions', '.png');

    % Stwórz BoxLabelDatastore dla bounding boxów
    blds = boxLabelDatastore(bboxTable);

    % Połącz oba datastores
    cds = combine(imds, blds);
end