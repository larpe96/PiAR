function [g_mat] = g_func(x0, xdata) 
%     syms mu_s mu_c v0 nabla F_n v F_fric
% 
%     E = mu_c + (mu_s - mu_c)*exp(-(v/v0)^2) + nabla*(v/F_n) - F_fric/F_n;
%     jac = jacobian(E, [mu_s, mu_c, v0, nabla]);
%     % x0 = [mu_s, mu_c, v0, nabla]
%     % xdata = [F_n v F_fric]
%     g_mat = zeros(length(xdata),1);
%     for i =1:length(xdata)
%         g_mat(i) = subs(E, [mu_s mu_c v0 nabla F_n v F_fric], [x0(1), x0(2), x0(3), x0(4),xdata(i,1),xdata(i,2),xdata(i,3)]);
%     end
    
    g_mat = zeros(length(xdata),1);
    for i =1:length(xdata)
        g_mat(i) = [x0(2) + (x0(1) - x0(2))*exp(-(xdata(i,2)/x0(3))^2) + x0(4)*(xdata(i,2)/xdata(i,1)) - xdata(i,3)/xdata(i,1)];
    end
    
    
end