# Computational Vision Assignments

## Overview
This repository contains MATLAB implementations of various computational vision algorithms developed as part of the **CSCI 363: Computational Vision** course. The assignments cover a range of topics, including image processing, edge detection, stereo vision, motion estimation, and visual illusions.

## Assignments

### **Assignment 1: Image Processing Basics**
**Objective:** Introduce MATLAB programming and image representation using 2D matrices.
- **addCircle.m** – Adds a circular patch of constant intensity to an image.
- **addColorCircle.m** – Adds a circular patch of color to an RGB image.
- **blurImage.m** – Implements image blurring using neighborhood averaging.
- **findEdges.m** – Detects edges by identifying intensity changes between adjacent pixels.

### **Assignment 2: Zero-Crossings and Visual Illusions**
**Objective:** Explore intensity changes using Laplacian-of-Gaussian (LoG) filtering.
- **zcs.m** – Detects zero-crossings in convolved images.
- **zeros2D.m** – Computes the slope of zero-crossings, indicating contrast at edges.
- **sunScript.m** – Analyzes the "sun illusion" using zero-crossings.

### **Assignment 3: Gabor Filtering and Frequency Analysis**
**Objective:** Analyze image frequency components using Gabor filters and Fast Fourier Transform (FFT).
- **makeGabor.m** – Generates Gabor filters with adjustable size, frequency, and sigma.
- **showPColor.m** – Displays grayscale images with proper aspect ratio.
- **FFT Analysis** – Investigates the frequency response of sinewave gratings, Gaussian functions, and Gabor filters.

### **Assignment 4: Stereo Vision Algorithms**
**Objective:** Implement and analyze stereo disparity algorithms for depth estimation.
- **coopStereo.m** – Implements the Marr-Poggio cooperative stereo algorithm.
- **stereoMatch.m** – Computes disparity maps using a correlation-based approach.
- **Multi-Resolution Stereo Analysis** – Explores the Marr-Poggio-Grimson (MPG) algorithm.

### **Assignment 5: Motion Correspondence and Optical Flow**
**Objective:** Implement motion estimation techniques for velocity computation.
- **motionMatch.m** – Computes motion fields using sum-of-absolute-differences (SAD) matching.
- **computeVelocity.m** – Estimates velocity fields using perpendicular motion components.
- **Motion Analysis** – Investigates error regions in velocity fields.

### **Assignment 6: Optical Flow and Visual Perception**
**Objective:** Simulate and analyze optical flow fields for observer motion.
- **ske.m** – Creates a movie demonstrating the stereokinetic effect.
- **setupImageVelocities.m** – Computes optic flow fields based on observer motion parameters.
- **Observer Motion Analysis** – Evaluates the Longuet-Higgins and Prazdny heading estimation algorithm.

## Tools & Libraries Used
- **MATLAB** – Primary language for image processing and algorithm development.
- **Image Processing Toolbox** – Used for convolution, filtering, and visualization.
- **MATLAB Built-in Functions** – Includes `conv2`, `fft2`, `imtool`, `pcolor`, and `quiver` for image analysis.

## Results & Observations
- Edge detection methods effectively highlight intensity changes but are sensitive to noise.
- Gabor filtering isolates specific frequency components, useful for texture analysis.
- Stereo matching algorithms demonstrate depth perception challenges in real-world images.
- Optical flow techniques illustrate the role of motion estimation in visual perception.
- Visual illusions, such as the sun illusion and stereokinetic effect, reveal insights into human vision processing.

## Collaboration
- **Eli Werstler** – Sole contributor to assignments 2-6.
- **Collaboration on Assignment 1** – Worked with Lauren Chilton on Problems 2 and 3.

## Conclusion
This project explores fundamental computational vision concepts through hands-on MATLAB implementations. The assignments provide a practical understanding of image processing, edge detection, stereo vision, and optical flow, contributing to a deeper insight into human and machine vision systems.

## References
- MATLAB Documentation: [https://www.mathworks.com/help/](https://www.mathworks.com/help/)
- Image Processing Toolbox: [https://www.mathworks.com/products/image.html](https://www.mathworks.com/products/image.html)
- Computer Vision Research Papers and Course Notes

