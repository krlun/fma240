startingSize = 10;
stepSize = 10;
stopSize = 200;

s = [startingSize:stepSize:stopSize];
exeTimes = [];
exeCount = [];
for i = s
    m = i;
    n = i;
    init;
    [tableau, x, basic, feasible, optimal, time, count] = simp(A, b, c, basicvars);
    exeTimes = [exeTimes time];
    exeCount = [exeCount count];
end
subplot(2, 1, 1)
plot(s, exeTimes)
grid on;
xlabel('size'); ylabel('time/s');
title('Execution time of the simplex algorithm vs size of A matrix');
subplot(2, 1, 2)
plot(s, log(exeTimes))
grid on;
xlabel('size'); ylabel('log(time/s)');
title('Log of execution time of the simplex algorithm vs size of A matrix');

figure;
subplot(2, 1, 1)
plot(s, exeCount)
grid on;
xlabel('size'); ylabel('# of iterations');
title('# of iterations of the simplex algorithm vs size of A matrix');
subplot(2, 1, 2)
plot(s, log(exeCount))
grid on;
xlabel('size'); ylabel('log(time/s)');
title('Log of # of iterations of the simplex algorithm vs size of A matrix');
