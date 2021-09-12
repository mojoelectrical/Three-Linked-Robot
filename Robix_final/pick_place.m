% fprintf(fid,'%%%%%%%%object %i;\r\n',objectnumb);

fprintf(fid,'move 1 to %i, 2 to %i;\r\n',round(theta_1_u),round(theta_2_u));
fprintf(fid,'move 5 to %i;\r\n',round(theta_5_u));
fprintf(fid,'move 3 to %i, 4 to %i;\r\n',round(theta_3_u),round(theta_4_u));
if pick
    fprintf(fid,'move 6 to %i;\r\n',-250); %%Check value to close gripper
else
    fprintf(fid,'move 6 to %i;\r\n',-1300); %%Check value to open gripper 
end
fprintf(fid,'move 3 to %i, 4 to %i;\r\n',0,0);
