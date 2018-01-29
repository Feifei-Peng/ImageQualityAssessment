function C=LowFeatureQualityAssesment(Path)
I=imread(Path);
[counts1,binLocations] = imhist(I(:,:,1));
[counts2,binLocations] = imhist(I(:,:,2));
[counts3,binLocations] = imhist(I(:,:,3));
counts1=double(counts1);
counts2=double(counts2);
counts3=double(counts3);
counts = counts1./max(counts1)+counts2./max(counts2)+counts3./max(counts3);
C=0.98*sum(counts)
end