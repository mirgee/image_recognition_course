function zobrTridy (CS, D)
N = size(D,1);
for i = 1:N
    for j = i+1:N
        if D(i,j)
            CS(CS==j) = i;
        end
    end
end
figure;
image(CS+1);
colormap([0,0,0; hsv(N)]);