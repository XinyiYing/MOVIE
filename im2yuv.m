function [H,W]=im2yuv(img_dir, img_size)
% H, W is the width and height of test images (or required szie of test_image cropped from the orignal data).
% img_dir is the path of images folder. 
%% im2avi
output_dir = 'output_data'; % path to save output data (*.avi, *.yuv)
mkdir(output_dir);
mkdir(output_dir,'\video');
temp0 = strsplit(img_dir, '\');
scene = temp0{3};
name = temp0{4};
mkdir([output_dir,'\video\', scene]);
aviobj  = VideoWriter([output_dir,'\video\',scene,'\',name,'.avi']); % path to save *.avi
% standard metric for video
aviobj.Quality = 100;
aviobj.FrameRate = 30;
open(aviobj)

img_list = dir(img_dir);
temp0 = img_list(length(img_list)-1).name;
frame0 = imread([img_dir, '\', temp0]);
temp0 = strsplit(temp0, '.');
png = temp0{2};
if img_size
    W = img_size(1);
    H = img_size(2);
else
    [H,W,C] = size(frame0);
end
img_list =  dir([img_dir, '\*.', png]);
for i=1:length(img_list)
    fname = [img_dir, '\', img_list(i).name];
    frame = imread(fname);
    frame_ycbcr = rgb2ycbcr(frame);
    frame_ycbcr(:,:,2) = frame_ycbcr(:,:,1);
    frame_ycbcr(:,:,3) = frame_ycbcr(:,:,1);
            
    frame = frame_ycbcr(1:H, 1:W, :); % Crop the input images according to H, W
    frame = frame(11:end-10, 11:end-10, :); % Crop the 10*10 boundary
    % MOVIE metric require the length of frame over 33
    if length(img_list) < 33
        temp = 33 - length(img_list);
        if mod(temp, 2) == 0
            if i == 1
                for j = 1:temp/2
                    writeVideo(aviobj,frame);
                end
                writeVideo(aviobj,frame);
            elseif i == 31
                for j = 1:temp/2
                    writeVideo(aviobj,frame);
                end
                writeVideo(aviobj,frame);
            else
                writeVideo(aviobj,frame);
            end
        else
            if i == 1
                for j = 1:int32(temp/2)
                    writeVideo(aviobj,frame);
                end
                writeVideo(aviobj,frame);
            elseif i == 31
                for j = 1:int32(temp/2)-1
                    writeVideo(aviobj,frame);
                end
                writeVideo(aviobj,frame);
            else
                writeVideo(aviobj,frame);
            end
        end
    else
        writeVideo(aviobj,frame);
    end
end
close(aviobj); 

%% avi2yuv
avi_dir = [output_dir,'\video\',scene,'\',name,'.avi'];
yuv_dir = [output_dir,'\video\',scene,'\',name,'.yuv'];
cmd = ['tool\ffmpeg.exe',' -i ',avi_dir,' -pix_fmt yuv420p ',yuv_dir];
system(cmd)
