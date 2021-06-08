%calculate the quaternion error in term of angle
%input 4x1 true quaternion and measured quaternion with q(1) being scalar
%output angular vector in degree

function [ error_angle ] = QuatError(q_true, q_est)

q_est_T = [q_est(:,1) -q_est(:,2) -q_est(:,3) -q_est(:,4)]; % quaternion transpose

q_error = quatmultiply(q_true,q_est_T); % computing error quaternion

%normalizing
for i = 1:length(q_error)
    q_error(i,:) = q_error(i,:)./norm(q_error(i,:));
end

error_angle = [2*asind(q_error(:,2)) 2*asind(q_error(:,3)) 2*asind(q_error(:,4))];
end

