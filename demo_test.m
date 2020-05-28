%% demo_test
run_movie_image('test_data\im\', [])
% Parameters:
% test images path . if empty, automatically set 'test_data\im\'
% required heigth and weigth of images.if empty, automatically set the width and height of images.
% -------------------note-------------------------
% 1. The size of reference images and distorted images path should be the same.
% 2. Reference images should be put in 'test_data\im\calendar\hr'. 'calendar' is the scene name.
% 3. Distorted images should be put in 'test_data\im\calendar\sr'.
% 4. You can check the generated *.yuv in '\output_data\video\calendar\' to ensure *.yuv is accurate (not consist of noise).
% 5. To open *.yuv, you can use the yuvplayer.exe in '\tool'. Before play *.yuv, you should set weigth and height of video in yuvplayer.exe
% 6. The size of output *,yuv is smaller than the input images, we crop the 10*10 boundary of the input images.
run_movie_video('test_data\video\', [])
% Parameters: 
% test videos path. if empty, automatically set 'test_data\video\'
% required heigth and weigth of videos. if empty, automatically set the width and height of videos.
% -------------------note-------------------------
% 1. The size of reference videos and distorted videos path should be the same.
% 2. Movies should be put in 'test_data\video\city'. 'city' is the scene name.
% 3. 'hr.avi' and 'sr.avi' is the reference video and the distorted video. Code support other video format, we recommand *.avi.
% 4. You can check the generated *.yuv in '\output_data\video\city\' to ensure *.yuv is accurate (not consist of noise).
% 5. To open *.yuv, you can use the yuvplayer.exe in '\tool'. Before play *.yuv, you should set weigth and height of video in yuvplayer.exe
