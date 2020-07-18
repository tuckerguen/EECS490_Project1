% EECS 490 HW 1
% June 17, 2020
% Name: Tucker Guen
% NetworkID: tkg11
% Email: tkg11@case.edu
% Problem 1: Getting Started

% Note: The directory structure should be the same as the one provided
% from the zip on canvas:
% > project_dir
%       > Images
%       src_file1.m
%       src_file2.m
%       . . .

% Where project_dir contains all source files, and /Images contains 
% images to be read

%% 1-1: Convert from color to grayscale
% M-file name: image_to_grayscale.m
% Usage: image_to_grayscale(img_name_string)
% Output image: "Images/OUT_grayscale_" + img_name_string
% Parameters: None
image_to_grayscale("library_color.raw");
%% 1-2 Embedded image
% M-file name: embed_watermark_in_image.m
% Usage: embed_watermark_in_image(img_name_string, watermark_name_string, is_color)
% Output image: "Images/OUT_embedded_gray_" + img_name_string
%           OR  "Images/OUT_embedded_color_" + img_name_string
% Parameters: Max color/gray value: 200
embed_watermark_in_image("library_color.raw", "cwru_logo_color.raw", true);
% Embed gray watermark in gray image
embed_watermark_in_image("library_color.raw", "cwru_logo_gray.raw", false);
%% 1-3 Generating Negative from Color Image
% M-file name: negative_of_img.m
% Usage: negative_of_img(img_name_string, plot_colors_separately)
    % plot_colors_separately  = (bool) if true color histogram plotted
    % on separate graphs, false colors on one plot
% Output image: "Images/OUT_negative_" + img_name_string
% Parameters: None
negative_of_img("F-16.raw", false);
%% 2-1-1 rose_dark full linear scaling
% M-file name: full_linear_scale.m
% Usage: full_linear_scale(img_name_string)
% Output image: "Images/OUT_linear_scaled_" + img_name_string
% Parameters: gmin=0, gmax=255
full_linear_scale("rose_dark.raw");

%% 2-1-2 rose_dark histogram equalization
% M-file name: histogram_equalize.m
% Usage: histogram_equalize(img_name_string)
% Output image: "Images/OUT_histogram_equalized_" + img_name_string
% Parameters: None
histogram_equalize("rose_dark.raw");

%% 2-2-1 rose_mid full linear scaling
% M-file name: full_linear_scale.m
% Usage: full_linear_scale(img_name_string)
% Output image: "Images/OUT_linear_scaled_" + img_name_string
% Parameters: gmin=0, gmax=255
full_linear_scale("rose_mid.raw");

%% 2-2-2 rose_mid histogram equalization
% M-file name: histogram_equalize.m
% Usage: histogram_equalize(img_name_string)
% Output image: "Images/OUT_histogram_equalized_" + img_name_string
% Parameters: None
histogram_equalize("rose_mid.raw");

%% 2-3-1 rose_bright full linear scaling
% M-file name: full_linear_scale.m
% Usage: full_linear_scale(img_name_string)
% Output image: "Images/OUT_linear_scaled_" + img_name_string
% Parameters: gmin=0, gmax=255
full_linear_scale("rose_bright.raw");

%% 2-3-2 rose_bright histogram equalization
% M-file name: histogram_equalize.m
% Usage: histogram_equalize(img_name_string)
% Output image: "Images/OUT_histogram_equalized_" + img_name_string
% Parameters: None
histogram_equalize("rose_bright.raw");

%% 3-1-1 Gray - Uniform Noise Removal
% M-file name: linear_noise_removal.m
% Usage: linear_noise_removal(img_name_string, nxn_mask)
% Output image: "Images/OUT_linear_noise_removed_" + img_name_string
% Parameters: Mask ([1,2,1;2,4,2;1,2,1] or chosen by user)

mask = [1/16,2/16,1/16;2/16,4/16,2/16;1/16,2/16,1/16];
linear_noise_removal("rose_uni.raw", mask);


%% 3-1-2 Gray - Gaussian Noise Removal
% M-file name: linear_noise_removal.m
% Usage: linear_noise_removal(img_name_string, nxn_mask)
% Output image: "Images/OUT_linear_noise_removed_" + img_name_string
% Parameters: Mask ([1,2,1;2,4,2;1,2,1] or chosen by user)

mask = [1/16,2/16,1/16;2/16,4/16,2/16;1/16,2/16,1/16];
linear_noise_removal("rose_gau.raw", mask);

%% 3-2 Color - Noise Removal
% M-file name: nonlinear_noise_remove.m
% Usage: nonlinear_noise_remove(img_name_string, size_of_pseudomedian_sliding_window)
% Output image: "Images/OUT_nonlinear_removed_" + img_name_string
% Parameters: 
    % size_of_pseudomedian_sliding_window = 5 or chosen by user
    % filter shape: Plus-shaped
    % filter type: pseudomedian (not median)

nonlinear_noise_remove("rose_color_noise.raw", 5);
