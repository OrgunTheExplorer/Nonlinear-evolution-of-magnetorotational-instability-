syms Kr Kz Bo Bz p w k R Z real
syms Omega(R)          
syms P(R,Z)            
i = sym('1i');        


a = [Kr, 0, Kz, 0, 0, 0, 0;
    (-i*w), -2*Omega, 0, (i*Kr)/(p), (-i*Kz*Bz)/(4*pi*p), (i*Kr*Bo)/(4*pi*p), (i*Kr*Bz)/(4*pi*p);
    (diff(Omega*R^2,R)/R), (-i*w), 0, 0, 0, (-i*Kz*Bz)/(4*pi*p), 0;
    0, 0, (-i*w), (i*Kz)/(p), 0, (i*Kz*Bo)/(4*pi*p), 0;
    (-i*Kz*Bz), 0, 0, 0, (-i*w), 0, 0;
    0, 0, (-i*Kz*Bz), 0, 0, 0, (-i*w);
    0, (-i*Kz*Bz), 0, 0, -R*diff(Omega,R), (-i*w), 0]; 

det_a = simplify(det(a));

figure;

eq = { latex(det_a) };  

eq_full = strjoin(eq, '');

annotation('textbox',[0 0 1 1], ...
    'String',['$' eq_full '$'], ...
    'Interpreter','latex', ...
    'FontSize',14, ...
    'EdgeColor','none');

axis off
