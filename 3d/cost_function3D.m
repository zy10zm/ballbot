function J = cost_function3D(X,alp,bet,gam,g,rw,Dc,Dv,thetadf)

% COST_FUNCTION returns cost function for Ballbot 
% as defined in Eqn. 17 in Nagarajan et al. 2014
% input X assumed to [phi_p^a1,phi_p^a2,T]

[~,~,~,times,THETA,tau] = get_trajs3D(X,alp,bet,gam,g,rw,Dc,Dv);

run('cost_function_weights.m');

J = sum(w1*(THETA(end,1:2)-thetadf).^2 + w2*THETA(end,3:4).^2 + 0.5*w3*X(5)^4 ...
    + w4*sum((tau(1:end-1,:).^2).*(times(2:end)-times(1:end-1))));
end