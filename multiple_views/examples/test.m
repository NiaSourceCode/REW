%% ANAP-building
% %{
% imfolder = 'images/test';
% imfolder = 'images/fcase_foundation';
imfolder = '../../database/GSP_1';
im_n = 2;
imfile = cell(im_n,1);
% imfile{1} = [imfolder '\' '01.png'];
% imfile{2} = [imfolder '\' '02.png'];
% imfile{1} = [imfolder '\' 'Maneki-neko_01.jpg']
% imfile{2} = [imfolder '\' 'Maneki-neko_02.jpg']
imfile{1} = [imfolder '\' '01.jpg']
imfile{2} = [imfolder '\' '02.jpg']
% imfile{1} = [imfolder '\' 'foundation_01.JPG']
% imfile{2} = [imfolder '\' 'foundation_02.JPG']

im = cell(im_n,1);
for ii = 1:im_n
    im{ii} = imread(imfile{ii});
end

edge_list = [1,2];

imsize = zeros(im_n,3);

for ii = 1:im_n
    imsize(ii,:) = size(im{ii});
    if imsize(ii,1) > 720
        scale = 720/size(im{ii}, 1);
        im{ii} = imresize(im{ii}, scale);

        imsize(ii,:) = size(im{ii});
    end
end

mosaic = REW_mosaic( im, edge_list, 1, 'persp', 0, imfolder );
%}