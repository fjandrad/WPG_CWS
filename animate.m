function [frame ] = animate( chain_leg_R, chain_leg_L, chain_arm_R,...
    chain_arm_L, chain_head )
%ANIMATE draw the robot in the position given by the kinematic chains
%   chain_leg_R : kinematic chain of the right leg
%   chain_leg_L : kinematic chain of the left leg
%   chain_arm_R : kinematic chain of the right arm
%   chain_arm_L : kinematic chain of the left arm
%   chain_head : kinematic chain of the head

global steptime;
global P_COG;
clf('reset');
fig_frame=gcf;
v1=[0,0];
v2=[90,0];
v3=[0,90];
subplot(2,2,1);
%% Size of the kinematic chains
size_leg_R = size(chain_leg_R,3);
size_leg_L = size(chain_leg_L,3);
size_arm_R = size(chain_arm_R,3);
size_arm_L = size(chain_arm_L,3);
size_head = size(chain_head,3);

%% Draw all the points given by the transformation matrices for the right leg
X_i = zeros(1,size_leg_R);
Y_i = zeros(1,size_leg_R);
Z_i = zeros(1,size_leg_R);
for i = 1:size_leg_R
    % extract the position of the i-th joint
    X_i(i) = chain_leg_R(1,4,i);
    Y_i(i) = chain_leg_R(2,4,i);
    Z_i(i) = chain_leg_R(3,4,i);
end
torso_X(1) = chain_leg_R(1,4,1);
torso_Y(1) = chain_leg_R(2,4,1);
torso_Z(1) = chain_leg_R(3,4,1);

subplot(2,2,1);
hp=plot3(X_i, Y_i, Z_i); hold on;
ax=[-0.1 0.5 -0.3 0.3 -0.1 0.5];
axis(ax)
hs=subplot(2,2,2);
copyobj(hp,hs); hold on;
axis(ax)
view(v1);
hh=subplot(2,2,3);
copyobj(hp,hh); hold on;
axis(ax)
view(v2);
ho=subplot(2,2,4);
copyobj(hp,ho); hold on;
axis(ax)
view(v3);

%% Draw all the points given by the transformation matrices for the left leg
X_i = zeros(1,size_leg_L);
Y_i = zeros(1,size_leg_L);
Z_i = zeros(1,size_leg_L);
for i = 1:size_leg_L
    % extract the position of the i-th joint
    X_i(i) = chain_leg_L(1,4,i);
    Y_i(i) = chain_leg_L(2,4,i);
    Z_i(i) = chain_leg_L(3,4,i);
end
torso_X(2) = chain_leg_L(1,4,1);
torso_Y(2) = chain_leg_L(2,4,1);
torso_Z(2) = chain_leg_L(3,4,1);

subplot(2,2,1);
hp=plot3(X_i, Y_i, Z_i); hold on;
hs=subplot(2,2,2);
copyobj(hp,hs); hold on;
view(v1);
hh=subplot(2,2,3);
copyobj(hp,hh); hold on;
view(v2);
ho=subplot(2,2,4);
copyobj(hp,ho); hold on;
view(v3);

%% Draw all the points given by the transformation matrices for the right arm
X_i = zeros(1,size_arm_R);
Y_i = zeros(1,size_arm_R);
Z_i = zeros(1,size_arm_R);
for i = 1:size_arm_R
    % extract the position of the i-th joint
    X_i(i) = chain_arm_R(1,4,i);
    Y_i(i) = chain_arm_R(2,4,i);
    Z_i(i) = chain_arm_R(3,4,i);
end
torso_X(4) = chain_arm_R(1,4,1);
torso_Y(4) = chain_arm_R(2,4,1);
torso_Z(4) = chain_arm_R(3,4,1);

subplot(2,2,1);
hp=plot3(X_i, Y_i, Z_i); hold on;
hs=subplot(2,2,2);
copyobj(hp,hs); hold on;
view(v1);
hh=subplot(2,2,3);
copyobj(hp,hh); hold on;
view(v2);
ho=subplot(2,2,4);
copyobj(hp,ho); hold on;
view(v3);

%% Draw all the points given by the transformation matrices for the left arm
X_i = zeros(1,size_arm_L);
Y_i = zeros(1,size_arm_L);
Z_i = zeros(1,size_arm_L);
for i = 1:size_arm_L
    % extract the position of the i-th joint
    X_i(i) = chain_arm_L(1,4,i);
    Y_i(i) = chain_arm_L(2,4,i);
    Z_i(i) = chain_arm_L(3,4,i);
