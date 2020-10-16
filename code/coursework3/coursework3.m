Ia=imread('rooster.jpg');
Ib=imread('elephant.png');
Ic=imread('boxes.pgm');
save('cv_cw3_variables.mat');
Iag = rgb2gray(Ia);
Iad = im2double(Iag);
Icd = im2double(Ic);

% Q1
H1 = fspecial('average',5);
H2 = fspecial('average',25);
Ia5 = conv2(Iad, H1, 'same');
Ia25 = conv2(Iad, H2, 'same');
Ic5 = conv2(Icd, H1, 'same');
Ic25 = conv2(Icd, H2, 'same');
figure(1), subplot(2,2,1), imagesc(Ia5); colorbar
subplot(2,2,2), imagesc(Ia25); colorbar
subplot(2,2,3), imagesc(Ic5); colorbar
subplot(2,2,4), imagesc(Ic25); colorbar
colormap('gray');
roundn(Ia5(301,6),-2)
roundn(Ia25(301,6),-2)
roundn(Ic5(46,35),-2)
roundn(Ic25(46,35),-2)

% Q2
dog1 = fspecial('gaussian',9,1.5);
dog2 = fspecial('gaussian',60,10);
Iad1 = conv2(Iad, dog1, 'same');
Iad2 = conv2(Iad, dog2, 'same');
Icd1 = conv2(Icd, dog1, 'same');
Icd2 = conv2(Icd, dog2, 'same');
figure(2), subplot(2,2,1), imagesc(Iad1); colorbar
subplot(2,2,2), imagesc(Iad2); colorbar
subplot(2,2,3), imagesc(Icd1); colorbar
subplot(2,2,4), imagesc(Icd2); colorbar
colormap('gray');
Iad1(337,208)
Iad2(337,208)
Icd1(83,56)
Icd2(83,56)

% Q3
Dmy = [-1;1];
Dmx = [-1,1];
Ibd = im2double(Ib);
Ibdx = conv2(Ibd, Dmx, 'valid');
Ibdy = conv2(Ibd, Dmy, 'valid');
roundn(Ibdy(241,360),-2)
roundn(Ibdx(241,360),-2)
roundn(Ibdy(174,476),-2)
roundn(Ibdx(174,476),-2)

% Q4
Hla = [-1/8,-1/8,-1/8;-1/8,1,-1/8;-1/8,-1/8,-1/8];
Iala = conv2(Iad, Hla, 'same');
Icla = conv2(Icd, Hla, 'same');
figure(3), subplot(2,2,1), imagesc(Ibdx); colorbar
subplot(2,2,2), imagesc(Ibdy); colorbar
subplot(2,2,3), imagesc(Iala); colorbar
subplot(2,2,4), imagesc(Icla); colorbar
colormap('gray');
roundn(Icla(22,41),-2)
roundn(Icla(22,42),-2)
roundn(Icla(22,43),-2)
roundn(Icla(22,44),-2)
roundn(Icla(22,45),-2)

% Q5
Ga = fspecial('gaussian',15,2.5);
Gax= conv2(Ga, Dmx, 'valid');
Gay= conv2(Ga, Dmy, 'valid');
Icdgx= conv2(Icd, Gax, 'same');
Icdgy= conv2(Icd, Gay, 'same');
figure(4), subplot(2,2,1), mesh(Gax);
subplot(2,2,2), mesh(Gay);
subplot(2,2,3), imagesc(Icdgx);
subplot(2,2,4), imagesc(Icdgy);
colormap('gray');
Icdg=sqrt(Icdgx.^2+Icdgy.^2);
figure(5), imagesc(Icdg);
colormap('gray');
roundn(Icdgx(22,41),-2)
roundn(Icdgx(22,42),-2)
roundn(Icdgx(22,43),-2)
roundn(Icdgx(22,44),-2)
roundn(Icdgx(22,45),-2)

% Q6
dog3 = fspecial('gaussian',30,5);
LOG1 = conv2(dog1, Hla, 'same');
LOG2 = conv2(dog3, Hla, 'same');
Iclog1 = conv2(Icd, LOG1, 'same');
Iclog2 = conv2(Icd, LOG2, 'same');
figure(6), subplot(2,2,1), mesh(LOG1);
subplot(2,2,2), mesh(LOG2);
subplot(2,2,3), imagesc(Iclog1);
subplot(2,2,4), imagesc(Iclog2);
colormap('gray');
Ialog1 = conv2(Iad, LOG1, 'same');
Ialog2 = conv2(Iad, LOG2, 'same');
figure(7), subplot(2,2,1), mesh(LOG1);
subplot(2,2,2), mesh(LOG2);
subplot(2,2,3), imagesc(Ialog1);
subplot(2,2,4), imagesc(Ialog2);
colormap('gray');
roundn(Iclog1(22,41),-2)
roundn(Iclog1(22,42),-2)
roundn(Iclog1(22,43),-2)
roundn(Iclog1(22,44),-2)
roundn(Iclog1(22,45),-2)

% Q7
IaGIP1= Iad;
IaGIP2= conv2(IaGIP1, dog1, 'same');
Ias2 = imresize(IaGIP2,0.5,'nearest');
IaGIP3= conv2(Ias2, dog1, 'same');
Ias3 = imresize(IaGIP3,0.5,'nearest');
IaGIP4= conv2(Ias3, dog1, 'same');
Ias4 = imresize(IaGIP4,0.5,'nearest');
figure(8), subplot(2,2,1), imagesc(IaGIP1);
subplot(2,2,2), imagesc(Ias2);
subplot(2,2,3), imagesc(Ias3);
subplot(2,2,4), imagesc(Ias4);
colormap('gray');
roundn(Ias4(5,3),-2)
roundn(Ias4(14,15),-2)

% Q7
figure(8),clf
IpyrG=Iad;
subplot(2,2,1),imagesc(IpyrG);axis('equal','tight'),colorbar
for i=2:4
    IpyrG=imresize(conv2(IpyrG,dog1,'same'),0.5,'nearest');
    subplot(2,2,i),imagesc(IpyrG);axis('equal','tight'),colorbar
end

% Q8
figure(9),clf
IpyrG=Iad;
for i=1:4
    IpyrGsmooth=conv2(IpyrG,dog1,'same');
    Ipyrl=IpyrG-IpyrGsmooth;
    subplot(2,2,i), imagesc(Ipyrl); axis('equal','tight'), colorbar
    IpyrG=imresize(IpyrGsmooth,0.5,'nearest');
end
colormap('gray');



