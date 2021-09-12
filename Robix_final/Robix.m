clc;
clear;
fid=fopen('Robix.txt','w');
fprintf(fid,'move 6 to %i;\r\n',-1300); %%Check value to open gripper
% % Image Processing
    image_pro
%%Check image processing %%ERASE! just to check errors
    figure;
    imagesc(pic_parts);

%%Obtain objects' coordinates with respect to robot
    transform;

%%Pick, move and place objects
    translation2;
    
fclose(fid);