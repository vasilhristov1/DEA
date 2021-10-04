function tema37
clc
L=1/2;
a=1/sqrt(pi);
T=19;
h=L/30;
tau=T/760;
x=0:h:L;
t=0:tau:T;
c=(tau*a)/h;
 
function y=phi(x)
y=0*x;
end
 
 function y=psi(x)
 y=0*x;
 end
 
function y=ni(t)
y=0*t;
end
 
 function y=mu(t)
 y=sin(t/4)^3;
 end
 
 function y= f(x,t)
 y=sin(pi*x)+0*t;
 end
 
for j=1:length(t)
 for i=1:length(x)
 if i>1 && i<length(x)
 if j==1
 u(i,j)=phi(x(i));
 elseif j==2
 u(i,j)=phi(x(i))+c^2/2*(phi(x(i+1))-2*phi(x(i))+phi(x(i-1)))+tau^2/2*f(x(i),t(j-1))+tau*psi(x(i));
 else
 u(i,j)=2*(1-c^2)*u(i,j-1)+c^2*(u(i+1,j-1)+u(i-1,j))-u(i,j-2)+tau^2*f(x(i),t(j-1));
 end
 elseif i==1
 u(i,j)=mu(t(j));
 else u(i,j)=ni(t(j));
 end
 end
end
 
for k = 1:T
 clf;
 hold on;
 y=u(:,k);
 plot(x,y,'LineWidth',2,'Color','r');
 plot(L,y(end),'ko','MarkerFaceColor',[0 0 0]);
 plot(0,y(1),'ko','MarkerFaceColor',[0 0 0]);
 grid on;
 title('String Vibration')
 axis([0 L -5 50]);
 xlabel('x');
 ylabel('u(x,t)');
 getframe;
end
 
clf
subplot(4,1,1)
plot(x,u(:,1),'r','LineWidth',2)
axis([0 L -6 6]);
subplot(4,1,2)
plot(x,u(:,9),'r','LineWidth',2)
axis([0 L -6 6]);
subplot(4,1,3)
plot(x,u(:,19),'r','LineWidth',2)
axis([0 L -6 6]);
 
M = T;
subplot(4,1,4)
for m=1:M
   
   plot(x,u(:,m), 'b', 'LineWidth', 2)
   axis([0,0.5,-5,5])
   MM(m) = getframe;
end
movie(MM,3,-20)
end
