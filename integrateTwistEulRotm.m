function qout= integrateTwistEulRotm(xi,R)
global dt

%transform into quaternions
if mean(mean(abs(R-eye(3,3))))<.00001
        R=eye(3,3);
end
q1=rotm2quat(R);
gamma=xi(3:-1:1)*dt; %integrate of angular velocities without constant
q2=eul2quat(gamma');
% to the original rotation add the rotation from the integration of angular
% velocites
qout=quatmultiply(q1,q2);