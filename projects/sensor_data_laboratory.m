
% Sensor Data Laboratory
% MATLAB practice covering matrix operations,
% logical indexing, control flow, functions,
% and polynomial fitting.


%% 1. Sensor Data

t = 0:3;

measurements = [
    12 20 33;
    14 23 35;
    16 25 38;
    19 28 42
    ];

fprintf('\n=== SENSOR DATA ===\n');

disp('Measurements:');
disp(measurements);

disp('Matrix Size:');
disp(size(measurements));


%% 2. Matrix Indexing

sensor2 = measurements(:,2);

thirdMeasurement = measurements(3,:);

lastMeasurements = measurements(end,:);

lastValue = measurements(end,end);

fprintf('\n=== MATRIX INDEXING ===\n');

disp('Sensor 2:');
disp(sensor2);

disp('Third Measurement:');
disp(thirdMeasurement);

disp('Last Measurements:');
disp(lastMeasurements);

fprintf('Last Value: %d\n',lastValue);


%% 3. Transpose

t_column = t';
sensor2_row = sensor2';

fprintf('\n=== TRANSPOSE ===\n');

disp('t_column Size:');
disp(size(t_column));

disp('sensor2_row Size:');
disp(size(sensor2_row));


%% 4. Vector Generation

t_fine = linspace(0,3,7);
t_log = logspace(0,3,4);

fprintf('\n=== VECTOR GENERATION ===\n');

disp('t_fine:');
disp(t_fine);

disp('t_log:');
disp(t_log);

fprintf('Number of points: %d\n',length(t_fine));

%% 5. Sensor Calibration Laboratory

zeroMatrix = zeros(3,3);

oneMatrix = ones(2,4);

identityMatrix = eye(3,3);

calibrationMatrix = diag([2 3 4]);

diagonalValues = diag(calibrationMatrix);

fprintf('\n=== SENSOR CALIBRATION LABORATORY ===\n');

disp('zeroMatrix:');
disp(zeroMatrix);

disp('oneMatrix:');
disp(oneMatrix);

disp('identityMatrix:');
disp(identityMatrix);

disp('calibrationMatrix:');
disp(calibrationMatrix);

disp('Diagonal Values:');
disp(diagonalValues);

%% 6. MATRIX MULTIPLICATION

calibratedData = measurements*calibrationMatrix;

fprintf('\n=== MATRIX MULTIPLICATION ===\n');

disp('Size of calibratedData:');
disp(size(calibratedData));

disp('calibratedData:');
disp(calibratedData);

firstCalibrated = calibratedData(1,:);

%% 7. ELEMENT-WISE OPERATIONS

calibratedElementwise = measurements.*[2 3 4];

normalizedData = measurements./measurements(1,:);

squaredData = measurements.^2;

fprintf('\n=== ELEMENT-WISE OPERATIONS ===\n');

disp('calibratedElementwise:');
disp(calibratedElementwise);

disp('normalizedData:');
disp(normalizedData);

disp('squaredData:');
disp(squaredData);

%% 8. INNER AND OUTER PRODUCT

u = [2 3 4];
v = [10 20 30];

innerProduct = u*(v');
outerProduct = (u')*v;

fprintf('\n=== INNER AND OUTER PRODUCT ===\n');

disp('Inner product: ')
disp(innerProduct);

disp('Outer product: ')
disp(outerProduct);

%% 9. LOGICAL INDEXING

sensor3 = measurements(:,3);

alarmMask = (sensor3 > 36);

alarmValues = sensor3(sensor3 > 36);

alarmIndices = find(sensor3 > 36);

disp('sensor3: ');
disp(sensor3);

disp('alarmMask: ');
disp(alarmMask);

disp('alarmValues: ');
disp(alarmValues);

disp('alarmIndices: ');
disp(alarmIndices);

%% 10.SENSOR SAFETY FILTER

filteredSensor3 = sensor3;

filteredSensor3(alarmMask) = 36;

disp('filteredSensor3: ');
disp(filteredSensor3);

    
disp('sensor3: ');
disp(sensor3);

alarmCount = sum(alarmMask);

disp('alarmCount: ');
disp(alarmCount);

%% 11.SMART SENSOR ALARM

latestReading = sensor3(end);

fprintf('Latest Reading: %d\n',latestReading);

if latestReading>40
    
    fprintf('Status: CRITICAL\n');

elseif latestReading>36
    
    fprintf('Status: WARNING\n');

else
    
    fprintf('Status: NORMAL\n');

end

%% 12.SENSOR OPERATING MODES

mode = 'ACTIVE';

switch(mode)

    case 'ACTIVE'
        disp('SENSORS ARE RUNNING');

    case 'TEST'
        disp('DIAGNOSTIC MODE ENABLED');

    case 'OFF'
         disp('System is offline');
    otherwise
          disp('Invalid operating mode!');
end

%% 13.AUTOMATIC SENSOR MONITORING

   for i=1:length(sensor3)

    currentReading = sensor3(i);

    if currentReading>40
        fprintf('Reading %d: %d  ',i,currentReading);
        fprintf('Status: CRITICAL\n');
    elseif currentReading>36
        fprintf('Reading %d: %d  ',i,currentReading);
        fprintf('Status: WARNING\n');
    else
        fprintf('Reading %d: %d  ',i,currentReading);
        fprintf('Status: NORMAL\n');
    end
    
   
   end

   %% 14.EMERGENCY STOP SYSTEM

   i = 1;

    while i<=length(sensor3)

    fprintf('Reading %d: %d\n',i,sensor3(i));

    if sensor3(i)>40
        fprintf('EMERGENCY STOP!\n');
        break;
    end

    i=i+1;

    end

%% 15. FUNCTION

    fprintf('=======FUNCTION======\n');

    function [status, isCritical] = evaluateSensor(value)
   
        if value > 40
        
            status = 'CRITICAL';
        elseif value > 36
        
            status = 'WARNING';
        else
        
            status = 'NORMAL';
        end
    
    isCritical = strcmp(status, 'CRITICAL');
   
    end

    [status, critical] = evaluateSensor(42);
    disp(status);
    disp(critical);

    %% 16. POLYNOMIAL FITTING

    fprintf('\n======= POLYNOMIAL =======\n');

    p = polyfit(t, sensor3', 2);

    t_smooth = linspace(0,3,100);

    y_fit = polyval(p,t_smooth);

    fprintf('Polynomial coefficients:\n');
    
    disp(p);

    figure;

    plot(t, sensor3, 'o');
    
    hold on;

    plot(t_smooth, y_fit, '-');

    xlabel('Time (s)');
    
    ylabel('Sensor Value');
    
    title('Sensor Polynomial Fitting');
    
    legend('Measurements', 'Polynomial Fit');
    
    grid on;

    hold off;






