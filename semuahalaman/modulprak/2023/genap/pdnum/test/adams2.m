function [t, w] = adams2(f, a, b, n, alpha)
  % Inisiasi variabel awal
  h = (b - a) / n;
  t = zeros(n + 1, 1);
  w = zeros(n + 1, 1);
  t(1) = a;
  w(1) = alpha;

  % Mencari t(2) dan w(2) menggunakan Runge-Kutta orde 4
  i = 1;
  t(i + 1) = t(i) + h;
  m1 = h * f(t(i), w(i));
  m2 = h * f(t(i) + (h/2), w(i) + (m1/2));
  m3 = h * f(t(i) + (h/2), w(i) + (m2/2));
  m4 = h * f(t(i + 1), w(i) + m3);
  w(i+1) = w(i) + (m1 + 2*m2 + 2*m3 + m4) / 6;

  % Algoritma utama Adams-Bashforth
  for i = 2:n
    t(i + 1) = t(i) + h;
    k1 = f(t(i), w(i));
    k2 = f(t(i-1), w(i-1));
    w(i+1) = w(i) + (h/2) * (3*k1 - k2);
  endfor
endfunction
