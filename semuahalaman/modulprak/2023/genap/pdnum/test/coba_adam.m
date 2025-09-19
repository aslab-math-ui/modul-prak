f = @(t, y) (y - t ^ 2 + 1);
a = 0;
b = 2;
alpha = 0.5;
n=20
[t1, w1] = adams2(f,a,b,n,alpha)

[t1,w1]

sln = @(t) (t + 1) ^ 2 - 0.5 * exp(t);

fplot(sln, [0, 2], 'k');
hold on;
scatter(t1, w1, 'r');
