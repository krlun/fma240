NStart = 4;
NEnd = 10;
distanceLimit = 200;
nrOfSamples = 20;
time = [];
startLoop = tic;
for i = NStart:NEnd
    sample = 0;
    parfor j = 1:nrOfSamples
        startIteration = tic;
        D = createdistancematrix(i, distanceLimit);
        [x,fopt] = travsalesman(D);
        endIteration = toc(startIteration);
        sample = sample + endIteration;
    end
    time = [time sample/nrOfSamples];
end
endLoop = toc(startLoop)
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