function R_GaitState = GetGaitState(D)
    % Takes in data and returns right leg gait state based on heuristics

    R_GaitState = NaN(size(D.Time));
    R_current_state = 1; % Assume gait state is 1 at the beginning of the file

    Force_Threshold = 50;
    Ankle_Angle_Threshold = 15;

    % Stance Flexion    = 1
    % Pre-Swing         = 2
    % Swing Flexion     = 3
    % Swing Extension   = 4

    
    % Your Code Here
    R_GaitState(1) = R_current_state;
    for i=2:length(R_GaitState)
        switch R_GaitState(i-1)
            case 1
                if D.R_Ankle_Angle(i) > Ankle_Angle_Threshold
                    R_GaitState(i) = 2;
                else
                    R_GaitState(i) = 1;
                end
            case 2
                if D.R_F(i,3) < Force_Threshold
                    R_GaitState(i) = 3;
                else
                    R_GaitState(i) = 2;
                end
            case 3
                if D.R_Knee_Velocity(i) > 0
                    R_GaitState(i) = 4;
                else
                    R_GaitState(i) = 3;
                end
            case 4
                if D.R_F(i,3) > Force_Threshold
                    R_GaitState(i) = 1;
                else
                    R_GaitState(i) = 4;
                end
               
        end
    end
    

end