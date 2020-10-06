Ia=imread('rooster.jpg');
Ib=imread('elephant.png');
figure(1),subplot(2,2,1),imagesc(Ia);
subplot(2,2,2),imagesc(Ia(:,:,1)); title('red channel'); colorbar
subplot(2,2,3),imagesc(Ia(:,:,2)); title('green channel'); colorbar
subplot(2,2,4),imagesc(Ia(:,:,3)); title('blue channel'); colorbar
colormap('gray')
figure(2),imagesc(Ib); colorbar
colormap('gray');
figure(2),axis('off')
axis('equal')
Ib(3,:)
Ib(:,3)
Ib(1:6,1:4,1)
Ia(1:6,1:4,1)
Ia(1:6,1:4,2)
Ib(3,4)
Ib(72,236)
Ib(31,227)
Ib(81,112)
Ic=rgb2gray(Ia);
figure(3),imagesc(Ic); colorbar
Id=im2double(Ic);
figure(4),imagesc(Id); colorbar
Id(154,91)
Id(227,230)
Id(275,37)