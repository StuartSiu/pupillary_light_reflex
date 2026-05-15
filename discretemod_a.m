clear

%%
T=10;
n=10001; % number of time steps within t = 0 to T
t=linspace(0,T,n); % all time steps
dt=T/(n-1);
a=0.001;
R0=8;   % intial radius
% Rl=5; % position where the light shooting at
ls=0.5; % the suitable light intensity

% R=@(t) (R0-Rl)*exp(-t/Rl)+Rl; % solution for no delays
R=zeros(n,1);
R(1)=R0;
dR=zeros(n-1,1);
d=0.001; % delayed time, always choose dt that divides d
k=d/dt; % number of time steps delayed
for i=1:k
    R(i+1)=R(1); % no reflexes yet
end
for i=k+1:n-1
    dR(i)=dR(i-1)+dt*a*(1-(lightin(R(i-k))/ls));
    R(i+1)=R(i)+dR(i); %   dR = a*(1-l/ls) 
                                          %   but signal for dR is delayed
end

% Plot l(t) vs R(t)
figure(1); clf;
for i=1:n
    plot(R(i),lightin(R(i)),'b.');
    hold on;
end
title('Light received corresponding to different radii of iris')
xlabel('radius of iris')
ylabel('light received')

% Plot R vs t
figure(2); clf;
plot(t(1:n),R(1:n),'r.-');
title('Radius of iris over time')
xlabel('time')
ylabel('radius of iris')

% Plot l vs R original curve
figure(3); clf;
for i=1:n
    plot(t(i),lightin(t(i)),'b.');
    hold on;
end
title('Light received corresponding to different radii of iris')
xlabel('radius of iris')
ylabel('light received')

figure(4); clf;
plot(t(1:n-1),dR(1:n-1),'r.-');
title('Radius of iris over time')
xlabel('time')
ylabel('radius of iris')