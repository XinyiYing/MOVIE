# MOVIE Matlab
Video Quality Assessment metric

Email: yingxinyi18@nudt.edu.cn

MOVIE operates on reference and distorted videos provided in planar
YUV 4:2:0 format. 

This software is best used in systems with RAM equal to or larger than
2GB (our testing environment used 2GB RAM systems). Execution speed
will suffer in systems with less RAM.

The version of Matlab should over Matlab 2014a to allow the function "VideoWriter()"

Command Line Arguments:
-----------------------
For reference and distorted images:

         run_movie_image('test_data\im\', [width,height])

For reference and distorted movies:

         run_movie_movie('test_data\video\', [width,height])

See demo_test.m for details.

Results:
--------
1. \output_data\output

MOVIE, T-MOVIE, S-MOVIE metric in *.txt

2. \movie

transfer images to video (*.yuv)

transfer video (*.avi, *.mj2, *.mpg, *.wmv, *.asf, *.asx, *.m4v, *.mp4, *.mov) to video (*.yuv)

3. \temp

Intermediate variables
