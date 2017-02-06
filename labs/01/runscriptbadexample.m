startingSize = 1;
stepSize = 1;
stopSize = 15;

s = [startingSize:stepSize:stopSize];
exeSteps = [];
for i = s
    d = i
    badexample;
    [y, basicvars, steps] = simpb(A, b, c, basicvars);
    exeSteps = [exeSteps steps];
end

figure;
subplot(2, 1, 1)
plot(s, exeSteps)
grid on;
xlabel('size'); ylabel('# of iterations');
title('# of iterations of the simplex algorithm vs d');
subplot(2, 1, 2)
plot(s, log(exeSteps))
grid on;
xlabel('size'); ylabel('log(time/s)');
title('Log of # of iterations of the simplex algorithm vs d');
