function B= blurQualityAssesment(imgPath)
I=imread(imgPath);
Y=(fft(I));
count=0;
for i=1:size(I,1)
    for j=1:size(I,2)
        if(abs(Y(i,j))>5)
            count=count+1;
        end
    end
end
B=count/(size(I,1)*size(I,2));
end
