# Image Binarization using Moving Average Adaptive Thresholding

![binary_image](https://github.com/user-attachments/assets/1969652a-15be-4ad4-8a2c-0cf6c76c65fc)
![img1](https://github.com/user-attachments/assets/f5beb509-4394-47dc-ba5e-49fb40d64ec2)

This MATLAB script implements an adaptive thresholding technique for image binarization using a moving average filter. This approach helps to deal with images that have uneven lighting or varying background intensities.

## Overview

This script performs the following:

1.  **Loads an image:** Reads an image from a file.
2.  **Converts to grayscale (if necessary):** If the image is in color, it's converted to grayscale.
3.  **Applies a moving average filter:** A moving average filter with a specified neighborhood size is applied to the image to get a blurred version of the original image which can be used as threshold.
4.  **Adaptive Thresholding:** The threshold for binarization is determined based on a fraction of the smoothed version of the image.
5.  **Creates a binary image:** The image is binarized (converted to black and white) using the adaptive threshold.
6.  **Saves and displays the results:** The resulting binary image is saved, and all three images (original, smoothed, binary) are displayed.

## How It Works

The algorithm works as follows:

1.  **Image Loading:**
    *   The script reads an input image (e.g., `img3.png`).

2.  **Grayscale Conversion:**
    *   If the input image is a color image (RGB), it is converted to a grayscale image. This simplifies the processing since we are only interested in the intensity.

3.  **Moving Average Filtering:**
    *   A square kernel of size `neighborhood_size x neighborhood_size` is created (e.g., 15x15), where each value is equal.
    *   This kernel is used to compute a moving average over the image, creating a blurred version of the image.
    *  The moving average is computed with 'replicate' padding for edge pixels.

4.  **Adaptive Thresholding:**
    *   The threshold for each pixel is set to be 0.9 times the moving average intensity of that region.
    *   Pixels in the original image with values greater than their corresponding threshold values in the `threshold_value` image are set to white (1), otherwise they are set to black (0).
    *  This threshold adapts to local variations in the intensity of the image.

5.  **Binary Image Creation:**
    *   The resulting binary image is converted to `uint8` data type, multiplied by 255, so that the binary image can be saved as a JPEG.

6.  **Saving and Displaying Results:**
    *   The resulting binary image is saved as 'binary_image.jpg'.
    *   The original image, the moving average filtered image, and the final binary image are displayed in a single figure.

## Files

*   `main.m`: (Replace `main.m` with the actual name of your MATLAB script file) This is the main MATLAB script file that implements the adaptive thresholding algorithm.
*   `img3.png`: An example input image to be processed.

## Usage

1.  Ensure you have MATLAB installed on your system.
2.  Place the MATLAB script file and the image(s) you want to process in the same directory.
3.  Run the MATLAB script from the MATLAB command window or by pressing the "Run" button in the editor.

## Dependencies

*   MATLAB Image Processing Toolbox (for functions like `imread`, `rgb2gray`, `imfilter`, `imshow`, `imwrite`)

## Parameters
*   **Neighborhood Size:** Controls the size of the moving average filter. You can modify the `neighborhood_size` variable (default is 15) in the script to adjust the size of the blurring kernel.
*   **Threshold Fraction:** Controls the fraction of the moving average that is used as the threshold. You can modify the multiplier `0.9` to achieve different thresholding results

## Future Improvements

*   Implement more sophisticated filters for adaptive thresholding.
*   Explore different methods for determining the threshold value.
*   Make parameters like the threshold multiplier and neighborhood size be passed from the command-line as parameters.
