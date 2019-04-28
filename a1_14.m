clear;
p = [1.655, 1.069, 0.724, 0.5, 0.396, 0.317, 0.245, 0.193, 0.103]';
V = [114.71, 163.87, 245.81, 327.74, 409.68, 491.61, 573.55, 655.48, 704.64]';
plot(V, p, 'o')
xlabel('V / cm^{3}');
ylabel('p / MPa');
W_t = trapz(V, p);
for i = 1:8
    xverts = [V(i); V(i+1); V(i+1); V(i)];
    yverts = [0; 0; p(i+1); p(i)];
    patch(xverts, yverts, 'y');
end
pp = polyfit(V, p, 3);
table(V, p, polyval(pp, V), p-polyval(pp, V))
fprintf('Sum of regression error is %.3f.\n', sum(abs(p-polyval(pp, V))))
x = linspace(min(V), max(V));
y = polyval(pp, x);
hold on;
plot(x, y)
hold off;
W_r = trapz(x, y);
fprintf('W_t = %.2f (J); W_r = %.2f (J)\n', W_t, W_r) 