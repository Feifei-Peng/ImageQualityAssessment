function E = Hue_count(imgPath)
count=0;
I=imread(imgPath);
Ihsv = rgb2hsv(I);
M = Ihsv(:,:,2)>0.2 .* (Ihsv(:,:,3)>0.15 .* Ihsv(:,:,3)<0.95);
Tmasktrue = I(unique(M));
Tmasktrue=double(Tmasktrue);
[huecount,huevalues] = hist(Tmasktrue, 20);
Max=0.05*max(huevalues);
for i=1:20
    if(huevalues(i)>Max)
       count=count+1;
    end
end
E=count;
end