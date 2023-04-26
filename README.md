# MOVIE 
Matlab code framework of Video Quality Assessment metric T-MOVIE and MOVIE.

## Environment requirments
This software is best used in systems with RAM equal to or larger than 2GB (our testing environment used 2GB RAM systems). Execution speed will suffer in systems with less RAM.

The version of Matlab should over Matlab 2014a to allow the function "VideoWriter()"

"ffmpeg.exe" is required in "./tool/ffmpeg.exe".  Download ffmpeg.exe in https://pan.baidu.com/s/1utk27rQiW5tHKSlnCajQLw   Code：lbqk
You can also download ffmpeg in official website：https://ffmpeg.zeranoe.com/builds/

## Command Line Arguments:
For reference and distorted images:

         run_movie_image('test_data\im\', [width,height])

For reference and distorted movies:

         run_movie_movie('test_data\video\', [width,height])

See demo_test.m for details.

## Inputs:
1. Image inputs
```
  ├──./test_data/
  │    ├── im
  │    │    ├── calendar
  │    │    │    ├── hr
  │    │    │    │    ├── 000001.png
  │    │    │    │    ├── 000002.png
  │    │    │    │    ├── ...
  │    │    │    ├── sr
  │    │    │    │    ├── 000001.png
  │    │    │    │    ├── 000002.png
  │    │    │    │    ├── ...
  │    │    ├── city
  │    │    ├── ... 
  ```
2. Video inputs
```
  ├──./test_data/
  │    ├── video
  │    │    ├── calendar
  │    │    │    ├── hr.avi
  │    │    │    ├── sr.avi
  │    │    ├── city
  │    │    ├── ... 
  ```

## Results:
1. /output_data/output

MOVIE, T-MOVIE, S-MOVIE metric in *.txt

2. /video

transfer images to video (*.yuv)

transfer video (*.avi, *.mj2, *.mpg, *.wmv, *.asf, *.asx, *.m4v, *.mp4, *.mov) to video (*.yuv)

3. /temp

Intermediate variables

## Citiation
```
@Article{Seshadrinathan2010Motion,
  author    = {Kalpana Seshadrinathan and Alan C. Bovik},
  title     = {Motion Tuned Spatio-Temporal Quality Assessment of Natural Videos},
  journal   = {{IEEE} Trans. Image Process.},
  year      = {2010},
  volume    = {19},
  number    = {2},
  pages     = {335--350},
  doi       = {10.1109/TIP.2009.2034992},
}
```

## Contact
Please contact us at ***yingxinyi18@nudt.edu.cn*** for any question.

## Thanks:
Longguang Wang   https://github.com/LongguangWang/Video-Quality-Assessment
