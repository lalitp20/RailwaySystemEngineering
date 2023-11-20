% Given parameters
m = 1000; % Weight (kg)
W = 1; % Width (m)
H = 1.5; % Height (m)
mu_rr = 0.02; % Rolling Resistance
rho = 1.25; % Air Density (kg/m^3)
Cd = 0.3; % Drag Coefficient
g = 9.8; % Gravitational Force (m/s^2)
v = 40 / 3.6; % Speed (m/s), converted from km/h to m/s
A = 1.5; % Frontal Area (m^2)
theta = 10; % Angle - Hill Climbing (degrees)
a = 2; % Linear acceleration (m/s^2)
alpha = 0.1; % Angular acceleration (rad/s^2)

% Rolling Resistance Force
F_rr = mu_rr * m * g; % N

% Aerodynamic Drag Force
F_aero = 0.5 * Cd * A * rho * v^2; % N

% Hill Climbing Force
F_hill = m * g * sind(theta); % N

% Linear Acceleration Force
F_acc_lin = m * a; % N

% Angular Acceleration Force
I = m * (W^2 + H^2) / 12; % Moment of Inertia for a rectangular object
F_acc_ang = I * alpha; % N

% Total Tractive Force
F_te = F_rr + F_aero + F_hill + F_acc_lin + F_acc_ang; % N

% Motor speed control code using F_te
% ... (Write your motor control code here)

% Calculate the required motor power
P_total = F_te * v; % W

% Battery capacity and power data
battery_capacity = 50000; % Battery capacity (Wh)

% Power characteristics
power_at_50_percent_SOC = 2500; % Power at 50% state of charge (W)
power_at_100_percent_SOC = 5000; % Power at 100% state of charge (W)

% Calculate maximum driving time based on battery capacity & power
battery_power_range = power_at_100_percent_SOC - power_at_50_percent_SOC; % W
drive_time = battery_capacity / battery_power_range; % hours

% Calculate distance covered based on maximum driving time and speed
dist_covered = v * drive_time * 3600; % meters

% Calculate distance and battery capacity for 30 minutes
drive_time_30mins = 30 * 60; % 30 minutes (s)
dist_covered_30mins = v * drive_time_30mins; % meters
battery_capacity_30mins = (P_total / 3600) * drive_time_30mins; % Wh
battery_remaining_30mins =  battery_capacity - battery_capacity_30mins; % Wh

% Display results
disp(['Required motor power to Drive Vehicle: ' num2str(P_total) ' W']);
disp(['Distance covered in 30 minutes: ' num2str(dist_covered_30mins) ' meters']);
disp(['Battery Capacity: ' num2str(battery_capacity) ' Wh']);
disp(['Battery Capacity required for 30 minutes Vehicle Drive with 40km/h: ' num2str(battery_capacity_30mins) ' Wh']);
disp(['Battery Remaining after 30 minutes: ' num2str(battery_remaining_30mins) ' Wh']);