end
torso_X(3) = chain_arm_L(1,4,1);
torso_Y(3) = chain_arm_L(2,4,1);
torso_Z(3) = chain_arm_L(3,4,1);

torso_X(5) = chain_leg_R(1,4,1);
torso_Y(5) = chain_leg_R(2,4,1);
torso_Z(5) = chain_leg_R(3,4,1);

subplot(2,2,1);
hp=plot3(X_i, Y_i, Z_i); hold on;
hs=subplot(2,2,2);
copyobj(hp,hs); hold on;
view(v1);
hh=subplot(2,2,3);
copyobj(hp,hh); hold on;
view(v2);
ho=subplot(2,2,4);
copyobj(hp,ho); hold on;
view(v3);

%% Draw all the points given by the transformation matrices for the head
X_i = zeros(1,size_head);
Y_i = zeros(1,size_head);
Z_i = zeros(1,size_head);
for i = 1:size_head
    % extract the position of the i-th joint
    X_i(i) = chain_head(1,4*i);
    Y_i(i) = chain_head(2,4*i);
    Z_i(i) = chain_head(3,4*i);
end
subplot(2,2,1);
hp=plot3(X_i, Y_i, Z_i); hold on;
hs=subplot(2,2,2);
copyobj(hp,hs); hold on;
view(v1);

%% Draw the torso

subplot(2,2,1);
hp=plot3(torso_X, torso_Y, torso_Z); hold on;
hs=subplot(2,2,2);
copyobj(hp,hs); hold on;
view(v1);
hh=subplot(2,2,3);
copyobj(hp,hh); hold on;
view(v2);
ho=subplot(2,2,4);
copyobj(hp,ho); hold on;
view(v3);

%% Draw the foot using the force sensors as vertices
T_leg_R = chain_leg_R(:,:,end);
T_leg_L = chain_leg_L(:,:,end);

P_Si = get_sensors_position(T_leg_R, T_leg_L);
foot_R_X = zeros(1,5);
foot_R_Y = zeros(1,5);
foot_R_Z = zeros(1,5);

foot_R_X(1,1:4) = P_Si(1,1,:);
foot_R_Y(1,1:4) = P_Si(2,1,:);
foot_R_Z(1,1:4) = P_Si(3,1,:);
foot_R_X(5) = foot_R_X(1);
foot_R_Y(5) = foot_R_Y(1);
foot_R_Z(5) = foot_R_Z(1);

foot_L_X = zeros(1,5);
foot_L_Y = zeros(1,5);
foot_L_Z = zeros(1,5);

foot_L_X(1,1:4) = P_Si(1,2,:);
foot_L_Y(1,1:4) = P_Si(2,2,:);
foot_L_Z(1,1:4) = P_Si(3,2,:);
foot_L_X(5) = foot_L_X(1);
foot_L_Y(5) = foot_L_Y(1);
foot_L_Z(5) = foot_L_Z(1);

subplot(2,2,1);
hp=plot3(foot_R_X, foot_R_Y, foot_R_Z); hold on;
hs=subplot(2,2,2);
copyobj(hp,hs); hold on;
view(v1);
hh=subplot(2,2,3);
copyobj(hp,hh); hold on;
view(v2);
ho=subplot(2,2,4);
copyobj(hp,ho); hold on;
view(v3);

subplot(2,2,1);
hp=plot3(foot_L_X, foot_L_Y, foot_L_Z); hold on;
hs=subplot(2,2,2);
copyobj(hp,hs); hold on;
view(v1);
hh=subplot(2,2,3);
copyobj(hp,hh); hold on;
view(v2);
ho=subplot(2,2,4);
copyobj(hp,ho); hold on;
view(v3);

subplot(2,2,1);
hp=plot3(P_COG(1),P_COG(2),P_COG(3),'*r'); hold on;
grid on;
hs=subplot(2,2,2);
copyobj(hp,hs); hold on;
view(v1);
grid on;
hh=subplot(2,2,3);
copyobj(hp,hh); hold on;
view(v2);
grid on;
ho=subplot(2,2,4);
copyobj(hp,ho); hold on;
view(v3);
grid on;
frame=getframe(fig_frame);
%% Pause the animation
pause(steptime/2);
end

