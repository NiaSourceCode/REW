%% ANAP-building
% %{
% imfolder = 'images/test';
% imfolder = 'images/fcase_foundation';
% imfolder = '/home/lynx/study/stitch/dataset/z_test';
% imfolder = '/home/lynx/fuck_mount/opencv/workspace/test_result/paper/16';
imfolder = '/home/lynx/fuck_mount/opencv/workspace/tests_new/3';
im_n = 5; % 图片数
imfile = cell(im_n,1);

imfile{1} = [imfolder '/' '1.jpg']
imfile{2} = [imfolder '/' '2.jpg']
imfile{3} = [imfolder '/' '3.jpg']
imfile{4} = [imfolder '/' '4.jpg']
imfile{5} = [imfolder '/' '5.jpg']
% imfile{6} = [imfolder '/' '6.jpg']
% imfile{7} = [imfolder '/' '7.jpg']
% imfile{8} = [imfolder '/' '8.jpg']

im = cell(im_n,1);
for ii = 1:im_n
    im{ii} = imread(imfile{ii});
end

edge_list = [
    1,2;
    2,3;
    3,4;
    4,5;
    % 5,6;
    % 6,7;
    % 7,8;
];

imsize = zeros(im_n, 3);

for ii = 1:im_n
    imsize(ii,:) = size(im{ii});
    % 宽不超过 720
    if imsize(ii,1) > 800
        scale = 800/size(im{ii}, 1);
        im{ii} = imresize(im{ii}, scale);

        imsize(ii,:) = size(im{ii});
    end
end

mosaic = REW_mosaic( im, edge_list, 0, 'persp', 0, imfolder );
% parm2: edge_list, 可以为[]
% parm3: ref图片的index, 如果为0则没有参考图像, 倾向于全局
% parm4: 'persp'(正常) 或 'equi'(球面透视)
% parm5: ransac的阈值
%}