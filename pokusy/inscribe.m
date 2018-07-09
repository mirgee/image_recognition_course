clear; clc;
tic;
%% // read image
imrgb= imread('qolS0.png');
im = im2bw(rgb2gray(imrgb));    %// binarize image
im = 1-im;                      %// convert "empty" regions to 0 intensity
[rows,cols] = size(im);

%% // set up initial parameters
ULrow = 1;       %// upper-left row        (param #1)
ULcol = 1;       %// upper-left column     (param #2)
BRrow = rows;    %// bottom-right row      (param #3)
BRcol = cols;    %// bottom-right column   (param #4)

parameters = 1:4;   %// parameters left to be updated
pidx = 0;           %// index of parameter currently being updated

%% // shrink region until acceptable
while ~isempty(parameters); %// update until all parameters reach bounds

    %// 1. update parameter number
    pidx = pidx+1;
    pidx = mod( pidx-1, length(parameters) ) + 1;
    p = parameters(pidx);   %// current parameter number

    %// 2. update current parameter
    if p==1; ULrow = ULrow+1; end;
    if p==2; ULcol = ULcol+1; end;
    if p==3; BRrow = BRrow-1; end;
    if p==4; BRcol = BRcol-1; end;

    %// 3. grab newest part of region (row or column)
    if p==1; region = im(ULrow,ULcol:BRcol); end;
    if p==2; region = im(ULrow:BRrow,ULcol); end;
    if p==3; region = im(BRrow,ULcol:BRcol); end;
    if p==4; region = im(ULrow:BRrow,BRcol); end;

    %// 4. if the new region has only zeros, stop shrinking the current parameter
    if isempty(find(region,1))
        parameters(pidx) = [];
    end

end

toc;
params = [ULrow ULcol BRrow BRcol]
area = (BRrow-ULrow)*(BRcol-ULcol) 