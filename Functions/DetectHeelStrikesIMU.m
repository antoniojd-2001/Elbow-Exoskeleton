function HS_idxs = DetectHeelStrikesIMU(gyro_x)
    % Uses a threshold on vertical force to calculate heel strike indices
    arguments
        gyro_x (:,1) double
    end

    % Your Code here
    %LP filter the data
    nyq = 300/2;
    [b,a] = butter(4, 2/nyq, 'low');
    filteredGyro = filtfilt(b, a, gyro_x);

    %Find peaks
    HS_idxs = [];
    peaks = [];
    index = 1;
    for i=2:length(filteredGyro)-1
        if filteredGyro(i) > filteredGyro(i-1) && filteredGyro(i) > filteredGyro(i+1) && filteredGyro(i) > 200
            HS_idxs(index) = i;
            peaks(index) = filteredGyro(i);
            index = index + 1;
        end
    end

    %Adjust to match load cell data
    HS_idxs = HS_idxs + 55;

end
