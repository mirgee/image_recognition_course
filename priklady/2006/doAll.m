% Pro kazdy pixel, konvolvovat s laplacem a 

IN = {}
for i=4446:4498
  uri = sprintf('Vstup/IMG_%d.JPG', i);
  IN{i-4445} = imread(uri);
end

%operators
OSize=11;
Gauss  =zeros(OSize,OSize);
Laplace=zeros(OSize,OSize);
Mid=ceil(OSize/2);
c=1;

%build laplace and gauss (instead of using inbuilt 'fspecial')
for i=1:OSize
    for j=1:OSize
        x=i-Mid;
        y=j-Mid;
        Laplace(i,j)=(-1/pi/c/c/c/c)*(1-(x*x+y*y)/2/c/c)*exp(-(x*x+y*y)/2/c/c);
        Gauss(i,j) = exp(-(((x*x)/2/c/c+(y*y)/2/c/c)));
    end
end

%edge detect all images
for i=1:4498-4446+1    
    Temp = conv2(double(IN{i}(:,:,1))+double(IN{i}(:,:,2))+double(IN{i}(:,:,3)),Gauss,'same');
    ImgArrBW{i} = conv2(Temp,Laplace,'same');
    B = size(ImgArrBW{i});
    ImgArrBW{i} = abs(ImgArrBW{i});
    imshow(ImgArrBW{i})
end

%order stack
SizeS = size(ImgArrBW{i});
Stack = ones(SizeS);
StackVal = zeros(SizeS);
for i=1:NoImage
    for j=1:SizeS(1)
        for k=1:SizeS(2)
            if (ImgArrBW{i}(j,k)>StackVal(j,k))
                StackVal(j,k)=ImgArrBW{i}(j,k);
                Stack(j,k)=i;
            end
        end 
    end 
end

%Combine Stack into sharp image
SharpImg=ImgArr{1};
SizeI=size(ImgArr{1});
for j=1:SizeI(1)
    for k=1:SizeI(2)
        Index=uint16(Stack(j,k));
        if (Index<1)
            Index=1;
        end
        if (Index>NoImage)
            Index=NoImage;
        end
        SharpImg(j,k,:)=ImgArr{Index}(j,k,:);
    end
end

imshow(SharpImg);