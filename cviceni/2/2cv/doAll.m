
L = 256

f = discnorm(imread(saturn),L)

t1 = 20
t2 = 110

g = bantreshold(f, t1, t2)

hist(f(:), L)
title('histogram: prah = ' num2str(t1) '-' num2str(t2))

zobr(f)
