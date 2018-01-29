function A = Spatial_distribution_edges(imgPath)
I=double(imread(imgPath));
H=fspecial('laplacian',0.2);
I= imfilter(I,H);
I=imresize(I,[100,100]);

Ms=double(zeros([100,100,3]));
for N=1:9
strNeg=strcat('C:\Users\abhay\Desktop\Semproj\Nflowers\','images_00',int2str(N),'.jpeg');
In=double(imread(strNeg));
In= imfilter(In,H);
In=imresize(In,[100,100]);
Ms=Ms+In;
end
Ms=Ms./9;

Mp=double(zeros([100,100,3]));
for N=10:18
strNeg=strcat('C:\Users\abhay\Desktop\Semproj\Pflower\','images_0',int2str(N),'.jpeg');
Ip=double(imread(strNeg));
Ip= imfilter(Ip,H);
Ip=imresize(Ip,[100,100]);
Mp=Mp+Ip;
end
Mp=Mp./9;

Ds=abs(abs(I-Ms));
Dp=abs(abs(I-Mp));
Q=sum(sum(Dp-Ds));
A=sum(Q./max(Q))/3;
end