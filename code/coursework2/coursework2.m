% Question 1
Ia=imread('rooster.jpg');
Ib=imread('elephant.png');
Ic=imread('woods.png');
Ib(403,404)
Ib(403,404)=1;
Ib(403,404)
Ib(401:end,401:end)=255;
figure(1),clf
imagesc(Ib); colormap('gray')
Isyn=zeros(201,201);
Isyn(51:150,51:150)=1;
Isyn(81:120,:)=0.5;
Isyn(:,81:120)=0.75;
figure(2), clf, imagesc(Isyn);
Ibsmall=imresize(Ib,0.5);
Iblarge=imresize(Ib,2);
figure(3), clf
subplot(2,2,1), imagesc(Ibsmall)
subplot(2,2,2), imagesc(Iblarge)
Iblarge=imresize(Ib,2,'bilinear');
Ibsmall=imresize(Ib,0.5,'nearest');
figure(3), clf
subplot(2,2,1), imagesc(Ibsmall)
subplot(2,2,2), imagesc(Iblarge)
Ibsmall(237,192)
Ib(237,192)
Iblarge(237,192)
Ib(474,384)
Iblarge(948,768)
%Question 2
imwrite(Ibsmall,'elephant_small.jpg','jpg')
figure(3)
print -dpdf elephants.pdf
save('cv_cw2_variables.mat');
Ibd=im2double(Ib);
Ibdiffv=Ibd(1:end-1,:)-Ibd(2:end,:);
figure(3), clf, imagesc(Ibdiffv);colormap('gray');colorbar
Ibdiffh=Ibd(:,1:end-1)-Ibd(:,2:end);
figure(4), clf, imagesc(Ibdiffh);colormap('gray');colorbar
Ibdiff=sqrt(Ibdiffh(1:end-1,:).^2+Ibdiffv(:,1:end-1).^2);
figure(5), clf, imagesc(Ibdiff); colormap('gray'); colorbar
bw=im2bw(Ibdiff,0.075);
figure(6), clf, imagesc(bw); colormap('gray'); colorbar
Ibdiffv(505,400)
Ibdiffh(505,400)
Ibdiff(505,400)
bw(505,400)

%Question 3
offsets=[0:30];
for offset=offsets
simb(offset+1)=corr2(Ib(1:end-offset,:),Ib(1+offset:end,:));
simc(offset+1)=corr2(Ic(1:end-offset,:),Ic(1+offset:end,:));
end
figure(7),clf,
plot(offsets, roundn(simb,-2));
hold on;
plot(offsets, roundn(simc,-2));
legend({'elephant','woods'});
xlabel('shift'); ylabel('correlation coefficient')

%Question 4
dog=fspecial('gaussian',9,1)-fspecial('gaussian',9,1.5);
Ibdog=conv2(Ibd,dog,'same');
figure(8), clf, imagesc(Ibdog); colormap('gray'); colorbar
Icdog=conv2(Ic,dog,'same');
figure(9), clf, imagesc(Icdog); colormap('gray'); colorbar

for offset=offsets
simbdog(offset+1)=corr2(Ibdog(1:end-offset,:),Ibdog(1+offset:end,:));
simcdog(offset+1)=corr2(Icdog(1:end-offset,:),Icdog(1+offset:end,:));
end
figure(10),clf,
plot(offsets, roundn(simbdog,-2));
hold on;
plot(offsets, roundn(simcdog,-2));
legend({'elephant with DoG','woods with DoG'});
xlabel('shift'); ylabel('correlation coefficient')

%Question 5
Iad=im2double(Ia);
gc=fspecial('gaussian',9,1);
gs=fspecial('gaussian',9,1.5);
IaRG=conv2(Iad(:,:,1),gc,'same')-conv2(Iad(:,:,2),gs,'same');
IaGR=conv2(Iad(:,:,2),gc,'same')-conv2(Iad(:,:,1),gs,'same');
y=mean(Iad(:,:,1:2),3);
IaBY=conv2(Iad(:,:,3),gc,'same')-conv2(y,gs,'same');
IaYB=conv2(y,gc,'same')-conv2(Iad(:,:,3),gs,'same');
figure(11), subplot(2,2,1), imagesc(IaRG); title ("red-on, green-off");
subplot(2,2,2), imagesc(IaGR); title ("green-on, red-off");
subplot(2,2,3), imagesc(IaBY); title ("blue-on, yellow-off");
subplot(2,2,4), imagesc(IaYB); title ("yellow-on, blue-off");
roundn(IaRG(341,374),-2)
roundn(IaGR(341,374),-2)
roundn(IaBY(341,374),-2)
roundn(IaYB(341,374),-2)
