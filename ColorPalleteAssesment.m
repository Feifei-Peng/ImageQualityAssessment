function D=ColorPalleteAssesment(Path)
%% Image Histogram genration of the Negative Image
%This block of code reads all the negative image samples
%Each image pixel values is quantized into 16 levels and stored in the form of 3D mesh

%HNeg matrix in which all the Quantized Image are stored in form of 3D Mesh
HNeg=zeros([17,17,17,9]);
NegCount=1;
for N=1:9
    %Reading the Negative Image
strNeg=strcat('C:\Users\abhay\Desktop\Semproj\Nflowers\','images_00',int2str(N),'.jpeg');
In=imread(strNeg);
 for i=1:size(In,1)
    for j=1:size(In,2)
       %Each Pixel value in the image is quantized into 16 levels
       R=floor(In(i,j,1)/16)+1;
       G=floor(In(i,j,2)/16)+1;
       B=floor(In(i,j,3)/16)+1;
       %The value of Negative histogram are incremented 
       % using quantized value of RGB are used as the index
       HNeg(R,G,B,NegCount)=HNeg(R,G,B,NegCount)+1;
    end
 end
 NegCount=NegCount+1;
end
%% Image histogram genration of the Positive images
%This block of code reads all the Positive image samples
%Each image pixel values is quantized into 16 levels and stored in the form of 3D mesh

%HPos matrix in which all the Quantized Image are stored in form of 3D Mesh
HPos=zeros([17,17,17,9]);
PosCount=1;
for P=1:9
    %Reading the Negative Image
    strPos=strcat('C:\Users\abhay\Desktop\Semproj\Pflower\','images_0',int2str(P+9),'.jpeg');
    Ip=imread(strPos);
    for i=1:size(Ip,1)
        for j=1:size(Ip,2)
            %Each Pixel value in the image is quantized into 16 levels
             R=floor(Ip(i,j,1)/16)+1;
             G=floor(Ip(i,j,2)/16)+1;
             B=floor(Ip(i,j,3)/16)+1;
             %The value of Negative histogram are incremented 
             %using quantized value of RGB are used as the index
             HPos(R,G,B,PosCount)=HPos(R,G,B,PosCount)+1;
        end
    end
    PosCount=PosCount+1;
end
%% Image Historam of the Probe image
Hprob=zeros([17,17,17,1]);
Iprobe=imread(Path);
 for i=1:size(Iprobe,1)
        for j=1:size(Iprobe,2)
             R=floor(Iprobe(i,j,1)/16)+1;
             G=floor(Iprobe(i,j,2)/16)+1;
             B=floor(Iprobe(i,j,3)/16)+1;
             Hprob(R,G,B,1)=Hprob(R,G,B,1)+1;
        end
 end
%% Applying KNN to the Probe Image
 Htrain=zeros([4913,18]);
 for i=1:9
     Htemp=HPos(:,:,:,i);
     Htemp=Htemp(:);
     size(Htemp)
     Htrain(:,i)=Htemp;
 end
  for i=1:9
     Htemp=HNeg(:,:,:,i);
     Htemp=Htemp(:);
     size(Htemp)
     Htrain(:,i+9)=Htemp;
  end
 Htrain=transpose(Htrain);
 Hprob=Hprob(:);
 Hprob=transpose(Hprob);
 size(Htrain);
 size(Hprob);
 Grouping(1:9)=1;
 Grouping(10:18)=-1;
 class = knnclassify(Hprob,Htrain, Grouping,5);
 if(class==1)
     D=1;
 else
     D=0;
 end
end