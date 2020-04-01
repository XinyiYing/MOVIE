function run_movie_image(img_dir, img_size)
% img_size=[W,H] is the width and height of test images, or required size of test images.
% img_dir='test_data\im\' is the image data dir.
% ------------------------------note----------------------------
% Test images should better be *.png
% The number of test images should more than 33. if not, we copy the first and the last frame to generate video sequence of 33 frames.
%% images generate yuv
if isempty(img_dir)
    img_dir = 'test_data\im\';
end

img_list = dir(img_dir);
for list_num = 3:length(img_list)
    hr_dir = [img_dir, img_list(list_num).name, '\hr'];
    sr_dir = [img_dir, img_list(list_num).name, '\sr'];
    % ------------------------------im2yuv---------------------------
    % Picture format is best to be *.png.
    [H,W] = im2yuv(hr_dir, img_size);
    [H,W] = im2yuv(sr_dir, img_size);
    % -------------------------------movie---------------------------
    h = H - 20; % the height of video (already crop the 10*10 boundary)
    w = W - 20; % the width of video (already crop the 10*10 boundary)

    output_dir = 'output_data';
    mkdir(output_dir);
    mkdir([output_dir,'\temp']);
    mkdir([output_dir,'\output']);
    GT_video_name = [output_dir, '\video\',img_list(list_num).name,'\hr.yuv'];
    dis_video_name = [output_dir, '\video\',img_list(list_num).name,'\sr.yuv'];
    GT_name = [img_list(list_num).name,'_GT'];
    dis_name = [img_list(list_num).name,'_Bicubic'];

    temp_path = [output_dir,'\temp'];
    output_path = [output_dir,'\output'];
    height = num2str(h);
    width = num2str(w);
    cmd = ['tool\movie.exe',' ',GT_video_name,' ',dis_video_name,' ',GT_name, ' ',dis_name,' ',temp_path,' ',output_path,' ',width,' ',height,' ','-f ', temp_path,' -remove'];
    system(cmd)    
end



