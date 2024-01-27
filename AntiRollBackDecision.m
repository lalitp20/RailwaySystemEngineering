% Define parameters
vehicle_mass = 1000;            % Vehicle mass in kg
gravity = 9.81;                % Gravity in m/s^2
engine_power = 100;            % Engine power in kW
gear_ratio = 4;                % Gear ratio
wheel_radius = 0.3;            % Wheel radius in meters
slope_angle = 10;              % Slope angle in degrees

% Calculate required torque
slope_angle_rad = deg2rad(slope_angle);  % Convert slope angle to radians
slope_force = vehicle_mass * gravity * sin(slope_angle_rad);  % Force required to overcome the slope
torque_required = slope_force * wheel_radius  % Torque required at the wheels

% Calculate maximum torque from engine
engine_torque = engine_power * 1000 / (wheel_radius * gear_ratio)  % Engine torque in Nm

% Check if anti-roll back protection is needed
if torque_required > engine_torque
    fprintf('Anti-roll back protection is needed.\n');
else
    fprintf('No anti-roll back protection is needed.\n');
end