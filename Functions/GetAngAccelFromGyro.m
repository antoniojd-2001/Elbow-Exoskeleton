function angAccel = GetAngAccelFromGyro(gyroData, freq)
%GETANGACCELFROMGYRO Get angular acceleration from gyroscope data using
%derivates
    deltaT = 1/freq;
    angAccel = zeros(length(gyroData) - 1,1);
    for i = 2:length(gyroData)
        angAccel(i) = (gyroData(i) - gyroData(i-1)) / deltaT;
    end
end

