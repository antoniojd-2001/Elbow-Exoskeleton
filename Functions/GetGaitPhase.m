function gait_phase = GetGaitPhase(time, heel_strike_indices)
    % Uses the time vector and heel strike indices to calculate gait phase.
    arguments
        time (:,1) double
        heel_strike_indices (1,:) double
    end


    % Get a list of Stride Durations
    stride_durations = [];
    for i = 1:length(heel_strike_indices)-1
        stride_durations(end+1) = time(heel_strike_indices(i+1)) - time(heel_strike_indices(i));
        
    end
    
    stride_idx = 1;
    gait_phase = NaN(size(time));

    % Your code here
    firstTime = time(heel_strike_indices(1));
    
    for i = heel_strike_indices(1):length(time)
        
        gait_phase(i) = (time(i)-firstTime)/stride_durations(stride_idx) * 100;

        if ismember(i, heel_strike_indices) && i ~= heel_strike_indices(1)
            stride_idx = stride_idx + 1;
            firstTime = time(i);
            if stride_idx == length(heel_strike_indices)
                break
            end
        end
    end
   

end