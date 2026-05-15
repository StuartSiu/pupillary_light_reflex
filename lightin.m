function l=lightin(R)

L=1; % light source
Rl=5; % position of the light
n=100; % inversely propotional to the area of light spot

%     if R>Rl
%         l=L;
%     elseif R<=Rl
%         l=0;
%     end

% l=L*R^n/(R^n+Rl^n);

% l=L*(tanh(n*(R-Rl))+1)/2;


rb=0.1;
b=0;

if R<=Rl-rb
    A=0;
else if R>=Rl+rb
        A=pi()*rb^2;
    else
        x=(R^2+Rl^2-rb^2)/(2*Rl);
        a1=R^2*(asin(R/R)+0.5*sin(2*asin(R/R))-asin(x/R)-0.5*sin(2*asin(x/R)));
        a2=rb^2*(asin((x-Rl)/rb)+0.5*sin(2*asin((x-Rl)/rb))-asin(-rb/rb)-0.5*sin(2*asin(-rb/rb)));
        A=a1+a2;
    end
end

l=L*A/(pi()*rb^2)+b;

end

