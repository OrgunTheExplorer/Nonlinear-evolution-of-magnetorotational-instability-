syms Kr Kz V p w k R real
syms Omega(R)

% Define the polynomial terms (as symbolic)
w1 = [
    (((Kr^2)/p) + (2*(V^2)*(Kz^2)))/((Kr^2)+(Kz^2)), 
    0, 
    -(((k^2)*(Kz^2))/((Kr^2)+(Kz^2))) + (2*(V^2)*(Kz^2)), 
    0, 
    (((V^4)*(Kz^6)) + ((Kr^2)*(Kz^4)*(V^4)) - (2*(Omega(R))*(V^2)*(Kz^2)*diff(Omega,R)))/((Kr^2)+(Kz^2))
];

w2 = [
    1, 
    0, 
    -(((k^2)*(Kz^2))/((Kr^2)+(Kz^2))) + (2*(V^2)*(Kz^2)), 
    0, 
    ((V^4)*(Kz^4)) + (((k^2)*(Kz^4)*(V^2)) - (4*(Omega(R)^2)*(V^2)*(Kz^2))/((Kr^2)+(Kz^2)))
];


% Calculate roots
root_w = simplify(roots(w2));

% Convert to LaTeX strings
eq_latex = arrayfun(@latex, root_w, 'UniformOutput', false);

figure('Color', 'w');
axis off

% Initial position for first equation
ypos = 0.9;  % start high on the figure
gap = 0.15;  % vertical spacing between roots

for i = 1:length(eq_latex)
    annotation('textbox', [0.05 ypos 0.9 0.1], ...
        'String', ['$' eq_latex{i} '$'], ...
        'Interpreter', 'latex', ...
        'FontSize', 12, ...
        'EdgeColor', 'none', ...
        'FitBoxToText', 'on', ...
        'VerticalAlignment', 'top');
    ypos = ypos - gap;  % move downward
end




