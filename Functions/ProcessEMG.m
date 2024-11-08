function processedData = ProcessEMG(data,freq, downSampleFreq)
%PROCESSEMG processs EMG data using processing sequence: 
%high pass filter, rectify, low pass filter, downsample
    %create high Pass
    nyq = freq/2;
    [b,a] = butter(4, 200/nyq, "high");
    %Rectify and High pass in one step
    absHPFiltered = abs(filtfilt(b,a, data));
    %low pass
    [bl,al] = butter(4, 10/nyq, 'low');
    LPFiltered = filtfilt(bl,al, absHPFiltered);
    %Choose gain
    gain = 1;

    processedData = gain.*ResampleByFreq(LPFiltered, freq, downSampleFreq);
end

