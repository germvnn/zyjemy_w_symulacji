% Główny skrypt
% clear; clc; close all;

% Krok 1: Przygotowanie Danych
% [imds, blds, cds] = loadData('C:/Users/daniel/Desktop/Nowy folder/Task_2/Training Dataset');

% Krok 2: Projektowanie Architektury Sieci
% layers = createNetwork([1200 1920 3], 1);

% Krok 3: Trenowanie Modelu
% [detector, info] = trainModel(cds, layers);
load('Task_2_zyjemy_w_symulacji.mat')
% Krok 4: Wykonywanie Detekcji na Zestawie Danych i Zapisywanie Wyników
folderPath = 'C:/Users/daniel/Desktop/Nowy folder/Task_2/Training Dataset'; % Ścieżka do folderu z obrazami
imageFiles = imds.Files; % Lista plików obrazów
saveToFile = struct('Image', imageFiles, 'BoundingBox', []); % Inicjalizacja struktury saveToFile

for i = 1:numel(imageFiles)
    % Przeczytaj obraz
    img = imread(imageFiles{i});
    
    % Wykonaj detekcję używając wytrenowanego modelu
    [bboxes, scores, labels] = detect(detector, img);
    
    % Wybierz bounding box o najwyższym wyniku, zakładając że jest jeden obiekt na obraz
    [~, idx] = max(scores);
    selectedBBox = bboxes(idx, :);
    
    % Zapisz wyniki do struktury saveToFile
    saveToFile(i).BoundingBox = selectedBBox;
end

% Zapisz strukturę saveToFile do pliku .mat
save('Task_2_zyjemy_w_symulacji.mat', 'saveToFile');