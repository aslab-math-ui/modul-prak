f=@(t, I) [-4 * I(1)+ 3 * I(2)+6 ; -2.4*I(1) + 1.6 * I(2)+3.6] % fungsi
% perhatikan bahwa  I addalah vektor (hence ada I(1) dan I(2))
y0=[0;0] % nilai awal
a=0 % titik awal
b=1 % titik akhir
n=10 % banyaknya partisi.

[t_sys, w_sys] = rk4_sys(f,a,b,n,y0)

transpose([t_sys ; w_sys]) %rapikan format
