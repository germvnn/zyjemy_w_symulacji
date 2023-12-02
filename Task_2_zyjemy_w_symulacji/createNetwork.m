function lgraph = createNetwork(inputSize, numClasses)
    % Wczytaj wstępnie wytrenowaną sieć MobileNetV2
    network = mobilenetv2();
    
    % Wybierz warstwę, która będzie wykorzystywana do ekstrakcji cech
    % Ta warstwa powinna być dostosowana do MobileNetV2
    featureLayer = 'out_relu'; % Dla MobileNetV2, 'out_relu' może być dobrą warstwą do ekstrakcji cech
    
    % Określ anchor boxes
    anchorBoxes = [66 67; 99 100; 133 134];
    
    % Stwórz Faster R-CNN layers
    lgraph = fasterRCNNLayers(inputSize, numClasses, anchorBoxes, network, featureLayer);
end