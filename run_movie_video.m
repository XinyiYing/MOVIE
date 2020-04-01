function run_movie_video(video_dir, video_size)
% H, W is the width and height of test images (or required szie of test_image cropped from the orignal data).
% hr_dir is the path of groundtruth images folder. default = 'test_data\hr'
% sr_dir is the path of super-resolved images folder. default = 'test_data\sr'
% ------------------------------note----------------------------
% Test images should better be *.png
% The number of test images should more than 33. if not, we copy the first and the last frame to generate video sequence of 33 frames.
%% video generate *.yuv
if isempty(video_dir)
    video_dir = 'test_data\video\';
end
video_list = dir(video_dir);
output_dir = 'output_data';
for idx_video = 3:length(video_list)
    Suffix = dir([video_dir,video_list(idx_video).name]);
    temp0 = strsplit(Suffix(3).name, '.');
    Suffix = temp0{2};
    if video_size
        W = video_size(1);
        H = video_size(2);
    else 
        obj = VideoReader([video_dir, video_list(idx_video).name,'\hr.', Suffix]);
        W = obj.Width;
        H = obj.Height;
    end
    % if Suffix ~= 'yuv', Suffix2yuv
    if Suffix ~= 'yuv'
        mkdir([output_dir, '\video']);
        mkdir([output_dir, '\video\', video_list(idx_video).name]);
        avi_name = [video_dir, video_list(idx_video).name,'\hr.', Suffix];
        yuv_name = [output_dir, '\video\', video_list(idx_video).name, '\hr.yuv'];
        cmd = ['tool\ffmpeg.exe',' -i ',avi_name,' -pix_fmt yuv420p ',yuv_name];
        system(cmd)
        avi_name = [video_dir, video_list(idx_video).name,'\sr.', Suffix];
        yuv_name = [output_dir, '\video\', video_list(idx_video).name, '\sr.yuv'];
        cmd = ['tool\ffmpeg.exe',' -i ',avi_name,' -pix_fmt yuv420p ',yuv_name];
        system(cmd)
    end
    % movie
    mkdir([output_dir,'\temp']);
    mkdir([output_dir,'\output']);
    if Suffix ~= 'yuv'
        hr_dir = [output_dir, '\video\', video_list(idx_video).name, '\hr.yuv'];
        sr_dir = [output_dir, '\video\', video_list(idx_video).name, '\sr.yuv'];
    else
        hr_dir = [video_dir, video_list(idx_video).name, '\hr.yuv'];
        sr_dir = [video_dir, video_list(idx_video).name, '\sr.yuv'];
    end
    GT_video_name = hr_dir;
    dis_video_name = sr_dir;
    GT_name = [video_list(idx_video).name, '_GT'];
    dis_name = [video_list(idx_video).name,'_Bicubic'];

    temp_path = [output_dir,'\temp'];
    output_path = [output_dir,'\output'];
    height = num2str(H);
    width = num2str(W);
    cmd = ['tool\movie.exe',' ',GT_video_name,' ',dis_video_name,' ',GT_name, ' ',dis_name,' ',temp_path,' ',output_path,' ',width,' ',height,' ','-f ', temp_path,' -remove'];
    system(cmd)    
end

