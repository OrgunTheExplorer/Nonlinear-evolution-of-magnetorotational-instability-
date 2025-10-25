syms Kr Kz Bo Bz p w k R Z V real
syms Omega(R) real         
syms P(R,Z)            
i = sym('1i');        


a = [Kr, 0, Kz, 0, 0, 0, 0;
    (-i*w), -2*Omega(R), 0, (i*Kr)/(p), (-i*Kz*Bz)/(4*pi*p), (i*Kr*Bo)/(4*pi*p), (i*Kr*Bz)/(4*pi*p);
    (diff(Omega(R)*R^2,R)/R), (-i*w), 0, 0, 0, (-i*Kz*Bz)/(4*pi*p), 0;
    0, 0, (-i*w), (i*Kz)/(p), 0, (i*Kz*Bo)/(4*pi*p), 0;
    (-i*Kz*Bz), 0, 0, 0, (-i*w), 0, 0;
    0, 0, (-i*Kz*Bz), 0, 0, 0, (-i*w);
    0, (-i*Kz*Bz), 0, 0, -R*diff(Omega(R),R), (-i*w), 0]; 



w2 = [
    1, 
    0, 
    -(((4*(Omega(R)^2)*(Kz^2))/((Kr^2)+(Kz^2)))+(2*Kz^2)*(((Omega(R)*R*diff(Omega(R),R))/((Kr^2)+(Kz^2)))+(V^2))), 
    0, 
    ((V^2)*(Kz^4))*(((2*Omega(R)*R*diff(Omega(R),R))/((Kr^2)+(Kz^2)))+(V^2))
];


det_a = simplify(det(a));
det_a = subs(det_a, (Bz^2), V*(4*pi*p));
root_w1 = simplify(solve(det_a == 0, w, 'MaxDegree', 4));
root_w1 = simplify(root_w1);




root_w2 = simplify(roots(w2));
root_w2 = simplify(root_w2);

  


% https://www.mathworks.com/help/matlab/ref/arrayfun.html
eq_latex = arrayfun(@latex, root_w1, 'UniformOutput', false);

figure('Color', 'k');
axis off


ypos = 0.9; 
gap = 0.15;  

for i = 1:length(eq_latex)
    annotation('textbox', [0.05 ypos 0.9 0.1], ...
        'String', ['$' eq_latex{i} '$'], ...
        'Interpreter', 'latex', ...
        'FontSize', 12, ...
        'EdgeColor', 'none', ...
        'FitBoxToText', 'on', ...
        'VerticalAlignment', 'top');
    ypos = ypos - gap;  
end
