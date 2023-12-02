# System Detekcji Znaku D1

## Streszczenie
Projekt dotyczy implementacji systemu detekcji obiektów w środowisku MATLAB, który identyfikuje i lokalizuje znaki drogowe D1 na obrazach. System wykorzystuje głębokie uczenie i jest zbudowany na frameworku Computer Vision Toolbox dostępnym w MATLAB R2023b.

## Użyte Technologie
- **MATLAB R2023b**: Środowisko programistyczne do przetwarzania danych i algorytmów.
- **Computer Vision Toolbox**: Zestaw narzędzi w MATLAB do przetwarzania obrazów i wizji komputerowej.
- **Deep Learning Toolbox**: Narzędzie do projektowania i wdrażania sieci neuronowych.
- **Faster R-CNN**: Architektura sieci neuronowej do detekcji obiektów w czasie rzeczywistym.
- **MobileNetV2**: Jest poprawioną architekturą sieci neuronowej zaprojektowaną do zastosowań związanych z wizją komputerową na urządzeniach o ograniczonych zasobach obliczeniowych, takich jak smartfony i inne urządzenia wbudowane. Jest to ulepszona wersja swojego poprzednika, MobileNetV1, opracowana przez Google.

## Skład Projektu
Projekt składa się z następujących skryptów i funkcji:
- `Task_2_Main.m`: Główny skrypt wykonawczy, koordynujący proces uczenia i detekcji.
- `loadData.m`: Funkcja do wczytywania obrazów i etykiet.
- `createNetwork.m`: Funkcja do budowania architektury sieci neuronowej.
- `trainModel.m`: Funkcja odpowiedzialna za proces trenowania sieci.

## Architektura Sieci
Wykorzystano architekturę Faster R-CNN z siecią MobileNetV2 jako kręgosłupem dla ekstrakcji cech. Wybrano warstwę 'out_relu' dla ekstrakcji cech, a także zdefiniowano niestandardowe anchor boxes - [66 67; 99 100; 133 134], gdzie środek reprezentuje średnią arytmetyczną połowień pożądanego obiektu na obrazach treningowych, a śasiedujące wartości to pierwsze odchylenie standardowe tych połowień.

## Proces Trenowania
Model jest trenowany przy użyciu zestawu danych treningowych składającego się z 143 obrazów. Opcje treningowe zostały skonfigurowane, aby zoptymalizować proces uczenia, w tym szybkość uczenia się - 0.001 liczbe epok - 1 i rozmiar mini-batch - 1.

## Proces Detekcji
Po wytrenowaniu modelu wykorzystuje się go do detekcji znaków D1 na nowych obrazach. System zapisuje wyniki w strukturze saveToFile, która zawiera nazwy plików obrazów oraz koordynaty i rozmiary wykrytych ramek ograniczających.

## Wymagania i Ograniczenia
- System musi obsługiwać obrazy w formacie .png.
- Wyniki muszą być zapisywane bez ingerencji człowieka, poza zmianą ścieżki do danych.



# Projekt Regulatora Kaskadowego z Dwoma Regulatorami PID

## Opis Ogólny

Zaprojektowano regulator kaskadowy zawierający dwa regulatory PID działające w trybie dyskretnym. Regulator nadrzędny odpowiada za kontrolę prędkości kątowej, natomiast regulator podrzędny kontroluje natężenie prądu.

## Regulacja Prędkości Kątowej

Regulator nadrzędny przyjmuje jako wartość zadaną zadana prędkość ustaloną przez komendę wybranej prędkości (Input1). Znak wartości zadanej determinowany jest przez kierunek ruchu wycieraczki. Wycieraczka ma wykonywać obroty w zakresie pozycji od 0.5 do 2.5 radianów, inicjując ruch od pozycji 1 radiana i następnie wykonując ruch cykliczny.

## Regulacja Natężenia Prądu

Uchyb z regulatora prędkości kątowej służy jako wartość zadaną dla natężenia prądu do drugiego regulatora PID. Jego zadaniem jest utrzymanie zadanej wartości natężenia, generując zadaną wartość napięcia. To napięcie jest jedynym sygnałem sterującym podawanym na wyjście z układu regulacji.

## Mechanizmy Poprawy Sygnału

W celu poprawnej pracy systemu zastosowano down-sampling oraz filtry dolnoprzepustowe, aby zniwelować zaszumienie sygnału pochodzącego z enkodera.

## Ograniczenia Systemu

### Zakres Prędkości
System ma ograniczenia odnośnie utrzymania zadanej wartości prędkości wycieraczki. Zauważono, że prędkości większe niż około 2/2.5 rad/s nie są utrzymywane przez system.

### Wejście Testowe
Założono, że wartość wejściowa `testcase` będzie jedną z wartości {1, 2, 3}, co odpowiada różnym wymaganym prędkościom wycieraczki.
