function orientation = FindAngleFromGyro(data,freq)
%FINDANGLEFROMGYRO Summary of this function goes here
%   Detailed explanation goes here
    deltaT = 1/freq;
    orientation = zeros(length(data),1);
    for i = 2:length(data)
        orientation(i) = orientation(i-1) + data(i) * deltaT;
    end
end

