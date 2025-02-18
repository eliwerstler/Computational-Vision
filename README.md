# Computational Vision: Image Processing, Stereo Vision, and Motion Estimation

## Overview
This repository contains MATLAB implementations of computational vision algorithms developed to explore key concepts in image processing, feature extraction, stereo vision, and motion estimation. These projects highlight my understanding of techniques used to analyze visual data, detect patterns, and estimate depth and motion in images. By implementing and experimenting with different approaches, I gained insights into the strengths and limitations of various computational vision techniques.

## Core Concepts & Implementations
### **Image Representation and Processing**
Understanding images as 2D matrices was a foundational step, where I worked with grayscale and RGB representations to manipulate intensity and color distributions. I implemented functions to generate synthetic images, applying geometric transformations to create and manipulate visual elements such as circular and rectangular patches. Image blurring using neighborhood averaging helped reinforce the importance of local intensity variations in image filtering and noise reduction.

### **Edge Detection and Frequency Analysis**
Edge detection techniques, particularly those using Laplacian-of-Gaussian (LoG) filters, enabled the identification of zero-crossings—regions where intensity changes indicate object boundaries. This led to an exploration of Gabor filters, which allowed for frequency-specific feature extraction. Applying Fast Fourier Transform (FFT) to images and filters provided insights into frequency domain representations and how different spatial structures contribute to visual perception.

### **Stereo Vision and Depth Perception**
Developing stereo matching algorithms involved solving the correspondence problem—determining how features from one image correspond to those in another. The Marr-Poggio cooperative stereo algorithm and a correlation-based approach allowed for depth estimation by analyzing disparities between left and right images. The implementation of multi-resolution stereo techniques further demonstrated how feature hierarchies contribute to depth perception in real-world applications.

### **Motion Estimation and Optical Flow**
Expanding upon stereo vision, I explored motion correspondence by computing velocity fields from sequential image frames. Using gradient-based methods, I estimated motion perpendicular to edge orientations and integrated local measurements to reconstruct full velocity fields. The optical flow problem was further analyzed through models that recover observer motion based on scene depth and translational or rotational movements. These experiments provided a deeper understanding of how motion is perceived and estimated in biological and artificial vision systems.

### **Visual Illusions and Perception Modeling**
By simulating visual illusions such as the Sun Illusion and the Stereokinetic Effect, I analyzed how early vision processes contribute to perceptual effects. The computation of contrast-dependent zero-crossing responses explained how the visual system interprets non-existent edges. Implementing optic flow models further revealed how local motion cues are integrated to infer global scene motion.

## Tools & Libraries Used
- **MATLAB** – Core environment for algorithm development and testing.
- **Image Processing Toolbox** – Used for convolution, filtering, and visualization.
- **MATLAB Built-in Functions** – Includes `conv2`, `fft2`, `imtool`, `pcolor`, and `quiver` for image analysis.

## Key Takeaways
- Edge detection techniques like zero-crossings and LoG filtering effectively extract structural information from images.
- Frequency analysis using Gabor filters and FFT provides a deeper understanding of how visual data is processed in spatial and frequency domains.
- Stereo vision algorithms reveal the complexity of matching features between images for depth estimation.
- Optical flow and motion estimation techniques highlight the challenges in computing real-world motion from 2D image sequences.
- Visual illusions demonstrate how early-stage computational processes shape human perception.

## Conclusion
Through these projects, I developed a deeper appreciation for the computational models that underlie human and machine vision. By implementing these algorithms from scratch, I gained a thorough understanding of how images are processed, interpreted, and used to make inferences about the visual world. These experiences will inform my future work in computer vision, machine learning, and image analysis.

## References
- MATLAB Documentation: [https://www.mathworks.com/help/](https://www.mathworks.com/help/)
- Image Processing Toolbox: [https://www.mathworks.com/products/image.html](https://www.mathworks.com/products/image.html)
- Computer Vision Research Papers and Course Notes: [https://mathcs.holycross.edu/~csci363)

