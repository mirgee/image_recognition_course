function I = zobr(I, SubP)

if nargin < 2
    figure;
else
    subplot(SubP)
end

colormap(gray);
imagesc(I);
axis image;