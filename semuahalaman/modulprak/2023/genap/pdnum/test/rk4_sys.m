function [t,w] = rk4_sys(f, a, b, n, y0)
  %f :differential equation y_p = f(t,y)
  %a :initial time
  %b :final time
  %n :number of steps
  %y0 :initial value

  h=(b-a)/n;
  t=[a:h:b];
  s= length(y0);
  w=zeros(s,n+1);
  w(:,1)=y0;

  for i=1:n
    k1=f(t(i),w(:,i));
    k2=f(t(i)+h/2,w(:,i)+h*k1/2);
    k3=f(t(i)+h/2,w(:,i)+h*k2/2);
    k4=f(t(i)+h,w(:,i)+h*k3);
    w(:,i+1)=w(:,i)+h*(k1+2*k2+2*k3+k4)/6;
   endfor

endfunction
