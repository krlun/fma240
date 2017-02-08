NStart = 4;
NEnd = 20;
distanceLimit = 200;
time = [];
for i = NStart:NEnd
    tic
    D = createDistanceMatrix(i, distanceLimit);
    [x,fopt] = travsalesman(D)
    time = [time toc];
end
subplot(2, 1, 1);
plot(NStart:NEnd, time);
xlabel('# of cities');
ylabel('Execution time/s');
grid on;
subplot(2, 1, 2);
plot(NStart:NEnd, log(time));
xlabel('# of cities');
ylabel('log(Execution time/s)');
grid on;