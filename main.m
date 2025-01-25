% Load the image
image = imread('img3.png');

% Convert the image to grayscale if it is not already
if size(image, 3) == 3
    image = rgb2gray(image);
end

% Define the neighborhood size
neighborhood_size = 15;

% Create a filter kernel for the moving average
kernel = ones(neighborhood_size, neighborhood_size) / (neighborhood_size * neighborhood_size);

% Apply the moving average filter
moving_average = imfilter(image, kernel, 'replicate');

% Determine the threshold (using the moving average itself)
threshold_value = moving_average;

% Apply the threshold to create a binary image
binary_image = image > (0.9*threshold_value);

% Convert the binary image to uint8 for display and saving
binary_image = uint8(binary_image) * 255;

% Save the binary image
imwrite(binary_image, 'binary_image.jpg');

% Display the images
figure;
subplot(1, 3, 1);
imshow(image);
title('Original Image');

subplot(1, 3, 2);
imshow(moving_average, []);
title('Moving Average');

subplot(1, 3, 3);
imshow(binary_image);
title('Binary Image');
