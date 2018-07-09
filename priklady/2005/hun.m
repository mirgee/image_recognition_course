function f=hu(a)
%Computing Hu moment invariants with normalized moments
% a(n,n) - image matrix
 
 n=size(a,1);
 m00 =sum(sum(a));
 v=ones(1,n) ;
 w=v;
 for i =1:n ;
 w(i)=i ;
 end;  
ii=w'*v  ;
jj=ii'   ;
 tx=sum(sum(a.*jj))/m00; 
 ty=sum(sum(a.*ii))/m00;
 jj=jj-tx ;
 ii=ii-ty;
 q=2;
 m11=sum(sum(a.*jj.*ii))/m00^q;
 m02=sum(sum(a.*ii.*ii))/m00^q; 
 m20=sum(sum(a.*jj.*jj))/m00^q; 


 q=2.5;
 m12=sum(sum(a.*ii.*jj.*ii))/m00^q;
 m21=sum(sum(a.*jj.*jj.*ii))/m00^q;
 m30=sum(sum(a.*jj.*jj.*jj))/m00^q;
 m03=sum(sum(a.*ii.*ii.*ii))/m00^q;

f(1)=m20+m02;

f(2)=(m20-m02)^2 +4*m11^2;

f(3)=(m30-3*m12)^2 + (m03-3*m21)^2;


f(4)=(m30+m12)^2 + (m03+m21)^2;

f(5)=(m30-3*m12)*(m30+m12)*((m30+m12)^2-3*(m03+m21)^2);
f(5)=f(5)+(3*m21-m03)*(m03+m21)*(3*(m30+m12)^2-(m03+m21)^2);

f(6)=(m20-m02)*((m30+m12)^2-(m03+m21)^2);
f(6)=f(6)+4*m11*(m30+m12)*(m03+m21);

f(7)=(3*m21-m03)*(m30+m12)*((m30+m12)^2-3*(m03+m21)^2);
f(7)=f(7)+(3*m12-m30)*(m03+m21)*(3*(m30+m12)^2-(m03+m21)^2);

f(1);
f(2);
f(3);
f(4);
f(5);
f(6);
f(7);
