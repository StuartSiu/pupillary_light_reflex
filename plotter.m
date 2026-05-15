radius=linspace(2,8,1000);
figure; clf;
for i=3:1000
    plot(radius(i),log(lightin(radius(i))),'b.');
    hold on;
end
title('Light received corresponding to different radii of iris')
xlabel('radius of iris')
ylabel('light received')