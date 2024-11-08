function torque = ImpedanceController(impedance_params, gait_state, angle, velocity)
    % Uses gait state and the impedance params to determine the actuator
    % torque.

    arguments
        impedance_params (1,12) double
        gait_state (:,1) double
        angle (:,1) double
        velocity (:,1) double
    end

    % your code here
    torque = zeros(1,length(gait_state));
    for i = 1:length(torque)
        switch gait_state(i)
            case 1
                torque(i) = impedance_params(1)*(angle(i)-impedance_params(9)) + impedance_params(5)*velocity(i);
            case 2
                torque(i) = impedance_params(2)*(angle(i)-impedance_params(10)) + impedance_params(6)*velocity(i);
            case 3
                torque(i) = impedance_params(3)*(angle(i)-impedance_params(11)) + impedance_params(7)*velocity(i);
            case 4
                torque(i) = impedance_params(4)*(angle(i)-impedance_params(12)) + impedance_params(8)*velocity(i);

        end
    end
    torque = torque.*-1;
end