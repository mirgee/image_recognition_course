function laplace(N, c)

L=zeros(N);
Mid=ceil(N/2);
c=1;

%build laplace and gauss (instead of using inbuilt 'fspecial')
for i=1:N
    for j=1:N
        x=i-Mid;
        y=j-Mid;
        L(i,j)=(-1/pi/c/c/c/c)*(1-(x*x+y*y)/2/c/c)*exp(-(x*x+y*y)/2/c/c);
    end
end



end