
num = input("Choose a number from 1 to 5: ");

xray = imread("input"+num+".png");
figure;
subplot(3,3,1);
imshow(xray);
title("1- Input:");

greytone = rgb2gray(xray);
subplot(3,3,2);
imshow(greytone);
title("2- Grey toned:");

histogram = histeq(greytone);
subplot(3,3,3);
imshow(histogram);
title("3- Histogram equalization:");

thresholded = histogram<80;
subplot(3,3,4);
imshow(thresholded);
title("4- After Threshold:");

borderless = imclearborder(thresholded);
subplot(3,3,5);
imshow(borderless);
title("5- Cleaning borders:");

cleaned_img = bwareaopen(borderless, 500);
subplot(3,3,6);
imshow(cleaned_img);
title("6- Cleaning details:");

negative = ~cleaned_img;
subplot(3,3,7);
imshow(negative);
title("7- Negative image:");

img_xray = imclearborder(negative);
subplot(3,3,8);
imshow(img_xray);

finalxray = bwareaopen(bosluksuz, 60);
subplot(3,3,9);
imshow(finalxray);

[finalxray, N] = bwlabel(finalxray);

if N > 0
    fprintf("Lung cancer has been detected. Number of nodules found: "+N+"\n\n")
    title("8- There are "+N+" nodules.");
else
    fprintf("Lung cancer has not been detected.\n\n")
    title("8- Healthy lung");
end
