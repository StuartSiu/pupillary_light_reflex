clear

%%
T=100;
n=10001; % number of time steps within t = 0 to T
t=linspace(0,T,n); % all time steps
dt=T/(n-1);
a=0.2;    % speed modifier
R0=7;   % intial radius
% Rl=5; % position where the light shooting at
ls=0.5; % the suitable light intensity

% R=@(t) (R0-Rl)*exp(-t/Rl)+Rl; % solution for no delays
R=zeros(n,1);
R(1)=R0;
dR=zeros(n-1,1);
d=0.8; % delayed time, always choose dt that divides d
k=d/dt; % number of time steps delayed
for i=1:k
    R(i+1)=R(1); % no reflexes yet
end
for i=k+1:n-1
    dR(i)=a*(1-(lightin(R(i-k))/ls));
    R(i+1)=R(i)+dt*dR(i); %   dR = a*(1-l/ls) 
                                          %   but signal for dR is delayed
end

% Plot l vs R original curve (set-up)
figure(1); clf;
radius=linspace(0,10,1000);
for i=1:1000
    plot(radius(i),lightin(radius(i)),'b.');
    hold on;
end
title('Light received corresponding to different radii of iris')
xlabel('radius of iris')
ylabel('light received')

% Plot l vs R according to t (distribution)
figure(2); clf;
for i=1+k*95:2:n
    plot(R(i),lightin(R(i)),'b.');
    hold on;
end
title('Light received corresponding to different radii of iris')
xlabel('radius of iris')
ylabel('light received')

% Plot R over t (numerical solution)
figure(3); clf;
plot(t(1:n),R(1:n),'r.-');
title('Radius of iris over time')
xlabel('time')
ylabel('radius of iris')

% Plot R'over t (numerical solution)
figure(4); clf;
plot(t(1:n-1),dR(1:n-1),'r.-');
title('Radius change over time')
xlabel('time')
ylabel('dR/dt')

% Plot R'vs R (phase potrait)
figure(5); clf;
for i=k+1:n-1
    plot(R(i),dR(i),'color',[0 (1-i/(n-1))^50 0],'Marker','*');
    hold on;
end
title('Radius change vs Radius over time (From green to dark)')
xlabel('R')
ylabel('dR/dt')