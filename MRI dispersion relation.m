syms Kr Kz Bo Bz p w R k q Z V x real
syms Omega(R) real         
syms P(R,Z)            
i = sym('1i');


%Keplerian Value


q=-3/2


w2 = [
    1, 
    -(((4*(Omega(R)^2)*(Kz^2))/((Kr^2)+(Kz^2)))+(2*Kz^2)*(((q*Omega(R)^2)/((Kr^2)+(Kz^2)))+(V^2))),  
    ((V^2)*(Kz^4))*(((2*q*Omega(R)^2)/((Kr^2)+(Kz^2)))+(V^2))
];


root_w2 = simplify(roots(w2));
root_w2 = simplify((root_w2)/(Omega(R)^2));
root_w2 = simplify(subs(root_w2, Kz^2, (k^2)-(Kr^2)));
root_w2 = simplify(subs(root_w2, k, x*Omega(R)/V));
root_w2 = simplify(subs(root_w2, Kr^2, 2*q*(Omega(R)^2)/(V^2)));
root_w2 = simplify(subs(root_w2, Omega(R), 1));




% https://www.mathworks.com/help/matlab/ref/arrayfun.html
eq_latex = arrayfun(@latex, root_w2, 'UniformOutput', false);

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
