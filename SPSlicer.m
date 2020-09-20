%Replace the filename with your filename, make sure it is in the same directory you are in
%As of now the code can only Handle simplified models with limited no. of
%vertices, Further versions might have more accessibility settings such as changing axis and complex model design. 
%We are using the default stlread function available in the MATLAB Library
%since Version R2018b, please make sure you are this version or above. 
[FV]=stlread('CYLSIMPLE.stl');
%Calculating the maximum and minimum values of the Z plane vertice
%co-ordinates. 
% Here we are slicing along the Z-Axis.
maxz=max(FV(:,3))
minz=min(FV(:,3))
%This total height is displayed for user purposes only, so that they can
%make appropriate decisions regarding slicing height.
disp('Total height of the model, enter slicing height accordingly');
th=abs(maxz)+abs(minz)
h=input('Enter the layer slicing height')
m=minz
%All of the following variables are for storing the X and Y vertices of the
%intersections obtained with Slicing plane
xpvi=1;
xpvj=1;
ypvi=1;
ypvj=1;
X=[];
Y=[];
pos=1;
le=size(FV,1);
%The main slicing code, it is still very rough and not very efficient, but
%provides accurate data.
while m<=maxz
    i=1;
    for i= 1:3:le
     if FV(i,3)==FV(i+1,3) || FV(i,3)==FV(i+2,3) || FV(i+1,3)==FV(i+2,3)
        for j=i:i+2
            X(xpvi,xpvj)=FV(j,1);
            xpvi=xpvi+1;
            Y(ypvi,ypvj)=FV(j,2);
            ypvi=ypvi+1;
        end
     else
        if  (m>=FV(i,3)&&m<=FV(i+1,3))||(m<=FV(i,3)&&m>=FV(i+1,3))
            X(xpvi,xpvj)=(((m-FV(i,3))*(FV(i+1,1)-FV(i,1)))/(FV(i+1,3)-FV(i,3)))+FV(i,1);
            Y(ypvi,ypvj)=(((m-FV(i,3))*(FV(i+1,2)-FV(i,2)))/(FV(i+1,3)-FV(i,3)))+FV(i,2);
            xpvi=xpvi+1;
            ypvi=ypvi+1;
        end
        if (m>=FV(i,3)&&m<=FV(i+2,3))||(m<=FV(i,3)&&m>=FV(i+2,3))
            X(xpvi,xpvj)=(((m-FV(i,3))*(FV(i+2,1)-FV(i,1)))/(FV(i+2,3)-FV(i,3)))+FV(i,1);
            Y(ypvi,ypvj)=(((m-FV(i,3))*(FV(i+2,2)-FV(i,2)))/(FV(i+2,3)-FV(i,3)))+FV(i,2);
            xpvi=xpvi+1;
            ypvi=ypvi+1;
        end
         if (m>=FV(i+1,3)&&m<=FV(i+2,3))||(m<=FV(i+1,3)&&m>=FV(i+2,3))
            X(xpvi,xpvj)=(((m-FV(i+1,3))*(FV(i+2,1)-FV(i+1,1)))/(FV(i+2,3)-FV(i+1,3)))+FV(i+1,1);
            Y(ypvi,ypvj)=(((m-FV(i+1,3))*(FV(i+2,2)-FV(i+1,2)))/(FV(i+2,3)-FV(i+1,3)))+FV(i+1,2);
            xpvi=xpvi+1;
            ypvi=ypvi+1;
         end   
   end
   
    end
    xpvi=1;
    ypvi=1;
    xpvj=xpvj+1;
    ypvj=ypvj+1;
    m=m+h;
end
    %DIsplaying the cross section on the second slicing plane, adjust as
    %you want or use loop, although it may affect processing speed.
    A=X(:,2);
    B=Y(:,2);
    TR= delaunay(A,B);
     triplot(TR,A,B);
     %Displaying the X and Y co-ordinates of the Points obtained by
     %intersection of slicing plane and model
     %Size of the matrix X and Y will be no. of elements*no. of slicing planes 
     %disp(X);
     %disp(Y);
    %The further code is just for displaying the 3D object as taken input
    %from STL File.
    %TR1=delaunayTriangulation(FV);
    %tetramesh(TR1);
    
    
       
        